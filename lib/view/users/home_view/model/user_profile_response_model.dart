class UserProfileResponseModel {
  var success;
  var message;
  UserProfileResponse? data;

  UserProfileResponseModel({this.success, this.message, this.data});

  UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserProfileResponse.fromJson(json['data']) : null;
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

class UserProfileResponse {
  var sId;
  var name;
  var image;
  var email;
  var location;
  var contact;
  var isCbtHolder;
  var document;
  var isBlocked;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;
  var totalRewardPoints;

  UserProfileResponse({
    this.sId,
    this.name,
    this.image,
    this.email,
    this.location,
    this.contact,
    this.isCbtHolder,
    this.document,
    this.isBlocked,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.totalRewardPoints,
  });

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    image = json['image'];
    email = json['email'];
    location = json['location'];
    contact = json['contact'];
    isCbtHolder = json['isCbtHolder'];
    document = json['document'];
    isBlocked = json['is_blocked'];
    isDeleted = json['is_deleted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalRewardPoints = json['totalRewardPoints'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['location'] = this.location;
    data['contact'] = this.contact;
    data['isCbtHolder'] = this.isCbtHolder;
    data['document'] = this.document;
    data['is_blocked'] = this.isBlocked;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['totalRewardPoints'] = this.totalRewardPoints;
    return data;
  }
}
