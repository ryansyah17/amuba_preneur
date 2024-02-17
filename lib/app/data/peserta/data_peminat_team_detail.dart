class PeminatDetailData {
  PeminatDetailData({
    this.success,
    this.teamPeminatDetail,
  });
  late final bool? success;
  late final TeamPeminatDetail? teamPeminatDetail;

  PeminatDetailData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamPeminatDetail = TeamPeminatDetail.fromJson(json['team_peminat_detail']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_peminat_detail'] = teamPeminatDetail!.toJson();
    return _data;
  }
}

class TeamPeminatDetail {
  TeamPeminatDetail({
    required this.id,
    required this.teamId,
    required this.investorId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.teamNama,
    required this.userId,
    required this.investorNama,
    required this.investorFoto,
    required this.investorFotoId,
    required this.investorPekerjaan,
    required this.investorAlamat,
    required this.investorEmail,
    required this.investorNohp,
    required this.investorStatus,
    required this.investorFotoUrl,
    required this.investorFotoIdUrl,
  });
  late final int id;
  late final String teamId;
  late final String investorId;
  late final String status;
  late final String createdAt;
  late final String updatedAt;
  late final String teamNama;
  late final String userId;
  late final String investorNama;
  late final String investorFoto;
  late final String investorFotoId;
  late final String investorPekerjaan;
  late final String investorAlamat;
  late final String investorEmail;
  late final String investorNohp;
  late final String investorStatus;
  late final String investorFotoUrl;
  late final String investorFotoIdUrl;

  TeamPeminatDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    investorId = json['investor_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamNama = json['team_nama'];
    userId = json['user_id'];
    investorNama = json['investor_nama'];
    investorFoto = json['investor_foto'];
    investorFotoId = json['investor_foto_id'];
    investorPekerjaan = json['investor_pekerjaan'];
    investorAlamat = json['investor_alamat'];
    investorEmail = json['investor_email'];
    investorNohp = json['investor_nohp'];
    investorStatus = json['investor_status'];
    investorFotoUrl = json['investor_foto_url'];
    investorFotoIdUrl = json['investor_foto_id_url'];
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
    _data['user_id'] = userId;
    _data['investor_nama'] = investorNama;
    _data['investor_foto'] = investorFoto;
    _data['investor_foto_id'] = investorFotoId;
    _data['investor_pekerjaan'] = investorPekerjaan;
    _data['investor_alamat'] = investorAlamat;
    _data['investor_email'] = investorEmail;
    _data['investor_nohp'] = investorNohp;
    _data['investor_status'] = investorStatus;
    _data['investor_foto_url'] = investorFotoUrl;
    _data['investor_foto_id_url'] = investorFotoIdUrl;
    return _data;
  }
}
