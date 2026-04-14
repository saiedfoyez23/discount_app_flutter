class UserBillingAddressResponseModel {
  var success;
  var message;
  UserBillingAddressResponse? data;

  UserBillingAddressResponseModel({this.success, this.message, this.data});

  UserBillingAddressResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserBillingAddressResponse.fromJson(json['data']) : null;
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

class UserBillingAddressResponse {
  var sId;
  var user;
  var name;
  var email;
  var phone;
  var companyName;
  var streetAddress;
  var country;
  var state;
  var city;
  var zipCode;
  var houseNo;
  var createdAt;
  var updatedAt;
  var iV;

  UserBillingAddressResponse({
    this.sId,
    this.user,
    this.name,
    this.email,
    this.phone,
    this.companyName,
    this.streetAddress,
    this.country,
    this.state,
    this.city,
    this.zipCode,
    this.houseNo,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  UserBillingAddressResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    user = json['user'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    companyName = json['company_name'];
    streetAddress = json['street_address'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipCode = json['zip_code'];
    houseNo = json['house_no'];
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
    data['company_name'] = this.companyName;
    data['street_address'] = this.streetAddress;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    data['house_no'] = this.houseNo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
