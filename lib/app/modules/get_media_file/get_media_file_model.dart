class GetMediaFile {
  dynamic message;
  bool? isSuccess;
  String? data;
  int? code;

  GetMediaFile({this.message, this.isSuccess, this.data, this.code});

  GetMediaFile.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    data = json['Data'];
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
