
import 'package:krish/app/beans/response_pojo/ErrorResponse.dart';

class ProfileResponse {
  int? status;
  Data? data;
  ErrorResponse? error;

  ProfileResponse({this.status, this.data, this.error});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
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
  int? consumerLoginId;
  String? fullName;
  String? consumerName;
  String? phone;
  String? gender;
  bool? subscribed;

  Data(
      {this.consumerLoginId,
      this.fullName,
      this.consumerName,
      this.phone,
      this.gender,
      this.subscribed});

  Data.fromJson(Map<String, dynamic> json) {
    consumerLoginId = json['consumerLoginId'];
    fullName = json['fullName'];
    consumerName = json['consumerName'];
    phone = json['phone'];
    gender = json['gender'];
    subscribed = json['subscribed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['consumerLoginId'] = this.consumerLoginId;
    data['fullName'] = this.fullName;
    data['consumerName'] = this.consumerName;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['subscribed'] = this.subscribed;
    return data;
  }
}
