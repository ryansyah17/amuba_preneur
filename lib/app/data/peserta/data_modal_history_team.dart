class TeamModalHistoryData {
  TeamModalHistoryData({
    this.success,
    this.teamModalHistory,
    this.teamModalHistoryTotal,
  });
  late final bool? success;
  late final List<TeamModalHistory>? teamModalHistory;
  late final int? teamModalHistoryTotal;

  TeamModalHistoryData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamModalHistory = List.from(json['team_modal_history'])
        .map((e) => TeamModalHistory.fromJson(e))
        .toList();
    teamModalHistoryTotal = json['team_modal_history_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_modal_history'] =
        teamModalHistory!.map((e) => e.toJson()).toList();
    _data['team_modal_history_total'] = teamModalHistoryTotal;
    return _data;
  }
}

class TeamModalHistory {
  TeamModalHistory({
    required this.id,
    required this.teamId,
    required this.investorId,
    required this.teamNama,
    required this.targetModal,
    required this.investorNama,
    required this.totalModal,
    required this.createdAt,
    required this.persentase,
  });
  late final int id;
  late final String teamId;
  late final String investorId;
  late final String teamNama;
  late final String targetModal;
  late final String investorNama;
  late final String totalModal;
  late final String createdAt;
  late final String persentase;

  TeamModalHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    investorId = json['investor_id'];
    teamNama = json['team_nama'];
    targetModal = json['target_modal'];
    investorNama = json['investor_nama'];
    totalModal = json['total_modal'];
    createdAt = json['created_at'];
    persentase = json['persentase'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['investor_id'] = investorId;
    _data['team_nama'] = teamNama;
    _data['target_modal'] = targetModal;
    _data['investor_nama'] = investorNama;
    _data['total_modal'] = totalModal;
    _data['created_at'] = createdAt;
    _data['persentase'] = persentase;
    return _data;
  }
}
