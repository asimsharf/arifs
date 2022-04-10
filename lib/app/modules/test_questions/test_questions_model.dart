class TestQuestions {
  dynamic message;
  bool? isSuccess;
  List<int>? data;
  int? code;

  TestQuestions({this.message, this.isSuccess, this.data, this.code});

  TestQuestions.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    data = json['Data'].cast<int>();
    code = json['Code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Message'] = message;
    data['IsSuccess'] = isSuccess;
    data['Data'] = data;
    data['Code'] = code;
    return data;
  }
}
