class DataBannerDetail {
  DataBannerDetail({
    this.success,
    this.banners,
  });
  late final bool? success;
  late final Banners? banners;

  DataBannerDetail.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    banners = Banners.fromJson(json['banners']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['banners'] = banners!.toJson();
    return _data;
  }
}

class Banners {
  Banners({
    required this.id,
    required this.type,
    required this.title,
    required this.desc,
    required this.photo,
    required this.expiredDate,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.photoUrl,
  });
  late final int id;
  late final String type;
  late final String title;
  late final String desc;
  late final String photo;
  late final String expiredDate;
  late final String isActive;
  late final String createdAt;
  late final String updatedAt;
  late final String photoUrl;

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    desc = json['desc'];
    photo = json['photo'];
    expiredDate = json['expired_date'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    photoUrl = json['photo_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['title'] = title;
    _data['desc'] = desc;
    _data['photo'] = photo;
    _data['expired_date'] = expiredDate;
    _data['is_active'] = isActive;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['photo_url'] = photoUrl;
    return _data;
  }
}
