class TeamAnggotaData {
  TeamAnggotaData({
    this.success,
    this.teamAnggota,
    this.teamAnggotaTotal,
  });
  late final bool? success;
  late final List<TeamAnggota>? teamAnggota;
  late final int? teamAnggotaTotal;

  TeamAnggotaData.fromJson(Map<String, dynamic> json) {
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
    required this.ketua,
    required this.nohp,
    required this.instagram,
    required this.ukuranBaju,
    required this.alamat,
    required this.foto,
    required this.createdAt,
    required this.updatedAt,
    required this.teamNama,
    required this.fotoUrl,
  });
  late final int id;
  late final String teamId;
  late final String nama;
  late final String ketua;
  late final String nohp;
  late final String instagram;
  late final String ukuranBaju;
  late final String alamat;
  late final String foto;
  late final String createdAt;
  late final String updatedAt;
  late final String teamNama;
  late final String fotoUrl;

  TeamAnggota.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    nama = json['nama'];
    ketua = json['ketua'];
    nohp = json['nohp'];
    instagram = json['instagram'];
    ukuranBaju = json['ukuran_baju'];
    alamat = json['alamat'];
    foto = json['foto'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamNama = json['team_nama'];
    fotoUrl = json['foto_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['nama'] = nama;
    _data['ketua'] = ketua;
    _data['nohp'] = nohp;
    _data['instagram'] = instagram;
    _data['ukuran_baju'] = ukuranBaju;
    _data['alamat'] = alamat;
    _data['foto'] = foto;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['team_nama'] = teamNama;
    _data['foto_url'] = fotoUrl;
    return _data;
  }
}
