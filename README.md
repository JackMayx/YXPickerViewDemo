# YXPickerViewDemo
城市选择（数据支持本地和网络），有问题随时沟通

![image](https://github.com/XiAnRuFeng/YXPickerViewDemo/blob/master/IMG_0933.GIF)

```
使用方式
    
    下载Demo,将YXPickerView拖入工程中，根据自己的项目需求进行数据的匹配。
    支持本地数据和网络数据。
    Model的解析使用的是MJ老师的KakaJSON
    

    ///初始化
     let chooseView = YXChooseView(frame: CGRect(x: 0, y: self.view.yx.height, width: self.view.yx.width, height: 400))
     ///选择的城市数据
      chooseView.chooseCityName = { titleArray in
       }

备注：数据传递根据自己需求去做就OK

```
[KakaJSON链接地址](https://github.com/kakaopensource/KakaJSON)
