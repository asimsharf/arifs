class MediaPlayList {
  dynamic message;
  bool? isSuccess;
  List<MediaPlayListData>? data;
  int? code;

  MediaPlayList({this.message, this.isSuccess, this.data, this.code});

  MediaPlayList.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    if (json['Data'] != null) {
      data = <MediaPlayListData>[];
      json['Data'].forEach((v) {
        data?.add(MediaPlayListData.fromJson(v));
      });
    }
    code = json['Code'];
  }
}

class MediaPlayListData {
  int? subjectId;
  int? lessoneId;
  String? type;
  dynamic data;
  String? fileLocation;
  String? fileName;
  int? fileSize;
  String? description;
  String? postDate;
  int? id;
  dynamic school;
  String? title;

  MediaPlayListData(
      {this.subjectId,
      this.lessoneId,
      this.type,
      this.data,
      this.fileLocation,
      this.fileName,
      this.fileSize,
      this.description,
      this.postDate,
      this.id,
      this.school,
      this.title});

  MediaPlayListData.fromJson(Map<String, dynamic> json) {
    subjectId = json['SubjectId'];
    lessoneId = json['LessoneId'];
    type = json['Type'];
    data = json['Data'];
    fileLocation = json['FileLocation'];
    fileName = json['FileName'];
    fileSize = json['FileSize'];
    description = json['Description'];
    postDate = json['PostDate'];
    id = json['Id'];
    school = json['School'];
    title = json['Title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['SubjectId'] = subjectId;
    data['LessoneId'] = lessoneId;
    data['Type'] = type;
    data['Data'] = data;
    data['FileLocation'] = fileLocation;
    data['FileName'] = fileName;
    data['FileSize'] = fileSize;
    data['Description'] = description;
    data['PostDate'] = postDate;
    data['Id'] = id;
    data['School'] = school;
    data['Title'] = title;
    return data;
  }
}
