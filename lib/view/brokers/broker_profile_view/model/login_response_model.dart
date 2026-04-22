class LoginResponseModel {
  var success;
  var message;
  LoginResponse? data;

  LoginResponseModel({this.success, this.message, this.data});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new LoginResponse.fromJson(json['data']) : null;
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

class LoginResponse {
  var accessToken;
  var refreshToken;
  LoginResponseSubscription? subscription;

  LoginResponse({this.accessToken, this.refreshToken, this.subscription});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    subscription = json['subscription'] != null
        ? new LoginResponseSubscription.fromJson(json['subscription'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    if (this.subscription != null) {
      data['subscription'] = this.subscription!.toJson();
    }
    return data;
  }
}

class LoginResponseSubscription {
  var role;
  var monthlyFee;
  var hasActiveSubscription;
  var subscriptionStatus;
  var currentPeriodStart;
  var currentPeriodEnd;
  var cancelAtPeriodEnd;
  var subscription;

  LoginResponseSubscription({
    this.role,
    this.monthlyFee,
    this.hasActiveSubscription,
    this.subscriptionStatus,
    this.currentPeriodStart,
    this.currentPeriodEnd,
    this.cancelAtPeriodEnd,
    this.subscription,
  });

  LoginResponseSubscription.fromJson(Map<String, dynamic> json) {
    role = json['role'];
    monthlyFee = json['monthly_fee'];
    hasActiveSubscription = json['has_active_subscription'];
    subscriptionStatus = json['subscription_status'];
    currentPeriodStart = json['current_period_start'];
    currentPeriodEnd = json['current_period_end'];
    cancelAtPeriodEnd = json['cancel_at_period_end'];
    subscription = json['subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    data['monthly_fee'] = this.monthlyFee;
    data['has_active_subscription'] = this.hasActiveSubscription;
    data['subscription_status'] = this.subscriptionStatus;
    data['current_period_start'] = this.currentPeriodStart;
    data['current_period_end'] = this.currentPeriodEnd;
    data['cancel_at_period_end'] = this.cancelAtPeriodEnd;
    data['subscription'] = this.subscription;
    return data;
  }
}
