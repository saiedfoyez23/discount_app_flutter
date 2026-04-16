class GetBrokerProfileResponseModel {
  var success;
  var message;
  GetBrokerProfileResponse? data;

  GetBrokerProfileResponseModel({this.success, this.message, this.data});

  GetBrokerProfileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetBrokerProfileResponse.fromJson(json['data']) : null;
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

class GetBrokerProfileResponse {
  var sId;
  var name;
  var image;
  var referralCode;
  var email;
  var referralUsers;
  var location;
  var contact;
  var balance;
  var isApproved;
  var isBlocked;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  GetBrokerProfileResponse({
    this.sId,
    this.name,
    this.image,
    this.referralCode,
    this.email,
    this.referralUsers,
    this.location,
    this.contact,
    this.balance,
    this.isApproved,
    this.isBlocked,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetBrokerProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    referralCode = json['referral_code'];
    email = json['email'];
    referralUsers = json['referral_users'];
    location = json['location'];
    contact = json['contact'];
    balance = json['balance'];
    isApproved = json['is_approved'];
    isBlocked = json['is_blocked'];
    isDeleted = json['is_deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['referral_code'] = this.referralCode;
    data['email'] = this.email;
    data['referral_users'] = this.referralUsers;
    data['location'] = this.location;
    data['contact'] = this.contact;
    data['balance'] = this.balance;
    data['is_approved'] = this.isApproved;
    data['is_blocked'] = this.isBlocked;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
