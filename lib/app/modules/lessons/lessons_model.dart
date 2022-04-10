class Lessons {
  dynamic message;
  bool? isSuccess;
  List<LessonsData>? data;
  int? code;

  Lessons({this.message, this.isSuccess, this.data, this.code});

  Lessons.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <LessonsData>[];
      json['Data'].forEach((v) {
        data?.add(LessonsData.fromJson(v));
      });
    }
    code = json['Code'];
  }
}

class LessonsData {
  int? id;
  String? title;
  String? createAt;
  Subject? subject;
  String? image;

  LessonsData({this.id, this.title, this.createAt, this.subject, this.image});

  LessonsData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    createAt = json['CreateAt'];
    subject =
        json['Subject'] != null ? Subject?.fromJson(json['Subject']) : null;
    image = json['Image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Title'] = title;
    data['CreateAt'] = createAt;
    if (subject != null) {
      data['Subject'] = subject?.toJson();
    }
    data['Image'] = image;
    return data;
  }
}

class Subject {
  int? id;
  String? name;
  String? image;
  int? lessons;
  Level? level;

  Subject({this.id, this.name, this.image, this.lessons, this.level});

  Subject.fromJson(Map<String, dynamic> json) {
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
