class PlanningUsahaData {
  PlanningUsahaData({
    this.success,
    this.teamPlanning,
  });
  late final bool? success;
  late final TeamPlanning? teamPlanning;

  PlanningUsahaData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamPlanning = TeamPlanning.fromJson(json['team_planning']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_planning'] = teamPlanning!.toJson();
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
    required this.teamNama,
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
  late final String teamNama;

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
    teamNama = json['team_nama'];
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
    _data['team_nama'] = teamNama;
    return _data;
  }
}
