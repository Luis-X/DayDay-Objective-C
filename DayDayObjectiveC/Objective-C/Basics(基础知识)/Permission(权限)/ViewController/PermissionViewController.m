//
//  PermissionViewController.m
//  LuisXKit
//
//  Created by LuisX on 2016/12/30.
//  Copyright © 2016年 LuisX. All rights reserved.
//

#import "PermissionViewController.h"
#import "SJPermissionManager.h"
#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface PermissionViewController ()<UITableViewDataSource, UITableViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation PermissionViewController{
    NSMutableArray *_allPermissionArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _allPermissionArray = @[@"相机", @"相册", @"通知", @"网络", @"麦克风", @"定位", @"通讯录", @"日历", @"备忘录"];
    
    UITableView *mainTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    mainTableView.backgroundColor = [UIColor whiteColor];
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
    [mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:mainTableView];
    [mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(self.view);
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _allPermissionArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [_allPermissionArray objectAtIndex:indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
#pragma mark -UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //相机
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        BOOL open = [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionCamera];
        if (open) {
            //打开系统相机
            [self openSystemUIImagePickerControllerWithSourceType:UIImagePickerControllerSourceTypeCamera];
        }
        
    }
    //相册
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        BOOL open = [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionPhotoLibrary];
        if (open) {
            //打开系统相册
            [self openSystemUIImagePickerControllerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        }

    }
    //通知
    if (indexPath.section == 0 && indexPath.row == 2) {
        
        BOOL open = [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionNotification];
        [LuisXKit showWindowsOnlyTextHUDText:open ? @"开启" : @"关闭"];
        
    }
    //网络
    if (indexPath.section == 0 && indexPath.row == 3) {

        [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionNetwork];
        
    }
    //麦克风
    if (indexPath.section == 0 && indexPath.row == 4) {
       
        BOOL open = [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionAudio];
        [LuisXKit showWindowsOnlyTextHUDText:open ? @"开启" : @"关闭"];
        
    }
    //定位
    if (indexPath.section == 0 && indexPath.row == 5) {
     
        BOOL open = [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionLocation];
        [LuisXKit showWindowsOnlyTextHUDText:open ? @"开启" : @"关闭"];

    }
    //通讯录
    if (indexPath.section == 0 && indexPath.row == 6) {
      
        BOOL open = [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionAddressBook];
        [LuisXKit showWindowsOnlyTextHUDText:open ? @"开启" : @"关闭"];
        
    }
    //日历
    if (indexPath.section == 0 && indexPath.row == 7) {
        
        BOOL open = [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionCalendar];
        [LuisXKit showWindowsOnlyTextHUDText:open ? @"开启" : @"关闭"];
        
    }
    //备忘录
    if (indexPath.section == 0 && indexPath.row == 8) {

        BOOL open = [[SJPermissionManager shareSJPermissionManager] iPhoneSystemPermissionReminder];
        [LuisXKit showWindowsOnlyTextHUDText:open ? @"开启" : @"关闭"];
        
    }
    
}

-(void)openPhotoLibrary{

    // 进入相册
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
        imagePicker.allowsEditing = YES;
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:^{
            
            NSLog(@"打开相册");
            
        }];
        
    }
    
    else
        
    {
        
        NSLog(@"不能打开相册");
        
    }
    
}

/**
 *  打开系统相机或相册
 */
- (void)openSystemUIImagePickerControllerWithSourceType:(UIImagePickerControllerSourceType)sourceType{
    // 创建图像选取控制器对象
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    // 将资源类型设置为相机类型
    picker.sourceType = sourceType;
    // 设置拍照后的图片允许编辑
    picker.allowsEditing = NO;
    // 设置摄像图像品质,默认是UIImagePickerControllerQualityTypeMedium
    picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
    // 设置最长摄像时间,默认是10秒
    picker.videoMaximumDuration = 30;
    // 设置代理,需要遵守<UINavigationControllerDelegate, UIImagePickerControllerDelegate>两个协议
    picker.delegate = self;
    // 弹出图像选取控制器
    [self presentViewController:picker animated:YES completion:nil];
    
}

#pragma mark -UIImagePickerControllerDelegate
// 操作完成
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage *resultImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    if (resultImage != nil) {
        
    }
    
    // 回收图像选取控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}

// 操作取消
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    // 回收图像选取控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
}
@end
