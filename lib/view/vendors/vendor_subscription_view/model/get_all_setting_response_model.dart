class GetAllSettingResponseModel {
  var success;
  var message;
  List<GetAllSettingResponse>? data;

  GetAllSettingResponseModel({this.success, this.message, this.data});

  GetAllSettingResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllSettingResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllSettingResponse.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetAllSettingResponse {
  var sId;
  var termsConditions;
  var aboutUs;
  var privacyPolicy;
  var brokerMonthlySubscriptionFee;
  var riderMonthlySubscriptionFee;
  var vendorMonthlySubscriptionFee;
  var createdAt;
  var updatedAt;
  var iV;

  GetAllSettingResponse({
    this.sId,
    this.termsConditions,
    this.aboutUs,
    this.privacyPolicy,
    this.brokerMonthlySubscriptionFee,
    this.riderMonthlySubscriptionFee,
    this.vendorMonthlySubscriptionFee,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetAllSettingResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    termsConditions = json['terms_conditions'];
    aboutUs = json['about_us'];
    privacyPolicy = json['privacy_policy'];
    brokerMonthlySubscriptionFee = json['broker_monthly_subscription_fee'];
    riderMonthlySubscriptionFee = json['rider_monthly_subscription_fee'];
    vendorMonthlySubscriptionFee = json['vendor_monthly_subscription_fee'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['terms_conditions'] = this.termsConditions;
    data['about_us'] = this.aboutUs;
    data['privacy_policy'] = this.privacyPolicy;
    data['broker_monthly_subscription_fee'] = this.brokerMonthlySubscriptionFee;
    data['rider_monthly_subscription_fee'] = this.riderMonthlySubscriptionFee;
    data['vendor_monthly_subscription_fee'] = this.vendorMonthlySubscriptionFee;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
