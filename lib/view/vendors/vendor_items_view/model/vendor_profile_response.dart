class VendorProfileResponse {
  var success;
  var message;
  VendorProfile? vendorProfile;

  VendorProfileResponse({this.success, this.message, this.vendorProfile});

  VendorProfileResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    vendorProfile = json['data'] != null ? new VendorProfile.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.vendorProfile != null) {
      data['data'] = this.vendorProfile!.toJson();
    }
    return data;
  }
}

class VendorProfile {
  var sId;
  var email;
  var contact;
  var store;
  var taxDocument;
  var balance;
  var brokerReferral;
  var isApproved;
  var isBlocked;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  VendorProfile({
    this.sId,
    this.email,
    this.contact,
    this.store,
    this.taxDocument,
    this.balance,
    this.brokerReferral,
    this.isApproved,
    this.isBlocked,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.iV
  });

  VendorProfile.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    contact = json['contact'];
    store = json['store'];
    taxDocument = json['tax_document'];
    balance = json['balance'];
    brokerReferral = json['broker_referral'];
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
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['store'] = this.store;
    data['tax_document'] = this.taxDocument;
    data['balance'] = this.balance;
    data['broker_referral'] = this.brokerReferral;
    data['is_approved'] = this.isApproved;
    data['is_blocked'] = this.isBlocked;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
