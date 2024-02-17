class TeamWatchListData {
  TeamWatchListData({
    this.success,
    this.team,
    this.teamTotal,
  });
  late final bool? success;
  late final List<Team>? team;
  late final int? teamTotal;

  TeamWatchListData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    team = List.from(json['team']).map((e) => Team.fromJson(e)).toList();
    teamTotal = json['team_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team'] = team!.map((e) => e.toJson()).toList();
    _data['team_total'] = teamTotal;
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
    required this.investorId,
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
  late final String investorId;
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
    investorId = json['investor_id'];
    targetModal = json['target_modal'];
    terkumpul = json['terkumpul'];
    watchlist = json['watchlist'];
    statusPeminat = json['status_peminat'];
    sisa = json['sisa'];
    persentase = json['persentase'];
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
    _data['investor_id'] = investorId;
    _data['target_modal'] = targetModal;
    _data['terkumpul'] = terkumpul;
    _data['watchlist'] = watchlist;
    _data['status_peminat'] = statusPeminat;
    _data['sisa'] = sisa;
    _data['persentase'] = persentase;
    _data['logo_url'] = logoUrl;
    return _data;
  }
}
