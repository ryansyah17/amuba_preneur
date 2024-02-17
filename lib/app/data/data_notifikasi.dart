class DataNotifikasi {
  DataNotifikasi({
    this.success,
    this.notifications,
    this.notifTotal,
  });
  late final bool? success;
  late final List<Notifications>? notifications;
  late final int? notifTotal;

  DataNotifikasi.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    notifications = List.from(json['notifications'])
        .map((e) => Notifications.fromJson(e))
        .toList();
    notifTotal = json['notif_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['notifications'] = notifications!.map((e) => e.toJson()).toList();
    _data['notif_total'] = notifTotal;
    return _data;
  }
}

class Notifications {
  Notifications({
    required this.id,
    required this.userId,
    required this.message,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });
  late final String id;
  late final String userId;
  late final String message;
  late final String isRead;
  late final String createdAt;
  late final String updatedAt;

  Notifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    message = json['message'];
    isRead = json['is_read'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['message'] = message;
    _data['is_read'] = isRead;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
