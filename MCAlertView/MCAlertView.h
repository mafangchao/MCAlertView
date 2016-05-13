//
//  MCAlertView.H
//  myApp
//
//  Created by machao on 16/5/12.
//  Copyright © 2016年 machao. All rights reserved.
//
/*
    用法
     MCAlertView *alertView = [[MCAlertView alloc] initWithAlertButtonType:MCAlertOne];
     alertView.cancleButtonText = @"算了";
     alertView.finishButtonText = @"认证";
     alertView.titleText = @"投资人认证";
     alertView.detailText = @"认证的投资人身份并通过审核,才可以与项目安排会议";
     [alertView show];
 */
#import <UIKit/UIKit.h>
typedef enum {
    MCAlertOne = 0,      //1个按钮
    MCAlertTwo= 1,       //2个按钮
} MCAlertType;

@interface MCAlertView : UIView


/// 详细内容
@property(nonatomic,copy)NSString * detailText;
/// 标题内容
@property(nonatomic,copy)NSString * titleText;
/// 确定按钮标题
@property(nonatomic,copy)NSString * finishButtonText;
/// 取消按钮标题
@property(nonatomic,copy)NSString * cancleButtonText;
/**
 *  取消按钮点击回掉
 */
@property(nonatomic,copy)void(^cancelBlock)();
/**
 *  结束按钮点击回掉
 */
@property(nonatomic,copy)void(^finishBlock)();
/// 初始化方法
///
/// @param type alert类型
///
/// @return 
- (instancetype)initWithAlertButtonType:(MCAlertType)type;
/// 展示
-(void)show;

@end
