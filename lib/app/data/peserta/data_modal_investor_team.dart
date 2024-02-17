class TeamModalInvestorData {
  TeamModalInvestorData({
    this.success,
    this.teamModalInvestor,
    this.teamModalInvestorTotal,
  });
  late final bool? success;
  late final List<TeamModalInvestor>? teamModalInvestor;
  late final int? teamModalInvestorTotal;

  TeamModalInvestorData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamModalInvestor = List.from(json['team_modal_investor'])
        .map((e) => TeamModalInvestor.fromJson(e))
        .toList();
    teamModalInvestorTotal = json['team_modal_investor_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_modal_investor'] =
        teamModalInvestor!.map((e) => e.toJson()).toList();
    _data['team_modal_investor_total'] = teamModalInvestorTotal;
    return _data;
  }
}

class TeamModalInvestor {
  TeamModalInvestor({
    required this.teamId,
    required this.investorId,
    required this.teamNama,
    required this.targetModal,
    required this.investorNama,
    required this.investorPekerjaan,
    required this.investorFoto,
    required this.totalModal,
    required this.persentase,
    required this.fotoUrl,
  });
  late final String teamId;
  late final String investorId;
  late final String teamNama;
  late final String targetModal;
  late final String investorNama;
  late final String investorPekerjaan;
  late final String investorFoto;
  late final String totalModal;
  late final String persentase;
  late final String fotoUrl;

  TeamModalInvestor.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    investorId = json['investor_id'];
    teamNama = json['team_nama'];
    targetModal = json['target_modal'];
    investorNama = json['investor_nama'];
    investorPekerjaan = json['investor_pekerjaan'];
    investorFoto = json['investor_foto'];
    totalModal = json['total_modal'];
    persentase = json['persentase'];
    fotoUrl = json['foto_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team_id'] = teamId;
    _data['investor_id'] = investorId;
    _data['team_nama'] = teamNama;
    _data['target_modal'] = targetModal;
    _data['investor_nama'] = investorNama;
    _data['investor_pekerjaan'] = investorPekerjaan;
    _data['investor_foto'] = investorFoto;
    _data['total_modal'] = totalModal;
    _data['persentase'] = persentase;
    _data['foto_url'] = fotoUrl;
    return _data;
  }
}
