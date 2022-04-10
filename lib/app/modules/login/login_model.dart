import 'dart:convert';

DataLogin loginModelFromJson(String str) {
  return  DataLogin.fromJson(json.decode(str));
}


String loginModelToJson(DataLogin data) {
  return json.encode(data.toJson());
}

class Login {
  String? message;
  bool? isSuccess;
  DataLogin? data;
  int? code;

  Login({this.message, this.isSuccess, this.data, this.code});

  Login.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    data = json['Data'] != null ? DataLogin?.fromJson(json['Data']) : null;
    code = json['Code'];
  }
}

class DataLogin {
  int? id;
  String? serial;
  String? name;
  dynamic nameAr;
  String? password;
  String? createDate;
  dynamic img;
  bool? isActive;
  int? gender;
  String? phone;
  bool? setNewPassword;
  bool? isDeleted;
  int? role;
  String? email;
  String? lastOnline;
  bool? defaultSchoolLogin;
  int? level;
  int? schoolId;
  int? state;

  DataLogin(
      {this.id,
      this.serial,
      this.name,
      this.nameAr,
      this.password,
      this.createDate,
      this.img,
      this.isActive,
      this.gender,
      this.phone,
      this.setNewPassword,
      this.isDeleted,
      this.role,
      this.email,
      this.lastOnline,
      this.defaultSchoolLogin,
      this.level,
      this.schoolId,
      this.state});

  DataLogin.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    serial = json['Serial'];
    name = json['Name'];
    nameAr = json['NameAr'];
    password = json['Password'];
    createDate = json['CreateDate'];
    img = json['Img'];
    isActive = json['IsActive'];
    gender = json['Gender'];
    phone = json['Phone'];
    setNewPassword = json['SetNewPassword'];
    isDeleted = json['IsDeleted'];
    role = json['Role'];
    email = json['Email'];
    lastOnline = json['LastOnline'];
    defaultSchoolLogin = json['DefaultSchoolLogin'];
    level = json['Level'];
    schoolId = json['SchoolId'];
    state = json['State'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Id'] = id;
    data['Serial'] = serial;
    data['Name'] = name;
    data['NameAr'] = nameAr;
    data['Password'] = password;
    data['CreateDate'] = createDate;
    data['Img'] = img;
    data['IsActive'] = isActive;
    data['Gender'] = gender;
    data['Phone'] = phone;
    data['SetNewPassword'] = setNewPassword;
    data['IsDeleted'] = isDeleted;
    data['Role'] = role;
    data['Email'] = email;
    data['LastOnline'] = lastOnline;
    data['DefaultSchoolLogin'] = defaultSchoolLogin;
    data['Level'] = level;
    data['SchoolId'] = schoolId;
    data['State'] = state;
    return data;
  }
}
