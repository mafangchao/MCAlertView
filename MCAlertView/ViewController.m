//
//  ViewController.m
//  MCAlertView
//
//  Created by iOS on 16/5/13.
//  Copyright © 2016年 iOS. All rights reserved.
//

#import "ViewController.h"
#import "MCAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    MCAlertView *alertView = [[MCAlertView alloc] initWithAlertButtonType:MCAlertOne];
    alertView.cancleButtonText = @"算了";
    alertView.finishButtonText = @"认证";
    alertView.titleText = @"投资人认证";
    alertView.detailText = @"认证的投资人身份并通过审核,才可以与项目安排会议";
    [alertView show];

}

@end
