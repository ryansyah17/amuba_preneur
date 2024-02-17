class SponsorMediaPartner {
  SponsorMediaPartner({
    this.success,
    this.sponsors,
    this.sponsorsTotal,
  });
  late final bool? success;
  late final List<Sponsors>? sponsors;
  late final int? sponsorsTotal;

  SponsorMediaPartner.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    sponsors =
        List.from(json['sponsors']).map((e) => Sponsors.fromJson(e)).toList();
    sponsorsTotal = json['sponsors_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['sponsors'] = sponsors!.map((e) => e.toJson()).toList();
    _data['sponsors_total'] = sponsorsTotal;
    return _data;
  }
}

class Sponsors {
  Sponsors({
    required this.id,
    required this.nama,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
    required this.logoUrl,
  });
  late final int id;
  late final String nama;
  late final String logo;
  late final String createdAt;
  late final String updatedAt;
  late final String logoUrl;

  Sponsors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    logo = json['logo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['nama'] = nama;
    _data['logo'] = logo;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['logo_url'] = logoUrl;
    return _data;
  }
}
