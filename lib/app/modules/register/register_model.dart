class Register {
  String? message;
  bool? isSuccess;
  Data? data;
  int? code;

  Register({
    this.message,
    this.isSuccess,
    this.data,
    this.code,
  });

  Register.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    isSuccess = json['IsSuccess'];
    data = Data?.fromJson(json['Data']);
    code = json['Code'];
  }
}

class Data {
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
  dynamic lastOnline;
  bool? defaultSchoolLogin;
  int? level;
  int? schoolId;
  int? state;

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
}
