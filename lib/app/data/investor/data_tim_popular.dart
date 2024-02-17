class TeamPopularData {
  TeamPopularData({
    this.success,
    this.team,
    this.teamTotal,
  });
  late final bool? success;
  late final List<Team>? team;
  late final int? teamTotal;

  TeamPopularData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    team = List.from(json['team']).map((e) => Team.fromJson(e)).toList();
    teamTotal = json['team_total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['team'] = team!.map((e) => e.toJson()).toList();
    data['team_total'] = teamTotal;
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
    required this.tahap,
    required this.status,
    this.note,
    required this.createdAt,
    required this.updatedAt,
    required this.totalAnggota,
    required this.totalWatchlist,
    required this.targetModal,
    required this.terkumpul,
    required this.watchlist,
    required this.statusPeminat,
    required this.sisa,
    required this.persentase,
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
  late final String totalAnggota;
  late final String totalWatchlist;
  late final String targetModal;
  late final String terkumpul;
  late final String watchlist;
  late final String statusPeminat;
  late final int sisa;
  late final String persentase;
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
    totalAnggota = json['total_anggota'];
    totalWatchlist = json['total_watchlist'];
    targetModal = json['target_modal'];
    terkumpul = json['terkumpul'];
    watchlist = json['watchlist'];
    statusPeminat = json['status_peminat'];
    sisa = json['sisa'];
    persentase = json['persentase'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['nama'] = nama;
    data['logo'] = logo;
    data['jenis_usaha'] = jenisUsaha;
    data['sektor_usaha'] = sektorUsaha;
    data['deskripsi'] = deskripsi;
    data['email'] = email;
    data['nohp'] = nohp;
    data['tahap'] = tahap;
    data['status'] = status;
    data['note'] = note;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total_anggota'] = totalAnggota;
    data['total_watchlist'] = totalWatchlist;
    data['target_modal'] = targetModal;
    data['terkumpul'] = terkumpul;
    data['watchlist'] = watchlist;
    data['status_peminat'] = statusPeminat;
    data['sisa'] = sisa;
    data['persentase'] = persentase;
    data['logo_url'] = logoUrl;
    return data;
  }
}
