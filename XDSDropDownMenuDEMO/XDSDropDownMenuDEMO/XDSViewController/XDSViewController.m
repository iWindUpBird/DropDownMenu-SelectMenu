//
//  XDSViewController.m
//  XDSDropDownMenu
//
//  Created by cdj on 2018/6/9.
//  Copyright © 2018年 itiis. All rights reserved.
//

#import "XDSViewController.h"

#import "XDSDropDownMenu.h"

@interface XDSViewController ()<XDSDropDownMenuDelegate>
@property (weak, nonatomic) IBOutlet UIButton *nameButton;
@property (weak, nonatomic) IBOutlet UIButton *downButton;
@property (weak, nonatomic) IBOutlet UIButton *upButton;
@property (weak, nonatomic) IBOutlet UIButton *sexButton;


@property (nonatomic, strong)  NSArray *buttonArray;
@property (nonatomic, strong)  NSArray *dropDownMenuArray;

@end

@implementation XDSViewController{
    
    XDSDropDownMenu *nameDropDownMenu;
    XDSDropDownMenu *downDropDownMenu;
    XDSDropDownMenu *upDropDownMenu;
    XDSDropDownMenu *sexDropDownMenu;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setArrays]; //配置buttonArray和dropDownMenuArray
    [self setButtons];//设置按钮边框和圆角
    
    
}

#pragma mark - 配置buttonArray和dropDownMenuArray
- (void)setArrays{
    
    //将所有按钮加入buttonArray数组
    self.buttonArray = @[self.nameButton,self.downButton,self.upButton,self.sexButton];
    
    //初始化所有DropDownMenu下拉菜单
    nameDropDownMenu = [[XDSDropDownMenu alloc] init];
    downDropDownMenu = [[XDSDropDownMenu alloc] init];
    upDropDownMenu = [[XDSDropDownMenu alloc] init];
    sexDropDownMenu = [[XDSDropDownMenu alloc] init];
    
    //将所有DropDownMenu加入dropDownMenuArray数组
    self.dropDownMenuArray = @[nameDropDownMenu,downDropDownMenu,upDropDownMenu,sexDropDownMenu];
    
    //将所有dropDownMenu的初始tag值设为1000
    for (__strong XDSDropDownMenu *nextDropDownMenu in self.dropDownMenuArray) {
        nextDropDownMenu.tag = 1000;
    }
    
    
}




#pragma mark - name按钮
- (IBAction)nameBtnClick:(UIButton *)sender {
    
    NSArray *arr = @[@"xiaoming",@"Sam",@"Tom",@"Jack"];
    
    nameDropDownMenu.delegate = self;//设置代理
    
    //调用方法判断是显示下拉菜单，还是隐藏下拉菜单
    [self setupDropDownMenu:nameDropDownMenu withTitleArray:arr andButton:sender andDirection:@"down"];
    
    //隐藏其它的下拉菜单
    [self hideOtherDropDownMenu:nameDropDownMenu];
}

#pragma mark - down按钮
- (IBAction)downBtnClick:(UIButton *)sender {
    NSArray *arr = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7"];
    downDropDownMenu.delegate = self;//代理
    [self setupDropDownMenu:downDropDownMenu withTitleArray:arr andButton:sender andDirection:@"down"];
    [self hideOtherDropDownMenu:downDropDownMenu];
}

#pragma mark - up按钮
- (IBAction)upBtnClick:(UIButton *)sender {
    NSArray *arr = @[@"1",@"2",@"3"];
    upDropDownMenu.delegate = self;//代理
    [self setupDropDownMenu:upDropDownMenu withTitleArray:arr andButton:sender andDirection:@"up"];
    [self hideOtherDropDownMenu:upDropDownMenu];
    
}

#pragma mark - sex按钮
- (IBAction)sexBtnClick:(UIButton *)sender {
    NSArray *arr = @[@"man",@"woman"];
    sexDropDownMenu.delegate = self;//代理
    [self setupDropDownMenu:sexDropDownMenu withTitleArray:arr andButton:sender andDirection:@"down"];
    [self hideOtherDropDownMenu:sexDropDownMenu];
    
}

- (IBAction)backBtnClick:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - 设置dropDownMenu

/*
 判断是显示dropDownMenu还是收回dropDownMenu
 */

- (void)setupDropDownMenu:(XDSDropDownMenu *)dropDownMenu withTitleArray:(NSArray *)titleArray andButton:(UIButton *)button andDirection:(NSString *)direction{
    
    CGRect btnFrame = button.frame; //如果按钮在UIIiew上用这个
    
    //  CGRect btnFrame = [self getBtnFrame:button];//如果按钮在UITabelView上用这个
    
    
    if(dropDownMenu.tag == 1000){
        
        /*
         如果dropDownMenu的tag值为1000，表示dropDownMenu没有打开，则打开dropDownMenu
         */
        
        //初始化选择菜单
        [dropDownMenu showDropDownMenu:button withButtonFrame:btnFrame arrayOfTitle:titleArray arrayOfImage:nil animationDirection:direction];
        
        //添加到主视图上
        [self.view addSubview:dropDownMenu];
        
        //将dropDownMenu的tag值设为2000，表示已经打开了dropDownMenu
        dropDownMenu.tag = 2000;
        
    }else {
        
        /*
         如果dropDownMenu的tag值为2000，表示dropDownMenu已经打开，则隐藏dropDownMenu
         */
        
        [dropDownMenu hideDropDownMenuWithBtnFrame:btnFrame];
        dropDownMenu.tag = 1000;
    }
}

#pragma mark - 隐藏其它DropDownMenu
/*
 在点击按钮的时候，隐藏其它打开的下拉菜单（dropDownMenu）
 */
- (void)hideOtherDropDownMenu:(XDSDropDownMenu *)dropDownMenu{
    
    for ( int i = 0; i < self.dropDownMenuArray.count; i++ ) {
        
        if( self.dropDownMenuArray[i] !=  dropDownMenu){
            
            XDSDropDownMenu *dropDownMenuNext = self.dropDownMenuArray[i];
            
            CGRect btnFrame = ((UIButton *)self.buttonArray[i]).frame;//如果按钮在UIIiew上用这个
            
            //          CGRect btnFrame = [self getBtnFrame:self.buttonArray[i]];//如果按钮在UITabelView上用这个
            
            [dropDownMenuNext hideDropDownMenuWithBtnFrame:btnFrame];
            dropDownMenuNext.tag = 1000;
        }
    }
}

//#pragma mark - 获取按钮在self.view的坐标(按钮在UITableView上使用这个方法)
/*
 因为按钮在UITableView上是放在cell的contentView上的，所以要通过以下方法获得其在self.view上坐标
 */

//- (CGRect )getBtnFrame:(UIButton *)button{
//    return [button.superview convertRect:button.frame toView:self.view];
//}



#pragma mark - 下拉菜单代理
/*
 在点击下拉菜单后，将其tag值重新设为1000
 */

- (void) setDropDownDelegate:(XDSDropDownMenu *)sender{
    sender.tag = 1000;
}



#pragma mark - 设置按钮边框和圆角
- (void)setButtons{
    for(UIButton *btn in self.buttonArray){
        btn.layer.cornerRadius = 3;
        btn.layer.borderColor = [[UIColor blackColor] CGColor];
        btn.layer.borderWidth = 0.5;
        btn.layer.masksToBounds = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
