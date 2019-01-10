//
//  XLPresentationViewController.h
//  XL3DTouchDemo
//
//  Created by Mac-Qke on 2019/1/10.
//  Copyright © 2019 Mac-Qke. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XLPresentationViewController : UIViewController
@property (nonatomic, strong) NSMutableArray *arrData;

@property (nonatomic, assign) NSInteger index;

@property (nonatomic, copy) NSString *strInfo;
@end

NS_ASSUME_NONNULL_END
