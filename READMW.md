简介
Masonry 就是第三方为我们封装好的一个 AutoLayout 框架。其使用点语法，可以非常便利的添加 AutoLayout约束，且通俗的语法让人非常容易理解。
集成方式
Masonry 支持 CocoaPods，可以直接通过 podfile 文件进行集成，需要在 CocoaPods 中添加下面代码：

pod 'Masonry'
Masonry使用前注意：
1.在使用Masonry添加约束之前，需要在addSubview方法之后才能使用，否则会导致崩溃。
2.在添加约束时初学者经常会出现一些错误，约束出现问题的原因一般就是两种：约束冲突和缺少约束。对于这两种问题，可以通过调试和log排查。
3.之前使用 Interface Builder 添加约束，如果约束有错误直接就可以看出来，并且会以红色或者黄色警告体现出来。而 Masonry 则不会直观的体现出来，而是以运行过程中崩溃或者打印异常log体现，所以这也是手写代码进行 AutoLayout 的一个缺点。这个问题只能通过多敲代码，积攒纯代码进行 AutoLayout 的经验，慢慢就用起来越来越得心应手了。
基础语法
Masonry的基础API如下所示:
mas_makeConstraints()    //添加约束
mas_remakeConstraints()  //移除之前的约束，重新添加新的约束
mas_updateConstraints()  //更新约束
equalTo()       //参数是对象类型，一般是视图对象或者 mas_width 这样的坐标系对象
mas_equalTo()   //和上面功能相同，参数可以传递基础数据类型对象，可以理解为比上面的API更强大
width()         //用来表示宽度，例如代表view的宽度
mas_width()     //用来获取宽度的值。和上面的区别在于，一个代表某个坐标系对象，一个用来获取坐标系对象的值
其基础的设置属性如下:
1.尺寸：width、height、size。
2.边界：left、leading、right、trailing、top、bottom、edges。
3.中心点：center、centerX、centerY。
4.偏移量：offset、insets、sizeOffset、centerOffset。
5.priority()约束优先级（0~1000），multipler乘因数,dividedBy除因数。

大小关系有三种:
1.equalTo，相等。
2.lessThanOrEqualTo，小于等于。
3.greaterThanOrEqualTo，大于等于。

Auto Boxing
上面例如equalTo或者width这样的，有时候需要涉及到使用mas_前缀，这在开发中需要注意作区分。
如果在当前类引入#import "Masonry.h"之前，用下面两种宏定义声明一下，就不需要区分mas_前缀。
// 定义这个常量，就可以不用在开发过程中使用mas_前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS
