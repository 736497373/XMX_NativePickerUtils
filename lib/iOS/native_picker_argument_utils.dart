import 'dart:convert';

class NativePickerArgumentUtils {
  static Future<Map> check(
      {String title, List dataSourceArr, List selectIndex}) async {
    assert(dataSourceArr != null);
    String arrJsonString = JsonEncoder().convert(dataSourceArr);
    String selectIndexJsonString = JsonEncoder().convert(selectIndex);
    Map arguments = <String, dynamic>{
      'title': title,
      'dataSourceArr': arrJsonString,
      'selectIndex': selectIndexJsonString
    };
    return arguments;
  }
}
