//
//  MCAlertView.m
//  myApp
//
//  Created by machao on 16/5/12.
//  Copyright © 2016年 machao. All rights reserved.
//

#import "MCAlertView.h"
#import "Masonry/Masonry.h"

#define TAGNORMAL 6000
#define kAlertViewMargin 15
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface MCAlertView ()
@property(nonatomic,weak)UIView * subView;
@property(nonatomic,assign)MCAlertType  selectType;
@end

@implementation MCAlertView



- (instancetype)initWithAlertButtonType:(MCAlertType)type
{
    self = [super init];
    if (self) {
        self.selectType = type;
        
    }
    return self;
}


-(void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self setupUI];
}

-(void)setupUI{
    self.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UIView *subView = [[UIView alloc] init];
    self.subView = subView;
    subView.backgroundColor  = [UIColor whiteColor];
    [self addSubview:subView];
    subView.layer.cornerRadius = 2;
    UILabel *titleLabel = [[UILabel alloc] init];
    [subView addSubview:titleLabel];
    titleLabel.font = [UIFont systemFontOfSize:16.0];
    titleLabel.text = self.titleText;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(subView);
        make.trailing.equalTo(subView);
        make.top.equalTo(subView).offset(20);
    }];
    UILabel *detailLabel = [[UILabel alloc] init];
    detailLabel.font = [UIFont systemFontOfSize:14.0];
    detailLabel.numberOfLines = 0;
    detailLabel.text = self.detailText;
    [subView addSubview:detailLabel];
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(subView).offset(kAlertViewMargin);
        make.trailing.equalTo(subView).offset(-kAlertViewMargin);
        make.top.equalTo(titleLabel.mas_bottom).offset(kAlertViewMargin);
    }];
    
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [subView addSubview:cancelBtn];
    cancelBtn.tag = TAGNORMAL + 1;
    [cancelBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setTitle:self.cancleButtonText forState:UIControlStateNormal];
    [cancelBtn setTintColor:[UIColor orangeColor]];
    [cancelBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    cancelBtn.contentEdgeInsets = UIEdgeInsetsMake(1, 1, 1, 1);
    cancelBtn.layer.borderWidth = 1;
    cancelBtn.layer.borderColor = [UIColor orangeColor].CGColor;
    cancelBtn.layer.cornerRadius = 2;
    [cancelBtn setBackgroundColor:[UIColor whiteColor]];
    UIButton *finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [subView addSubview:finishBtn];
    finishBtn.tag = TAGNORMAL +2;
    [finishBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [finishBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [finishBtn setBackgroundColor:[UIColor orangeColor]];
    finishBtn.layer.cornerRadius = 2;
    [finishBtn setTitle:self.finishButtonText forState:UIControlStateNormal];
    if (self.selectType == MCAlertTwo) {
        [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(subView).offset(15);
            make.top.equalTo(detailLabel.mas_bottom).offset(15);
            make.trailing.equalTo(finishBtn.mas_leading).offset(-20);
            make.height.equalTo(@(44));
            make.width.equalTo(finishBtn);
        }];
        [finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(cancelBtn);
            make.trailing.equalTo(subView).offset(-15);
            make.height.equalTo(cancelBtn);
        }];
    }else if (self.selectType == MCAlertOne){
        [finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(subView).offset(15);
            make.top.equalTo(detailLabel.mas_bottom).offset(15);
            make.trailing.equalTo(subView).offset(-15);
            make.height.equalTo(@(44));
        }];
    }
   
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.leading.equalTo(self).offset(15);
        make.trailing.equalTo(self).offset(-15);
        make.bottom.equalTo(finishBtn).offset(kAlertViewMargin);
    }];
}

-(void)buttonClick:(UIButton *)sender{
    if (sender.tag == TAGNORMAL +1) {
        
        
        
        [self.subView removeFromSuperview];
        [self removeFromSuperview];
        self.subView = nil;
        if (self.cancelBlock) {
            self.cancelBlock();
        }
        
    } else if (sender.tag == TAGNORMAL +2){
        
        
        [self.subView removeFromSuperview];
        [self removeFromSuperview];
        self.subView = nil;
        if (self.finishBlock) {
            self.finishBlock();
        }
        
    }
    
}

@end
