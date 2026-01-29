class VendorProfileResponseModel {
  var success;
  var message;
  VendorProfileResponse? data;

  VendorProfileResponseModel({this.success, this.message, this.data});

  VendorProfileResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new VendorProfileResponse.fromJson(json['data']) : null;
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

class VendorProfileResponse {
  var sId;
  var email;
  var contact;
  VendorProfileStore? store;
  var taxDocument;
  var balance;
  var brokerReferral;
  var isApproved;
  var isBlocked;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  VendorProfileResponse({
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
    this.iV,
  });

  VendorProfileResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    contact = json['contact'];
    store = json['store'] != null ? new VendorProfileStore.fromJson(json['store']) : null;
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
    if (this.store != null) {
      data['store'] = this.store!.toJson();
    }
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

class VendorProfileStore {
  var sId;
  var name;
  List<String>? coverImages;

  VendorProfileStore({this.sId, this.name, this.coverImages});

  VendorProfileStore.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    coverImages = json['cover_images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['cover_images'] = this.coverImages;
    return data;
  }
}
