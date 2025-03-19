class StoresResponseModel {
  var success;
  var message;
  StoresResponse? data;

  StoresResponseModel({this.success, this.message, this.data});

  StoresResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new  StoresResponse.fromJson(json['data']) : null;
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

class StoresResponse {
  List<Stores>? data;
  Meta? meta;

  StoresResponse({this.data, this.meta});

  StoresResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Stores>[];
      json['data'].forEach((v) {
        data!.add(new Stores.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
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

class Stores {
  var sId;
  var name;
  List<String>? coverImages;
  Location? location;
  var ratings;
  var description;
  List<String>? categories;
  var isBlocked;
  var isDeleted;
  var createdAt;
  var updatedAt;
  var iV;

  Stores(
      {this.sId,
        this.name,
        this.coverImages,
        this.location,
        this.ratings,
        this.description,
        this.categories,
        this.isBlocked,
        this.isDeleted,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Stores.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    coverImages = json['cover_images'].cast<String>();
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    ratings = json['ratings'];
    description = json['description'];
    categories = json['categories'].cast<String>();
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
    data['cover_images'] = this.coverImages;
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['ratings'] = this.ratings;
    data['description'] = this.description;
    data['categories'] = this.categories;
    data['is_blocked'] = this.isBlocked;
    data['is_deleted'] = this.isDeleted;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class Location {
  var type;
  List<double>? coordinates;

  Location({this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['coordinates'] = this.coordinates;
    return data;
  }
}

class Meta {
  var total;

  Meta({this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
