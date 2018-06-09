# DropDownMenu-SelectMenu
iOS封装下拉选择菜单

介绍和使用方法请参考简书链接：https://www.jianshu.com/p/29f444b220bc




1. 说一下实现思路：

    （1）下拉菜单使用tableview实现；

    （2）点击选择按钮后，根据按钮在self.view的frame来确定菜单要显示或隐藏的位置，并使用菜单的tag值来确定是关闭还是打开。对于frame的确定，由于在UITableView中，按钮是加在cell的contentview上的，所以在UITableView中，要使用  [button.superview convertRect:button.frame toView:self.view]  方法来获得按钮在self.view上的frame。

    （3）在点击按钮后，要隐藏其它的下拉选择菜单。

    （4）打开和隐藏菜单都是通过动画来实现的，代码如下。

[UIView beginAnimations:nil context:nil];

。。。。

[UIView commitAnimations];

    （5）在点击了菜单的选项后，隐藏这个菜单（这一步通过代理实现），并将文字显示到按钮上。

2. 使用方法

Demo里面有一个XDSDropDownMenu文件夹，直接拖入到你的项目中。

然后#import "XDSDropDownMenu.h"

至于后面怎么使用，可以去看我的Demo，代码的注释写的很详细。里面分了在UIView和UITballeView中的使用方法，其实，在两个中的使用大多代码是一样的，只是获取按钮在self.view的坐标不一样。

如果你的按钮的frame使用的不太对的话，会造成一些“特效”——菜单消失的位置会有变化，其实也挺好玩的，想试一下的同学可以试一下不同的frame。

参考的GitHub的Demo：NIDropDown（但是这个用起来会有bug）
