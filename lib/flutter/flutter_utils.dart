/*
  单列、多列文本
 */

import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

const double _kPickerHeight = 216.0;
const double _kItemHeight = 40.0;
const Color _kBtnColor = Color(0xFF323232); //50
const Color _kTitleColor = Color(0xFF787878); //120
const double _kTextFontSize = 17.0;

typedef _StringClickCallBack = void Function(int selectIndex, Object selectStr);
typedef _ArrayClickCallBack = void Function(
    List<int> selecteds, List<dynamic> strData);

class FlutterPickerUtils {
  //单列
  static void showStringPicker<T>(
    BuildContext context, {
    @required List<T> data,
    String title,
    int normalIndex,
    PickerDataAdapter adapter,
    @required _StringClickCallBack clickCallBack,
  }) {
    openModalPicker(context,
        adapter: adapter ?? PickerDataAdapter(pickerdata: data, isArray: false),
        clickCallBack: (Picker picker, List<int> selecteds) {
      clickCallBack(selecteds[0], data[selecteds[0]]);
    }, selecteds: [normalIndex ?? 0], title: title);
  }

  //多列
  static void showArrayPicker<T>(
    BuildContext context, {
    @required List<T> data,
    String title,
    List<int> normalIndex,
    PickerDataAdapter adapter,
    @required _ArrayClickCallBack clickCallBack,
  }) {
    openModalPicker(context,
        adapter: adapter ?? PickerDataAdapter(pickerdata: data, isArray: true),
        clickCallBack: (Picker picker, List<int> selecteds) {
      clickCallBack(selecteds, picker.getSelectedValues());
    }, selecteds: normalIndex, title: title);
  }

  static void openModalPicker(
    BuildContext context, {
    @required PickerAdapter adapter,
    String title,
    List<int> selecteds,
    @required PickerConfirmCallback clickCallBack,
  }) {
    new Picker(
            containerColor: Colors.white,
            backgroundColor: Colors.white,
            adapter: adapter,
            title: new Text(title ?? "请选择",
                style:
                    TextStyle(color: _kTitleColor, fontSize: _kTextFontSize)),
            selecteds: selecteds,
            cancelText: '取消',
            confirmText: '确定',
            cancelTextStyle:
                TextStyle(color: _kBtnColor, fontSize: _kTextFontSize),
            confirmTextStyle:
                TextStyle(color: _kBtnColor, fontSize: _kTextFontSize),
            textAlign: TextAlign.right,
            itemExtent: _kItemHeight,
            height: _kPickerHeight,
            selectedTextStyle: TextStyle(color: Colors.black),
            onConfirm: clickCallBack)
        .showModal(context);
  }
}
