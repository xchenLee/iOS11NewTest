# What’s New in iOS 11


> Your apps can now become more intelligent using the power of machine learning with Core ML. You can create incredible augmented reality experiences with ARKit. And you can deliver a more unified and immersive user experience with new multitasking features, including drag and drop for iPad, the new Files app, new camera APIs, new SiriKit domains, Apple Music integration, and more.

上面这段话，是官网对iOS11新特性的总结：

*  **CoreML**，机器学习库
*  **ARKit**，增强现实
*  **Drag and drop for iPad**，拖拽实现
*  **New File app**， 文档app
*  **Camera API update**， 新相机API
*  **Apple Music**， 集成Apple Music



## Drag and Drop
[官方文档地址](https://developer.apple.com/documentation/uikit/drag_and_drop?language=objc)

这个特性，在iPad上比较好。用这个可以将item从一个屏幕拖拽到另外一个屏幕，可以在app内使用，也可以跨app使用。

> 需要注意的一点是，iPad这些特性都支持，但是iPhone只支持app内的拖拽，但是我自己试着写了一个demo，在iPhone上根本不响应事件，断点delegate都不走

下面是官网贴的一个图片，可以从相册把一张图拖拽到邮件里作为附件

![](images/drag.png)


## File Management
更新了iOS11系统之后，会发现手机多了一个叫文件的app，可用来展示本地文件和云盘文件，对于一些网盘app会比较好用，提供了一个系统级的Controller给你用，这个说是高度支持UI自定义

> UIDocumentBrowserViewController
> 
> class UIDocumentBrowserViewController { 
> init(forOpeningFilesWithContentTypes: [String]?)  
> var delegate: UIDocumentBrowserViewControllerDelegate?  
> }
    
    
## UI Refinements

1. **UINavigationBar 增加了大字模式**
2. **UITableViewCell 增加了Swipe Action**


## session230：Advanced Animation with UIKit
[session230](https://developer.apple.com/videos/play/wwdc2017/230/)这个session我专门从头看到尾了，就把笔记记下来，

下面列一下我们做动画的几种方式

1.UIView-based Animations

这种动画，我们基本不能怎么控制，一句话就直接开始了

2.UIViewPropertyAnimator

这种动画，我们可以控制它什么时候开始，也能控制时间函数，session里着重讲了timing的集中方式linear, easeIn, easeOut

* Custom timing
* Interactive 
* Interrupible
* Responsive

3.Interactively animating

这里用了控制中心的小控件做例子，比如加上UIPangesture，这里加了手势，来控制动画
我们可以Pause ，Continue

4.Interruptible Animations

这里举了个例子就是Mobile Safari，用户滑动页面

5.UIViewPropertyAnimator in iOS11

`var scrubsLinearly: Bool`

`var pausesOnCompletion: Bool`

## session242:The Keys to a Better   Text Input Experience
这个Session 主要讲了，如何提高输入体验，就是键盘相关的，我想大家如果用UITextfield，或者聊天相关的可能会需要注册键盘事件的广播，来调整布局，比如

`UIKeyboardDidShow`

`UIKeyboardDidHide `

`UIKeyboardDidChangeFrame`

这个session针对UITableView和UIScrollView，以及一些不能滑动的控件提出了好的编码建议

一个是针对输入框，可以自动填写密码，


## session245：Building Apps with Dynamic type


这一篇主要讲的是iPhone为了一些特殊群体，比如老人，近视小孩，还有工作一天疲劳的白领等等，提出了大字模式，在设置里的
Display & Brightness 里 改变字体大小。

但是UI会变形，我看了一下系统app，基本都没有问题，只有react-native部分会有些问题，这里提到了适配
iOS 为这些增加了一些API,这个session主要是几点

*1.可变的Font sizes*

*2.适配大字*

*3.适配UITableView*

*4.适配图片*

下面是简单的对文字的缩放截图了几个，就是通过xib属性面板和代码都可以做到，之前写死的frame 大小，必须得改一下了。UITableView的，只要是做了auto-sizingCell，都会很好自己是配，Session最后还给了怎么给H5页面是配的方案，我这里不一一列举，就是大家以后如果遇到相关的需求，可以查阅一下这个session，

![](images/large-text01.png)

![](images/large-text03.png)

![](images/large-text02.png)






## Core ML 
支持层数超过30层的深度学习之外，还支持决策树的融合，SVM（支持向量机），线性模型。由于其底层建立在Metal 和Accelerate等技术上，所以可以最大限度的发挥CPU和GPU的优势。你可以在移动设备上运行机器学习模型

[官网文档](https://developer.apple.com/documentation/coreml)


### Vison
这个是基于ML的，可以进行脸部追踪，识别，文字检测，二维码检测，物体识别

[官网文档](https://developer.apple.com/documentation/vision)

### Natural Language Processing
包括语言识别，分词，词性还原，词性判定，实体辨识
