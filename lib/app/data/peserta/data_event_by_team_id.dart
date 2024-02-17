class EventByTeamIdData {
  EventByTeamIdData({
    this.success,
    this.teamEvent,
    this.teamEventTotal,
  });
  late final bool? success;
  late final List<TeamEvent>? teamEvent;
  late final int? teamEventTotal;

  EventByTeamIdData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    teamEvent = List.from(json['team_event'])
        .map((e) => TeamEvent.fromJson(e))
        .toList();
    teamEventTotal = json['team_event_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['team_event'] = teamEvent!.map((e) => e.toJson()).toList();
    _data['team_event_total'] = teamEventTotal;
    return _data;
  }
}

class TeamEvent {
  TeamEvent({
    required this.id,
    required this.teamId,
    required this.judul,
    required this.tanggal,
    required this.jamMulai,
    required this.jamSelesai,
    required this.lokasi,
    required this.foto,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
    required this.teamNama,
    required this.fotoUrl,
    required this.status,
  });
  late final int id;
  late final String teamId;
  late final String judul;
  late final String tanggal;
  late final String jamMulai;
  late final String jamSelesai;
  late final String lokasi;
  late final String foto;
  late final String url;
  late final String createdAt;
  late final String updatedAt;
  late final String teamNama;
  late final String fotoUrl;
  late final String status;

  TeamEvent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamId = json['team_id'];
    judul = json['judul'];
    tanggal = json['tanggal'];
    jamMulai = json['jam_mulai'];
    jamSelesai = json['jam_selesai'];
    lokasi = json['lokasi'];
    foto = json['foto'];
    url = json['url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    teamNama = json['team_nama'];
    fotoUrl = json['foto_url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['team_id'] = teamId;
    _data['judul'] = judul;
    _data['tanggal'] = tanggal;
    _data['jam_mulai'] = jamMulai;
    _data['jam_selesai'] = jamSelesai;
    _data['lokasi'] = lokasi;
    _data['foto'] = foto;
    _data['url'] = url;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['team_nama'] = teamNama;
    _data['foto_url'] = fotoUrl;
    _data['status'] = status;
    return _data;
  }
}
