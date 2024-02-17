class InformasiUsahaData {
  InformasiUsahaData({
    this.success,
    this.team,
  });
  late final bool? success;
  late final Team? team;

  InformasiUsahaData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    team = Team.fromJson(json['team']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['team'] = team!.toJson();
    return data;
  }
}

class Team {
  Team({
    required this.id,
    required this.userId,
    required this.nama,
    this.logo,
    required this.jenisUsaha,
    required this.sektorUsaha,
    required this.deskripsi,
    required this.email,
    required this.nohp,
    required this.status,
    this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.namaUser,
    required this.logoUrl,
  });
  late final int id;
  late final String userId;
  late final String nama;
  late final String? logo;
  late final String jenisUsaha;
  late final String sektorUsaha;
  late final String deskripsi;
  late final String email;
  late final String nohp;
  late final String status;
  late final String? note;
  late final String createdAt;
  late final String updatedAt;
  late final String namaUser;
  late final String logoUrl;

  Team.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nama = json['nama'];
    logo = json['logo'];
    jenisUsaha = json['jenis_usaha'];
    sektorUsaha = json['sektor_usaha'];
    deskripsi = json['deskripsi'];
    email = json['email'];
    nohp = json['nohp'];
    status = json['status'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    namaUser = json['nama_user'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['nama'] = nama;
    _data['logo'] = logo;
    _data['jenis_usaha'] = jenisUsaha;
    _data['sektor_usaha'] = sektorUsaha;
    _data['deskripsi'] = deskripsi;
    _data['email'] = email;
    _data['nohp'] = nohp;
    _data['status'] = status;
    _data['note'] = note;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['nama_user'] = namaUser;
    _data['logo_url'] = logoUrl;
    return _data;
  }
}
