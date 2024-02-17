class PeminatTeamApproveData {
  PeminatTeamApproveData({
    this.success,
    this.teamPeminatApprove,
    this.teamPeminatApproveTotal,
  });
  late final bool? success;
  late final List<TeamPeminatApprove>? teamPeminatApprove;
  late final int? teamPeminatApproveTotal;

  PeminatTeamApproveData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamPeminatApprove = List.from(json['team_peminat_approve'])
        .map((e) => TeamPeminatApprove.fromJson(e))
        .toList();
    teamPeminatApproveTotal = json['team_peminat_approve_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_peminat_approve'] =
        teamPeminatApprove!.map((e) => e.toJson()).toList();
    _data['team_peminat_approve_total'] = teamPeminatApproveTotal;
    return _data;
  }
}

class TeamPeminatApprove {
  TeamPeminatApprove({
    required this.id,
    required this.teamId,
    required this.investorId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.teamNama,
    required this.investorNama,
    required this.investorPekerjaan,
    required this.investorFoto,
    required this.investorFotoUrl,
  });
  late final int id;
  late final String teamId;
  late final String investorId;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String teamNama;
  late final String investorNama;
  late final String investorPekerjaan;
  late final String investorFoto;
  late final String investorFotoUrl;

  TeamPeminatApprove.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    investorId = json['investor_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamNama = json['team_nama'];
    investorNama = json['investor_nama'];
    investorPekerjaan = json['investor_pekerjaan'];
    investorFoto = json['investor_foto'];
    investorFotoUrl = json['investor_foto_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['investor_id'] = investorId;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['team_nama'] = teamNama;
    _data['investor_nama'] = investorNama;
    _data['investor_pekerjaan'] = investorPekerjaan;
    _data['investor_foto'] = investorFoto;
    _data['investor_foto_url'] = investorFotoUrl;
    return _data;
  }
}
