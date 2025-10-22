
import 'package:krish/app/beans/response_pojo/ErrorResponse.dart';

class SignInResponse {
  int? status;
  Data? data;
  ErrorResponse? error;

  SignInResponse({this.status, this.data, this.error});

  SignInResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    error = json['error'] != null ? new ErrorResponse.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  int? role;
  int? subRole;

  Data({this.token, this.role, this.subRole});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    role = json['role'];
    subRole = json['subRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['role'] = this.role;
    data['subRole'] = this.subRole;
    return data;
  }
}

class Error {
  int? code;

  Error({this.code});

  Error.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    return data;
  }
}
