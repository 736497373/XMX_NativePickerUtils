# NativePickerUtils

####一个因为在iOS上看flutterPicker不能接受的flutter plugin


## 实现功能包括
 * 单列显示
 * 多列显示



## 使用
``` dart

native_picker_utils:
    git:
      url: https://github.com/736497373/XMX_NativePickerUtils.git


import 'package:native_picker_utils/NativePickerUtils.dart';

```
###单列显示
##### 数据源类型
`List array = ['1', '2', '3'];`

`List array = [
    BRResultBean(index: 0, key: '1', value: '1'),
    BRResultBean(index: 1, key: '2', value: '2')
  ];`

```
 NativePickerUtils.showPicker(context,
 							title: '点击选择', 
 					dataSourceArr: array, 
					  selectIndex: 0).then((value) {
 			                 print(value.toString());
                });
```


###多列显示 
##### 数据源类型
  ` List array = [
    ['1', '2', '3'],
    ['1', '2', '3'],
    ['1', '2', '3']
  ];`
  
  `List array = [
    [
      BRResultBean(index: 0, key: '1', value: '1'),
      BRResultBean(index: 1, key: '2', value: '2'),
    ],
    [
      BRResultBean(index: 0, key: '3', value: '3'),
      BRResultBean(index: 1, key: '4', value: '4')
    ],
    [
      BRResultBean(index: 0, key: '5', value: '5'),
      BRResultBean(index: 1, key: '6', value: '6')
    ]
  ];`
  
```
      NativePickerUtils.showMultiPicker(context,
                   						 title: '点击选择',
                   			     dataSourceArr: array,
                  				   selectIndex: [0, 0, 0]).then((value) {
					                  List values = value;
					                  values.forEach((element) {
					                    print(element.toString());
					               });
                				});
```

## Getting Started

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.