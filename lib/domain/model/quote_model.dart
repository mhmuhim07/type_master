class QuoteModel {
  final String quote;
  final int id;
  final int length;

  QuoteModel({required this.quote, required this.id, required this.length});

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      quote: json['text'],
      id: json['id'],
      length: json['length'],
    );
  }
}
