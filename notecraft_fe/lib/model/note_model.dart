class NoteModel {
  String id;
  String title;
  String content;
  String month;
  int date;
  int year;
  DateTime createdAt;
  DateTime updatedAt;

  NoteModel({
    required this.id,
    required this.title,
    required this.content,
    required this.month,
    required this.date,
    required this.year,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json["id"] as String,
        title: json["title"] as String,
        content: json["content"] as String,
        month: json["month"] as String,
        date: int.parse(json["date"].toString()),
        year: int.parse(json["year"].toString()),
        createdAt: DateTime.parse(json["createdAt"] as String),
        updatedAt: DateTime.parse(json["updatedAt"] as String),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "month": month,
        "date": date,
        "year": year,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
