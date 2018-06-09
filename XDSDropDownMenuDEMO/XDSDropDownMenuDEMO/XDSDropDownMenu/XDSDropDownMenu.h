//
//  XDSDropDownMenu.h
//  shts_ios_xds
//
//  Created by cdj on 2018/5/8.
//  Copyright © 2018年 itiis. All rights reserved.
//

#pragma mark - 选择菜单封装类

#import <UIKit/UIKit.h>

@class XDSDropDownMenu;
@protocol XDSDropDownMenuDelegate
@required
- (void)setDropDownDelegate:(XDSDropDownMenu *)sender;//设置下拉菜单的tag值
@end

@interface XDSDropDownMenu : UIView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) id <XDSDropDownMenuDelegate> delegate;//代理
@property (nonatomic, retain) NSString *animationDirection;//动画方向
@property (nonatomic, strong) UIImageView *imageView;//图片视图

//隐藏选择菜单
- (void)hideDropDownMenuWithBtnFrame:(CGRect)btnFrame;


//返回选项的下标
+ (NSInteger)returnIndexByString:(NSString *)string fromArray:(NSArray *)array;

//显示选择菜单
/*
 button 选择按钮
 buttonFrame 选择按钮在self.view的frame
 titleArr 选择菜单的文本数组
 imageArr 选择菜单的图片数组
 direction 选择菜单的方向：down 或者 up
 */
- (void)showDropDownMenu:(UIButton *)button withButtonFrame:(CGRect)buttonFrame arrayOfTitle:(NSArray *)titleArr arrayOfImage:(NSArray *)imageArr animationDirection:(NSString *)direction;
@end
