class Tests {
  dynamic message;
  bool? isSuccess;
  List<Data>? data;
  int? code;

  Tests({this.message, this.isSuccess, this.data, this.code});

  Tests.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
    code = json['Code'];
  }
}

class Data {
  int? id;
  String? title;
  double? totalDegree;
  double? passDegree;
  int? subjectId;

  Data(
      {this.id, this.title, this.totalDegree, this.passDegree, this.subjectId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    totalDegree = json['TotalDegree'];
    passDegree = json['PassDegree'];
    subjectId = json['SubjectId'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['TotalDegree'] = totalDegree;
    data['PassDegree'] = passDegree;
    data['SubjectId'] = subjectId;
    return data;
  }
}
