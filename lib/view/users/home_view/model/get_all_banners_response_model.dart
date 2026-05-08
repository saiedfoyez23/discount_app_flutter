class GetAllBannersResponseModel {
  var success;
  var message;
  List<GetAllBannersResponse>? data;

  GetAllBannersResponseModel({this.success, this.message, this.data});

  GetAllBannersResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetAllBannersResponse>[];
      json['data'].forEach((v) {
        data!.add(new GetAllBannersResponse.fromJson(v));
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

class GetAllBannersResponse {
  var sId;
  var image;
  var index;
  var createdAt;
  var updatedAt;
  var iV;

  GetAllBannersResponse({
    this.sId,
    this.image,
    this.index,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  GetAllBannersResponse.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    index = json['index'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['index'] = this.index;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
