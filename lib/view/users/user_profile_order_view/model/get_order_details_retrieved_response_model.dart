class GetOrderDetailsRetrievedResponseModel {
  var success;
  var message;
  GetOrderDetailsRetrievedResponse? data;

  GetOrderDetailsRetrievedResponseModel(
      {this.success, this.message, this.data});

  GetOrderDetailsRetrievedResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new GetOrderDetailsRetrievedResponse.fromJson(json['data']) : null;
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

class GetOrderDetailsRetrievedResponse {
  var sId;
  var orderId;
  var paymentMethod;
  var total;
  var status;
  var paymentStatus;
  List<GetOrderDetailsRetrievedResponseItems>? items;
  GetOrderDetailsRetrievedResponseBillingAddress? billingAddress;
  GetOrderDetailsRetrievedResponseShippingAddress? shippingAddress;
  var createdAt;

  GetOrderDetailsRetrievedResponse({
    this.sId,
    this.orderId,
    this.paymentMethod,
    this.total,
    this.status,
    this.paymentStatus,
    this.items,
    this.billingAddress,
    this.shippingAddress,
    this.createdAt,
  });

  GetOrderDetailsRetrievedResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    orderId = json['order_id'];
    paymentMethod = json['payment_method'];
    total = json['total'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    if (json['items'] != null) {
      items = <GetOrderDetailsRetrievedResponseItems>[];
      json['items'].forEach((v) {
        items!.add(new GetOrderDetailsRetrievedResponseItems.fromJson(v));
      });
    }
    billingAddress = json['billing_address'] != null
        ? new GetOrderDetailsRetrievedResponseBillingAddress.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new GetOrderDetailsRetrievedResponseShippingAddress.fromJson(json['shipping_address'])
        : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['order_id'] = this.orderId;
    data['payment_method'] = this.paymentMethod;
    data['total'] = this.total;
    data['status'] = this.status;
    data['payment_status'] = this.paymentStatus;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    if (this.billingAddress != null) {
      data['billing_address'] = this.billingAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class GetOrderDetailsRetrievedResponseItems {
  GetOrderDetailsRetrievedResponseProduct? product;
  var quantity;
  var discount;
  var sId;

  GetOrderDetailsRetrievedResponseItems({this.product, this.quantity, this.discount, this.sId});

  GetOrderDetailsRetrievedResponseItems.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? new GetOrderDetailsRetrievedResponseProduct.fromJson(json['product']) : null;
    quantity = json['quantity'];
    discount = json['discount'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['_id'] = this.sId;
    return data;
  }
}

class GetOrderDetailsRetrievedResponseProduct {
  var sId;
  var name;
  List<String>? images;
  var category;
  var store;
  var price;
  var description;
  var quantity;
  var discount;
  var isDeleted;
  var ratings;
  var createdAt;
  var updatedAt;
  var iV;

  GetOrderDetailsRetrievedResponseProduct({
    this.sId,
    this.name,
    this.images,
    this.category,
    this.store,
    this.price,
    this.description,
    this.quantity,
    this.discount,
    this.isDeleted,
    this.ratings,
    this.createdAt,
    this.updatedAt,
    this.iV});

  GetOrderDetailsRetrievedResponseProduct.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    images = json['images'].cast<String>();
    category = json['category'];
    store = json['store'];
    price = json['price'];
    description = json['description'];
    quantity = json['quantity'];
    discount = json['discount'];
    isDeleted = json['is_deleted'];
    ratings = json['ratings'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['images'] = this.images;
    data['category'] = this.category;
    data['store'] = this.store;
    data['price'] = this.price;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['discount'] = this.discount;
    data['is_deleted'] = this.isDeleted;
    data['ratings'] = this.ratings;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class GetOrderDetailsRetrievedResponseBillingAddress {
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

  GetOrderDetailsRetrievedResponseBillingAddress({
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

  GetOrderDetailsRetrievedResponseBillingAddress.fromJson(Map<String, dynamic> json) {
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

class GetOrderDetailsRetrievedResponseShippingAddress {
  var sId;
  var user;
  var name;
  var email;
  var phone;
  var address;
  var createdAt;
  var updatedAt;
  var iV;

  GetOrderDetailsRetrievedResponseShippingAddress({
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

  GetOrderDetailsRetrievedResponseShippingAddress.fromJson(Map<String, dynamic> json) {
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
