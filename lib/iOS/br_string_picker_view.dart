import 'dart:async';
import 'dart:convert';
// import 'dart:convert';

import 'package:flutter/services.dart';

import 'br_result_bean.dart';
import 'native_picker_argument_utils.dart';

class BRStringPickerView {
  static Future<BRResultBean> showPicker(MethodChannel _channel,
      {String title = '', List dataSourceArr, int selectIndex = 0}) async {
    Map arguments = await NativePickerArgumentUtils.check(
        title: title, dataSourceArr: dataSourceArr, selectIndex: [selectIndex]);
    String result = await _channel.invokeMethod('showPicker', arguments);
    BRResultBean resultBean =
        BRResultBean.fromJson(JsonDecoder().convert(result));
    return resultBean;
  }

  static Future<List<BRResultBean>> showMultiPicker(MethodChannel _channel,
      {String title = '', List dataSourceArr, List selectIndex}) async {
    Map arguments = await NativePickerArgumentUtils.check(
        title: title, dataSourceArr: dataSourceArr, selectIndex: selectIndex);
    String result = await _channel.invokeMethod('showMultiPicker', arguments);
    List<BRResultBean> resultList = [];
    List array = JsonDecoder().convert(result);
    array.forEach((element) {
      BRResultBean bean = BRResultBean.fromJson(element);
      resultList.add(bean);
    });

    return resultList;
  }
}
