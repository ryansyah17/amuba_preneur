class DataPeraturan {
  DataPeraturan({
    this.success,
    this.peraturan,
    this.peraturanTotal,
  });
  late final bool? success;
  late final List<Peraturan>? peraturan;
  late final int? peraturanTotal;

  DataPeraturan.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    peraturan =
        List.from(json['peraturan']).map((e) => Peraturan.fromJson(e)).toList();
    peraturanTotal = json['peraturan_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['peraturan'] = peraturan!.map((e) => e.toJson()).toList();
    _data['peraturan_total'] = peraturanTotal;
    return _data;
  }
}

class Peraturan {
  Peraturan({
    required this.id,
    required this.judul,
    required this.desk,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String judul;
  late final String desk;
  late final String createdAt;
  late final String updatedAt;

  Peraturan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    desk = json['desk'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['judul'] = judul;
    _data['desk'] = desk;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
