//
//  XLPresentationViewController.m
//  XL3DTouchDemo
//
//  Created by Mac-Qke on 2019/1/10.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import "XLPresentationViewController.h"

@interface XLPresentationViewController ()
@property (nonatomic, strong) UILabel *labInfomation;
@end

@implementation XLPresentationViewController

- (UILabel *)labInfomation {
    if (!_labInfomation) {
        _labInfomation = [[UILabel alloc] init];
    }
    
    return _labInfomation;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self configLabel];
}


- (void)configLabel {
    self.labInfomation.text = [NSString stringWithFormat:@"通过点击下标为[%@]进来的",self.strInfo];
    self.labInfomation.textColor = [UIColor blackColor];
    self.labInfomation.textAlignment = NSTextAlignmentCenter;
    self.labInfomation.frame = CGRectMake(0, 0, 200, 30);
    [self.labInfomation sizeToFit];
    CGPoint center = CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2);
    self.labInfomation.center = center;
    
    [self.view addSubview:self.labInfomation];
}

#pragma mark - 3D Touch 预览Action代理
- (NSArray<id<UIPreviewActionItem>> *)previewActionItems {
    NSMutableArray *arrItem = [NSMutableArray array];
    
    UIPreviewAction *previewAction0 = [UIPreviewAction actionWithTitle:@"取消" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"didClickCancel");
    }];
    
    UIPreviewAction *previewActions1 = [UIPreviewAction actionWithTitle:@"替换该元素" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        //把下标为index的元素替换成preview
        [self replaceItem];
    }];
    
    [arrItem addObjectsFromArray:@[previewAction0, previewActions1]];
    
    return arrItem;
}


- (void)replaceItem{
    if (self.arrData.count <= 0) {
        return;
    }
    
    [self.arrData replaceObjectAtIndex:self.index withObject:@"replace  item"];
    
    //发送通知更新数据
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NOTIFICATION_RELOADDATA" object:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
