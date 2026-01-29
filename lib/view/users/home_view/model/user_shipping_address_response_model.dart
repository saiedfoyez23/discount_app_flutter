class UserShippingAddressResponseModel {
  bool? success;
  String? message;
  UserShippingAddressResponse? data;

  UserShippingAddressResponseModel({this.success, this.message, this.data});

  UserShippingAddressResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserShippingAddressResponse.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserShippingAddressResponse {
  var sId;
  var user;
  var name;
  var email;
  var phone;
  var address;
  var createdAt;
  var updatedAt;
  var iV;

  UserShippingAddressResponse({
    this.sId,
    this.user,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  UserShippingAddressResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['user'] = this.user;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
