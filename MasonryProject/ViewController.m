//
//  ViewController.m
//  MasonryProject
//
//  Created by 纵昂 on 2019/5/5.
//  Copyright © 2019 纵昂. All rights reserved.
//  iOS开发之Masonry
/**
 Masonry 就是第三方为我们封装好的一个 AutoLayout 框架。其使用点语法，可以非常便利的添加 AutoLayout约束，且通俗的语法让人非常容易理解。
 **/

// 定义这个常量，就可以不用在开发过程中使用mas_前缀。
#define MAS_SHORTHAND
// 定义这个常量，就可以让Masonry帮我们自动把基础数据类型的数据，自动装箱为对象类型。
#define MAS_SHORTHAND_GLOBALS


#import "ViewController.h"
#import "Masonry.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
/**
 修饰语
 Masonry为了让代码使用和阅读更容易理解，所以直接通过点语法就可以调用，还添加了and和with两个方法。这两个方法内部实际上什么都没干，只是在内部将self直接返回，功能就是为了更加方便阅读，对代码执行没有实际作用。
 例如下面的例子
 make.top.and.bottom.equalTo(self.containerView).with.offset(padding);
 **/
    
//    添加约束 设置Size
// 我们先简单创建一个UIView视图。
    UIView *view = [[UIView alloc] init];
    view.backgroundColor =  [UIColor redColor];
// 要在加入视图之后再设置它的约束。
    [self.view addSubview:view];
    
    // 使用Masonry添加约束。
//    [view makeConstraints:^(MASConstraintMaker *make) {
//        // 设置宽度和高度为100
//        // euqalTo(@100),这里不用mas前缀的话，参数要加@.
//        // 如果我们想要直接使用数字的话，Masonry提供了mas_前缀。
//        // 这个前缀会自动将基础数据类型转换为NSNumber类型。
//        // 这个过程叫做封箱(Auto Boxing)。
//        // "mas_xx"开头的宏定义，内部都是通过MASBoxValue()函数实现的。
//        // 这样的宏定义主要有四个，分别是mas_equalTo()、mas_offset()和大于等于、小于等于四个。
//        // 不过因为引用了开头两个宏定义。所以这里应该不加也没事。
//
//    }];
//  就如上面我们所介绍的，mas_makeConstraints() 是添加约束的方法，其参数是一个block代码块，我们在代码块中添加约束。
    
    
//   倍数
//  我们可以设置子视图为父视图某个参数的多少多少倍，这在 Masonry 中我们使用 multipliedBy就可以做到:
//    [view makeConstraints:^(MASConstraintMaker *make) {
//        // multipliedBy设置系数。为父视图的一半。
//        make.size.equalTo(self.view).multipliedBy(0.5);
//    }];
    
    
    
/**
 中心点
 我们可以直接设置视图的center等于其他视图，来达到水平剧中的目的。
 **/
//    [view makeConstraints:^(MASConstraintMaker *make) {
//        // 中心和视图的中心对齐。
//        make.center.equalTo(self.view);
//        // 相当于下面这两句
//        // self.view.mas_centerX这句话可以直接写self.view
//        make.centerX.equalTo(self.view.centerX);
//        make.centerY.equalTo(self.view.centerY);
//    }];
    
    
//    边距
//    [view makeConstraints:^(MASConstraintMaker *make) {
//        // 设置四周的边距。如果还设置了宽度和高度，则边距只有左和上生效。
//        // 这里参数不能直接写数值了。不过这里不用区分正负。
//        // insets不用区分正负，可以四个边距一起设置，但是缺点是写的稍微有点长
//        // offset区分正负，如果4个边距用offset(10)的话，右下两个边距就会出问题
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(50, 50, 50, 50));
//        // 如果边距分开设置的话，就需要区分正负了。但是可以直接写数值。
//        make.left.and.top.equalTo(self.view).offset(50);
//        make.right.and.bottom.equalTo(self.view).offset(-50);
//    }];
    
    
//    优先级
    /**
     Masonry为我们提供了三个默认的方法，priorityLow()、priorityMedium()、priorityHigh()，这三个方法内部对应着不同的默认优先级。
     除了这三个方法，我们也可以自己设置优先级的值，可以通过priority()方法来设置。
     */
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//        make.width.equalTo(self.view).priorityLow();
//        make.width.mas_equalTo(20).priorityHigh();
//        make.height.equalTo(self.view).priority(200);
//        make.height.mas_equalTo(100).priority(1000);
//    }];
    
    
//    更新约束
/**
 [控件 mas_remakeConstraints:^(MASConstraintMaker *make) {
 //这个方法会将以前的约束全部删除，添加新的约束
 }];
 [控件 mas_updateConstraints:^(MASConstraintMaker *make) {
 //这个方法将会覆盖以前的某些特定的约束
 }];
 
 **/
    
