class InformasiAnggotaData {
  InformasiAnggotaData({
    this.success,
    this.teamAnggota,
    this.teamAnggotaTotal,
  });
  late final bool? success;
  late final List<TeamAnggota>? teamAnggota;
  late final int? teamAnggotaTotal;

  InformasiAnggotaData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamAnggota = List.from(json['team_anggota'])
        .map((e) => TeamAnggota.fromJson(e))
        .toList();
    teamAnggotaTotal = json['team_anggota_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_anggota'] = teamAnggota!.map((e) => e.toJson()).toList();
    _data['team_anggota_total'] = teamAnggotaTotal;
    return _data;
  }
}

class TeamAnggota {
  TeamAnggota({
    required this.id,
    required this.teamId,
    required this.nama,
    required this.nohp,
    required this.instagram,
    required this.ukuranBaju,
    required this.pendidikanTerakhir,
    this.foto,
    this.fotoKtp,
    required this.createdAt,
    required this.updatedAt,
    required this.teamNama,
    required this.fotoUrl,
    required this.fotoKtpUrl,
  });
  late final int id;
  late final String teamId;
  late final String nama;
  late final String nohp;
  late final String instagram;
  late final String ukuranBaju;
  late final String pendidikanTerakhir;
  late final String? foto;
  late final String? fotoKtp;
  late final String createdAt;
  late final String updatedAt;
  late final String teamNama;
  late final String fotoUrl;
  late final String fotoKtpUrl;

  TeamAnggota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    nama = json['nama'];
    nohp = json['nohp'];
    instagram = json['instagram'];
    ukuranBaju = json['ukuran_baju'];
    pendidikanTerakhir = json['pendidikan_terakhir'];
    foto = json['foto'];
    fotoKtp = json['foto_ktp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamNama = json['team_nama'];
    fotoUrl = json['foto_url'];
    fotoKtpUrl = json['foto_ktp_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['nama'] = nama;
    _data['nohp'] = nohp;
    _data['instagram'] = instagram;
    _data['ukuran_baju'] = ukuranBaju;
    _data['pendidikan_terakhir'] = pendidikanTerakhir;
    _data['foto'] = foto;
    _data['foto_ktp'] = fotoKtp;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['team_nama'] = teamNama;
    _data['foto_url'] = fotoUrl;
    _data['foto_ktp_url'] = fotoKtpUrl;
    return _data;
  }
}
