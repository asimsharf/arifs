class TestView {
  String? message;
  bool? isSuccess;
  Data? data;
  int? code;

  TestView({this.message, this.isSuccess, this.data, this.code});

  TestView.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ? Data?.fromJson(json['Data']) : null;
    code = json['Code'];
  }
}

class Data {
  int? testId;
  dynamic title;
  int? total;
  int? pass;
  bool? isTaken;
  bool? finished;
  int? degree;
  dynamic takeDate;
  bool? isComplete;
  int? lesson;

  Data(
      {this.testId,
      this.title,
      this.total,
      this.pass,
      this.isTaken,
      this.finished,
      this.degree,
      this.takeDate,
      this.isComplete,
      this.lesson});

  Data.fromJson(Map<String, dynamic> json) {
    testId = json['TestId'];
    title = json['Title'];
    total = json['Total'];
    pass = json['Pass'];
    isTaken = json['IsTaken'];
    finished = json['Finished'];
    degree = json['Degree'];
    takeDate = json['TakeDate'];
    isComplete = json['IsComplete'];
    lesson = json['Lesson'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['TestId'] = testId;
    data['Title'] = title;
    data['Total'] = total;
    data['Pass'] = pass;
    data['IsTaken'] = isTaken;
    data['Finished'] = finished;
    data['Degree'] = degree;
    data['TakeDate'] = takeDate;
    data['IsComplete'] = isComplete;
    data['Lesson'] = lesson;
    return data;
  }
}
