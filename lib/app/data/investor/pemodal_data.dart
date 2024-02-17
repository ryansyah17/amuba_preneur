class PemodalData {
  PemodalData({
    this.success,
    this.investor,
  });
  late final bool? success;
  late final Investor? investor;

  PemodalData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    investor = Investor.fromJson(json['investor']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['investor'] = investor!.toJson();
    return _data;
  }
}

class Investor {
  Investor({
    required this.id,
    required this.userId,
    required this.nama,
    required this.foto,
    required this.fotoId,
    required this.pekerjaan,
    required this.alamat,
    required this.email,
    required this.nohp,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.fotoUrl,
    required this.fotoIdUrl,
  });
  late final int id;
  late final String userId;
  late final String nama;
  late final String foto;
  late final String fotoId;
  late final String pekerjaan;
  late final String alamat;
  late final String email;
  late final String nohp;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String fotoUrl;
  late final String fotoIdUrl;

  Investor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nama = json['nama'];
    foto = json['foto'];
    fotoId = json['foto_id'];
    pekerjaan = json['pekerjaan'];
    alamat = json['alamat'];
    email = json['email'];
    nohp = json['nohp'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fotoUrl = json['foto_url'];
    fotoIdUrl = json['foto_id_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['nama'] = nama;
    data['foto'] = foto;
    data['foto_id'] = fotoId;
    data['pekerjaan'] = pekerjaan;
    data['alamat'] = alamat;
    data['email'] = email;
    data['nohp'] = nohp;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['foto_url'] = fotoUrl;
    data['foto_id_url'] = fotoIdUrl;
    return data;
  }
}
