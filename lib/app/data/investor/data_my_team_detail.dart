class MyTeamDetailData {
  MyTeamDetailData({
    this.success,
    this.team,
    this.teamPlanning,
    this.teamAnggota,
    this.teamDocs,
  });
  late final bool? success;
  late final Team? team;
  late final TeamPlanning? teamPlanning;
  late final List<TeamAnggota>? teamAnggota;
  late final List<TeamDocs>? teamDocs;

  MyTeamDetailData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    team = Team.fromJson(json['team']);
    teamPlanning = TeamPlanning.fromJson(json['team_planning']);
    teamAnggota = List.from(json['team_anggota'])
        .map((e) => TeamAnggota.fromJson(e))
        .toList();
    teamDocs =
        List.from(json['team_docs']).map((e) => TeamDocs.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team'] = team!.toJson();
    _data['team_planning'] = teamPlanning!.toJson();
    _data['team_anggota'] = teamAnggota!.map((e) => e.toJson()).toList();
    _data['team_docs'] = teamDocs!.map((e) => e.toJson()).toList();
    return _data;
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
    required this.tahap,
    required this.status,
    this.note,
    required this.createdAt,
    required this.updatedAt,
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
  late final String tahap;
  late final String status;
  late final String? note;
  late final String createdAt;
  late final String updatedAt;
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
    tahap = json['tahap'];
    status = json['status'];
    note = json['note'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
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
    _data['tahap'] = tahap;
    _data['status'] = status;
    _data['note'] = note;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['logo_url'] = logoUrl;
    return _data;
  }
}

class TeamPlanning {
  TeamPlanning({
    required this.id,
    required this.teamId,
    required this.targetModal,
    required this.minInvestasi,
    required this.sumberProduk,
    required this.targetPembeli,
    required this.lokasiOperasional,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String teamId;
  late final String targetModal;
  late final String minInvestasi;
  late final String sumberProduk;
  late final String targetPembeli;
  late final String lokasiOperasional;
  late final String createdAt;
  late final String updatedAt;

  TeamPlanning.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    targetModal = json['target_modal'];
    minInvestasi = json['min_investasi'];
    sumberProduk = json['sumber_produk'];
    targetPembeli = json['target_pembeli'];
    lokasiOperasional = json['lokasi_operasional'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['target_modal'] = targetModal;
    _data['min_investasi'] = minInvestasi;
    _data['sumber_produk'] = sumberProduk;
    _data['target_pembeli'] = targetPembeli;
    _data['lokasi_operasional'] = lokasiOperasional;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
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
    required this.foto,
    required this.fotoKtp,
    required this.createdAt,
    required this.updatedAt,
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
  late final String foto;
  late final String fotoKtp;
  late final String createdAt;
  late final String updatedAt;
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
    _data['foto_url'] = fotoUrl;
    _data['foto_ktp_url'] = fotoKtpUrl;
    return _data;
  }
}

class TeamDocs {
  TeamDocs({
    required this.id,
    required this.teamId,
    required this.judul,
    this.tahap,
    this.file,
    this.url,
    this.status,
    this.reason,
    required this.createdAt,
    required this.updatedAt,
    required this.fileUrl,
  });
  late final int id;
  late final String teamId;
  late final String judul;
  late final String? tahap;
  late final String? file;
  late final String? url;
  late final String? status;
  late final String? reason;
  late final String createdAt;
  late final String updatedAt;
  late final String fileUrl;

  TeamDocs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    judul = json['judul'];
    tahap = json['tahap'];
    file = json['file'];
    url = json['url'];
    status = json['status'];
    reason = json['reason'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    fileUrl = json['file_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['judul'] = judul;
    _data['tahap'] = tahap;
    _data['file'] = file;
    _data['url'] = url;
    _data['status'] = status;
    _data['reason'] = reason;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['file_url'] = fileUrl;
    return _data;
  }
}
