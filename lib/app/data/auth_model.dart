class Auth {
  Auth({
    this.success,
    this.message,
    this.user,
    this.token,
  });
  late final bool? success;
  late final String? message;
  late final User? user;
  late final String? token;

  Auth.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['user'] = user!.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    this.id,
    this.name,
    this.avatar,
    this.username,
    this.email,
    this.nohp,
    this.emailVerifiedAt,
    this.webToken,
    this.fcmToken,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.statusCode,
  });
  late final int? id;
  late final String? name;
  late final String? avatar;
  late final String? username;
  late final String? email;
  late final String? nohp;
  late final String? emailVerifiedAt;
  late final String? webToken;
  late final String? fcmToken;
  late final String? type;
  late final String? createdAt;
  late final String? updatedAt;
  late final String? statusCode;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    username = json['username'];
    email = json['email'];
    nohp = json['nohp'];
    emailVerifiedAt = json['email_verified_at'];
    webToken = json['web_token'];
    fcmToken = json['fcm_token'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['avatar'] = avatar;
    _data['username'] = username;
    _data['email'] = email;
    _data['nohp'] = nohp;
    _data['email_verified_at'] = emailVerifiedAt;
    _data['web_token'] = webToken;
    _data['fcm_token'] = fcmToken;
    _data['type'] = type;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['status_code'] = statusCode;
    return _data;
  }
}
