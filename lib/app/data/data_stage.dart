class StageData {
  StageData({
    this.success,
    this.stageSchedule,
  });
  late final bool? success;
  late final StageSchedule? stageSchedule;

  StageData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    stageSchedule = StageSchedule.fromJson(json['stage_schedule']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['stage_schedule'] = stageSchedule!.toJson();
    return _data;
  }
}

class StageSchedule {
  StageSchedule({
    required this.teamId,
    required this.tahap,
    required this.tahapStatus,
    required this.docStatus,
    this.reason,
    required this.startDate,
    required this.endDate,
  });
  late final String teamId;
  late final String tahap;
  late final String tahapStatus;
  late final String docStatus;
  late final String? reason;
  late final String startDate;
  late final String endDate;

  StageSchedule.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    tahap = json['tahap'];
    tahapStatus = json['tahap_status'];
    docStatus = json['doc_status'];
    reason = json['reason'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['team_id'] = teamId;
    _data['tahap'] = tahap;
    _data['tahap_status'] = tahapStatus;
    _data['doc_status'] = docStatus;
    _data['reason'] = reason;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    return _data;
  }
}
