class Subjects {
  dynamic message;
  bool? isSuccess;
  List<SubjectsData>? data;
  int? code;

  Subjects({this.message, this.isSuccess, this.data, this.code});

  Subjects.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <SubjectsData>[];
      json['Data'].forEach((v) {
        data?.add(SubjectsData.fromJson(v));
      });
    }
    code = json['Code'];
  }
}

class SubjectsData {
  int? id;
  String? name;
  String? image;
  int? lessons;
  Level? level;

  SubjectsData({this.id, this.name, this.image, this.lessons, this.level});

  SubjectsData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    image = json['Image'];
    lessons = json['Lessons'];
    level = json['Level'] != null ? Level?.fromJson(json['Level']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Image'] = image;
    data['Lessons'] = lessons;
    if (level != null) {
      data['Level'] = level?.toJson();
    }
    return data;
  }
}

class Level {
  int? id;
  String? name;

  Level({this.id, this.name});

  Level.fromJson(Map<String, dynamic> json) {
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
