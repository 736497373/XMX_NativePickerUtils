import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_picker_utils/iOS/br_result_bean.dart';
import 'package:native_picker_utils/iOS/br_string_picker_view.dart';

import 'flutter/flutter_utils.dart';

class NativePickerUtils {
  static const MethodChannel _channel =
      const MethodChannel('native_picker_utils');

  static Future showPicker(BuildContext context,
      {String title = '', List dataSourceArr, int selectIndex = 0}) async {
    Completer completer = new Completer();
    if (Platform.isIOS) {
      completer.complete(BRStringPickerView.showPicker(_channel,
          title: title,
          dataSourceArr: dataSourceArr,
          selectIndex: selectIndex));
    } else {
      FlutterPickerUtils.showStringPicker(context,
          title: title,
          data: dataSourceArr, clickCallBack: (selectIndex, selectStr) {
        if (selectStr is BRResultBean) {
          completer.complete(selectStr);
        } else {
          completer
              .complete(BRResultBean(index: selectIndex, value: selectStr));
        }
      });
    }
    return completer.future;
  }

  static Future showMultiPicker(BuildContext context,
      {String title = '', List dataSourceArr, List<num> selectIndex}) async {
    Completer completer = new Completer();
    if (Platform.isIOS) {
      completer.complete(BRStringPickerView.showMultiPicker(_channel,
          title: title,
          dataSourceArr: dataSourceArr,
          selectIndex: selectIndex));
    } else if (Platform.isAndroid) {
      FlutterPickerUtils.showArrayPicker(context,
          title: title,
          data: dataSourceArr, clickCallBack: (selecteds, strData) {
        if (strData.first is BRResultBean) {
          completer.complete(strData);
        } else {
          List list = [];
          for (var i = 0; i < selecteds.length; i++) {
            list.add(BRResultBean(index: selecteds[i], value: strData[i]));
          }
          completer.complete(list);
        }
      });
    }
    return completer.future;
  }
}
