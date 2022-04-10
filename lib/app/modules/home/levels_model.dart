class Levels {
  dynamic message;
  bool? isSuccess;
  List<LevelsData>? data;
  int? code;

  Levels({this.message, this.isSuccess, this.data, this.code});

  Levels.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <LevelsData>[];
      json['Data'].forEach((v) {
        data?.add(LevelsData.fromJson(v));
      });
    }
    code = json['Code'];
  }
}

class LevelsData {
  int? id;
  String? name;

  LevelsData({this.id, this.name});

  LevelsData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    return data;
  }
}
