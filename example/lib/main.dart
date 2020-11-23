import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:native_picker_utils/iOS/br_result_bean.dart';
import 'package:native_picker_utils/native_picker_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plugin example app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _platformVersion = 'Unknown';
  List array = ['1', '2', '3'];

  List array2 = [
    BRResultBean(index: 0, key: '1', value: '1'),
    BRResultBean(index: 1, key: '2', value: '2'),
  ];

  List array3 = [
    ['1', '2', '3'],
    ['1', '2', '3'],
    ['1', '2', '3']
  ];

  List array4 = [
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
  ];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion = 'Failed to get platform version.';
    // Platform messages may fail, so we use a try/catch PlatformException.

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Running on: $_platformVersion\n'),
            FlatButton(
              onPressed: () {
                NativePickerUtils.showPicker(context,
                        title: '点击选择', dataSourceArr: array, selectIndex: 0)
                    .then((value) {
                  print(value.toString());
                });
              },
              child: Text('单选'),
            ),
            FlatButton(
              onPressed: () {
                NativePickerUtils.showMultiPicker(context,
                    title: '点击选择',
                    dataSourceArr: array3,
                    selectIndex: [0, 0, 0]).then((value) {
                  List values = value;
                  values.forEach((element) {
                    print(element.toString());
                  });
                });
              },
              child: Text('多选'),
            )
          ],
        ),
      ),
    );
  }
}
