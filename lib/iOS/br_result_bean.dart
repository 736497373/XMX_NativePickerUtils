class BRResultBean {
  // 索引
  int index;
  String key;
  String value;
  String parentKey;
  String parentValue;

  BRResultBean(
      {this.index,
      this.key,
      this.value,
      this.parentKey = '-1',
      this.parentValue = ''});

  BRResultBean.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    key = json['key'];
    value = json['value'];
    parentKey = json['parentKey'];
    parentValue = json['parentValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = index;
    data['key'] = key;
    data['value'] = value;
    data['parentKey'] = parentKey;
    data['parentValue'] = parentValue;
    return data;
  }

  @override
  String toString() {
    return '$value';
  }
}
