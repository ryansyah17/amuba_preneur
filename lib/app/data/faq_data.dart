class FaqData {
  FaqData({
    this.success,
    this.faqs,
    this.faqsTotal,
  });
  late final bool? success;
  late final List<Faqs>? faqs;
  late final int? faqsTotal;

  FaqData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    faqs = List.from(json['faqs']).map((e) => Faqs.fromJson(e)).toList();
    faqsTotal = json['faqs_total'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['faqs'] = faqs!.map((e) => e.toJson()).toList();
    _data['faqs_total'] = faqsTotal;
    return _data;
  }
}

class Faqs {
  Faqs({
    required this.id,
    required this.type,
    required this.question,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String type;
  late final String question;
  late final String answer;
  late final String createdAt;
  late final String updatedAt;

  Faqs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    question = json['question'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['question'] = question;
    _data['answer'] = answer;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
