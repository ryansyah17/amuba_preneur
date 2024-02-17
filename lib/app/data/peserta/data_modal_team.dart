class TeamModalData {
  TeamModalData({
    this.success,
    this.teamModal,
  });
  late final bool? success;
  late final TeamModal? teamModal;

  TeamModalData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamModal = TeamModal.fromJson(json['team_modal']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_modal'] = teamModal!.toJson();
    return _data;
  }
}

class TeamModal {
  TeamModal({
    required this.id,
    required this.teamId,
    required this.teamNama,
    required this.targetModal,
    required this.terkumpul,
    required this.totalInvestor,
    required this.sisa,
    required this.persentase,
  });
  late final int id;
  late final String teamId;
  late final String teamNama;
  late final String targetModal;
  late final String terkumpul;
  late final String totalInvestor;
  late final int sisa;
  late final String persentase;

  TeamModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    teamNama = json['team_nama'];
    targetModal = json['target_modal'];
    terkumpul = json['terkumpul'];
    totalInvestor = json['total_investor'];
    sisa = json['sisa'];
    persentase = json['persentase'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['team_nama'] = teamNama;
    _data['target_modal'] = targetModal;
    _data['terkumpul'] = terkumpul;
    _data['total_investor'] = totalInvestor;
    _data['sisa'] = sisa;
    _data['persentase'] = persentase;
    return _data;
  }
}
