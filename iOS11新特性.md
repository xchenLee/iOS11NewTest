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
更新了iOS11系统之后，会发现手机多了一个叫文件的app，可用来展示本地文件和云盘文件，对于一些网盘app会比较好用，提供了一个系统级的Controller给你用，

> UIDocumentBrowserViewController

`class UIDocumentBrowserViewController {   init(forOpeningFilesWithContentTypes: [String]?)  
    var delegate: UIDocumentBrowserViewControllerDelegate?  }`
    
    
## UI Refinements

1. **UINavigationBar 增加了大字模式**
2. **UITableViewCell 增加了Swipe Action**


## Advanced Animation with UIKit
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

var scrubsLinearly: Bool
var pausesOnCompletion: Bool






## Core ML 
支持层数超过30层的深度学习之外，还支持决策树的融合，SVM（支持向量机），线性模型。由于其底层建立在Metal 和Accelerate等技术上，所以可以最大限度的发挥CPU和GPU的优势。你可以在移动设备上运行机器学习模型

[官网文档](https://developer.apple.com/documentation/coreml)


### Vison
这个是基于ML的，可以进行脸部追踪，识别，文字检测，二维码检测，物体识别

[官网文档](https://developer.apple.com/documentation/vision)

### Natural Language Processing
包括语言识别，分词，词性还原，词性判定，实体辨识
