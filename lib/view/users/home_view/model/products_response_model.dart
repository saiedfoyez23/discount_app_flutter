class ProductsResponseModel {
  var success;
  var message;
  ProductsResponse? data;

  ProductsResponseModel({this.success, this.message, this.data});

  ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new ProductsResponse.fromJson(json['data']) : null;
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

class ProductsResponse {
  List<Products>? data;
  MetaResponse? meta;

  ProductsResponse({this.data, this.meta});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Products>[];
      json['data'].forEach((v) {
        data!.add(new Products.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new MetaResponse.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Products {
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

  Products({
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
    this.iV
  });

  Products.fromJson(Map<String, dynamic> json) {
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

class MetaResponse {
  var total;

  MetaResponse({this.total});

  MetaResponse.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