// 我们这里用第二个方法举个例子:
    // GCD方法，在显示出来两秒之后执行block代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // updateConstraints更新约束。这个方法将会覆盖以前的某些特定的约束
        [view updateConstraints:^(MASConstraintMaker *make) {
            
            // 在updateConstraints里，如果原先的size是有multipliedBy的，那么重新添加的size约束会有问题。
            // 如果原先的size约束没有multipliedBy，那么给size再添加multipliedBy不会出问题。
            
            // 这里如果给比0.5小的值，它就会消失。
            // 如果给0.5大的值，就没有任何效果。
            make.size.equalTo(self.view).multipliedBy(0.3);
            
            // 如果原先是直接写值的话，这里就没问题，可以变大也可以变小。
            // 结论，并不是只能往小里面改变。应该是multipliedBy的问题。
            make.size.equalTo(50);
            
            // 不会覆盖四个边距。只会覆盖原先的center约束。
            make.center.equalTo(self.view);
        }];
    });
/**
 从上面我们可以发现，mas_updateConstraints()只会更新与其对应的约束，而center可不算边界约束哦，它应该只会覆盖对应的center约束，而不会覆盖left之类的边界约束。
 **/
    
    
//    使用示例
    UILabel *testLabel = [[UILabel alloc] init];
    [self.view addSubview:testLabel];
    /*
     * 为Label设置约束。
     * 现在Label可以在约束范围内自适应它内容的高度和宽度
     */
    [testLabel makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        // 宽度小于等于200。
        make.width.lessThanOrEqualTo(200);
        // 高度大于等于100。
        make.height.greaterThanOrEqualTo(100);
    }];
    testLabel.text = @"这是测试的字符串。能看到1、2、3个步骤，第一步当然是上传照片了，要上传正面近照哦。上传后，网站会自动识别你的面部，如果觉得识别的不准，你还可以手动修改一下。左边可以看到16项修改参数，最上面是整体修改，你也可以根据自己的意愿单独修改某项，将鼠标放到选项上面，右边的预览图会显示相应的位置。";
    // 想要自适应Lable的Size的话一定要加这一行。否则没有效果。
    testLabel.numberOfLines = 0;
    
    
    
/**
 三个等高视图
 下面的例子是通过给equalTo()方法传入一个数组，设置数组中子视图及当前make对应的视图之间等高。
 **/
    
//    UIView *redView = [[UIView alloc] init];
//    redView.backgroundColor =  [UIColor redColor];
//    UIView *greenView = [[UIView alloc] init];
//    greenView.backgroundColor =  [UIColor greenColor];
//    UIView *yellowView = [[UIView alloc] init];
//    yellowView.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:redView];
//    [self.view addSubview:greenView];
//    [self.view addSubview:yellowView];
//    CGFloat padding = 10.0f;
//    [redView makeConstraints:^(MASConstraintMaker *make) {
//        // 这种样子的写法也可以。
//        make.top.and.left.and.right.equalTo(self.view).insets(UIEdgeInsetsMake(padding, padding, 0, padding));
//
//        // 这个地方要给greenView的top值。不给不行。
//        make.bottom.equalTo(greenView.top).offset(-padding);
//    }];
//    [greenView makeConstraints:^(MASConstraintMaker *make) {
//
//        // 设置左右间距
//        make.left.and.right.equalTo(self.view).offset(padding);
//
//        // 设置下间距
//        make.bottom.equalTo(yellowView.top).offset(-padding);
//    }];
//    [yellowView makeConstraints:^(MASConstraintMaker *make) {
//
//        // 设置左右以及下边距。
//        make.bottom.and.left.and.right.equalTo(self.view).insets(UIEdgeInsetsMake(0, padding, padding, padding));
//
//        // 三个视图高度相等。
//        make.height.equalTo(@[redView, greenView]);
//    }];
    
//    相对父视图垂直居中
/**
 效果:
 
 两个子视图宽度相等，相对水平居中。
 两个子视图左右间距各为10，中间间距为10.
 两个子视图高度固定为150.
 两个子视图整体相对于父视图垂直居中。
 代码如下:
 **/
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor =  [UIColor redColor];
    
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor =  [UIColor greenColor];
    
    [self.view addSubview:redView];
    [self.view addSubview:greenView];
    
    CGFloat padding = 10.0f;
    
    [redView makeConstraints:^(MASConstraintMaker *make) {
        // 设置高度为固定150.
        make.height.equalTo(150);
        // 设置宽度
        make.width.equalTo(greenView);
        // 设置垂直居中对齐。
        make.centerY.equalTo(self.view);
        // 设置左间距
        make.left.equalTo(self.view).offset(padding);
        // 设置右间距
        make.right.equalTo(greenView.left).offset(-padding);
    }];
    
    [greenView makeConstraints:^(MASConstraintMaker *make) {
        // 设置高度为固定150.
        make.height.equalTo(150);
        // 设置宽度
        make.width.equalTo(redView);
        // 设置垂直居中对齐。
        // 下面这两句代码都可以。一个是设置水center的Y值和self.view相等，一个是和redView相等。
        make.centerY.equalTo(self.view);
        //        make.centerY.equalTo(redView);
        // 设置右间距
        make.right.equalTo(self.view).offset(-padding);
    }];
    
/**
 如上可以想到，如果需要设置两个子视图垂直居中，且相对父视图整体水平居中的话。我们可以改为设置两个子视图的centerX值和父视图相等，然后设置其上下间距。
 **/
    
    
}

//其内部代码实现，实际上就是直接将self返回
- (MASConstraint *)with {
    return self;
}

@end
