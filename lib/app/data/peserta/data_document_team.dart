class DocumentTeamData {
  DocumentTeamData({
    this.success,
    this.teamDocs,
    this.teamDocsTotal,
  });
  late final bool? success;
  late final List<TeamDocs>? teamDocs;
  late final int? teamDocsTotal;

  DocumentTeamData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamDocs =
        List.from(json['team_docs']).map((e) => TeamDocs.fromJson(e)).toList();
    teamDocsTotal = json['team_docs_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_docs'] = teamDocs!.map((e) => e.toJson()).toList();
    _data['team_docs_total'] = teamDocsTotal;
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
