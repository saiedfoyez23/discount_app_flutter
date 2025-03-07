class UserSignUpResponse {
  var success;
  var message;
  UserSignUp? data;

  UserSignUpResponse({this.success, this.message, this.data});

  UserSignUpResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new UserSignUp.fromJson(json['data']) : null;
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

class UserSignUp {
  User? user;

  UserSignUp({this.user});

  UserSignUp.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  var name;
  var image;
  var email;
  var location;
  var contact;
  var isCbtHolder;
  var document;
  var isBlocked;
  var isDeleted;
  var sId;
  var createdAt;
  var updatedAt;
  var iV;

  User(
      {this.name,
        this.image,
        this.email,
        this.location,
        this.contact,
        this.isCbtHolder,
        this.document,
        this.isBlocked,
        this.isDeleted,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    email = json['email'];
    location = json['location'];
    contact = json['contact'];
    isCbtHolder = json['isCbtHolder'];
    document = json['document'];
    isBlocked = json['is_blocked'];
    isDeleted = json['is_deleted'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['email'] = this.email;
    data['location'] = this.location;
    data['contact'] = this.contact;
    data['isCbtHolder'] = this.isCbtHolder;
    data['document'] = this.document;
    data['is_blocked'] = this.isBlocked;
    data['is_deleted'] = this.isDeleted;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
