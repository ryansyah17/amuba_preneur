class NewsPesertaData {
  NewsPesertaData({
    this.success,
    this.news,
    this.newsTotal,
  });
  late final bool? success;
  late final List<News>? news;
  late final int? newsTotal;

  NewsPesertaData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    news = List.from(json['news']).map((e) => News.fromJson(e)).toList();
    newsTotal = json['news_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['news'] = news!.map((e) => e.toJson()).toList();
    _data['news_total'] = newsTotal;
    return _data;
  }
}

class News {
  News({
    required this.id,
    required this.createdBy,
    required this.type,
    required this.judul,
    required this.desc,
    required this.foto,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.nama,
    required this.fotoUrl,
  });
  late final String id;
  late final String createdBy;
  late final String type;
  late final String judul;
  late final String desc;
  late final String foto;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String nama;
  late final String fotoUrl;

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    type = json['type'];
    judul = json['judul'];
    desc = json['desc'];
    foto = json['foto'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    nama = json['nama'];
    fotoUrl = json['foto_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['created_by'] = createdBy;
    _data['type'] = type;
    _data['judul'] = judul;
    _data['desc'] = desc;
    _data['foto'] = foto;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['nama'] = nama;
    _data['foto_url'] = fotoUrl;
    return _data;
  }
}
