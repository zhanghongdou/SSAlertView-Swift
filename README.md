# SSAlertView-Swift
封装了一个swift版本的根据内容自动约束的alertView，希望大家能够喜欢，并给予指点

<html>
<body>
<h2>什么是SSAlertView-Swift</h2>
<p>在日常我们写程序的时候往往都是离不开弹窗的，但是系统的弹窗又先的特别单调，所以，小编在不是很忙的时候封装了一个弹窗，也就是SSAlertView-Swift，它可以随着开发者的需要以不同的形式显示，同时，又能够根据内容的大小进行自动调整，而开发者只需要简单的代码就能实现View的弹出</p>

<h2>效果图展示</h2>

<h3>效果图1</h3>
<p><img src="file:///Users/ailishi/Desktop/picture/346D2308-E0E8-4A59-86E3-33294560EFBB.png"/></p>

<h3>效果图2</h3>
<p><img src="file:///Users/ailishi/Desktop/picture/A92A34A2-1C29-4138-8525-9BEA796EEF49.png"/></p>
<h3>效果图3</h3>
<p><img src="file:///Users/ailishi/Desktop/picture/CBF51BA1-0143-4424-B3DE-83EC23169CB0.png"/></p>
<h3>效果图4</h3>
<p><img src="file:///Users/ailishi/Desktop/picture/58B3726A-799A-4C43-B67B-6B52F6D8087E.png"/></p>
<h3>效果图5</h3>
<p><img src="file:///Users/ailishi/Desktop/picture/5AE7CA22-B4B5-4FE7-820A-C7C816A1F8F6.png"/></p>

<h2>使用方法</h2>
<p>self.alertView = SSAlertView.init(title: "温馨提示", message: "请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意请注意", cancelButtonTitle: "取消", otherButtonTitles: ["按钮1", "按钮2"])<br/>
        self.alertView?.mode = .Success<br/>
        self.alertView?.leaveMode = .Top<br/>
        self.alertView?.clickIndex = {(index: NSInteger) in<br/>
            print("您点击的按钮下标是\(index)")<br/>
        }<br/>
        self.alertView?.show()<br/>
        </p>
</body>

</html>