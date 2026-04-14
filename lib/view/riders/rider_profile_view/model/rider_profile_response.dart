class RiderProfileResponse {
  var success;
  var message;
  RiderProfile? data;

  RiderProfileResponse({this.success, this.message, this.data});

  RiderProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new RiderProfile.fromJson(json['data']) : null;
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

class RiderProfile {
  var sId;
  var email;
  var iV;
  var balance;
  var contact;
  var createdAt;
  var drivingLicense;
  var image;
  var isApproved;
  var isBlocked;
  var isDeleted;
  var location;
  var name;
  var updatedAt;

  RiderProfile({
    this.sId,
    this.email,
    this.iV,
    this.balance,
    this.contact,
    this.createdAt,
    this.drivingLicense,
    this.image,
    this.isApproved,
    this.isBlocked,
    this.isDeleted,
    this.location,
    this.name,
    this.updatedAt
  });

  RiderProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    iV = json['__v'];
    balance = json['balance'];
    contact = json['contact'];
    createdAt = json['createdAt'];
    drivingLicense = json['driving_license'];
    image = json['image'];
    isApproved = json['is_approved'];
    isBlocked = json['is_blocked'];
    isDeleted = json['is_deleted'];
    location = json['location'];
    name = json['name'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['__v'] = this.iV;
    data['balance'] = this.balance;
    data['contact'] = this.contact;
    data['createdAt'] = this.createdAt;
    data['driving_license'] = this.drivingLicense;
    data['image'] = this.image;
    data['is_approved'] = this.isApproved;
    data['is_blocked'] = this.isBlocked;
    data['is_deleted'] = this.isDeleted;
    data['location'] = this.location;
    data['name'] = this.name;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
