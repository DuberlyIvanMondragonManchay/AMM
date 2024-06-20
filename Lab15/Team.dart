class TeamFields {
  static const String tableName = 'teams';
  static const String id = '_id';
  static const String name = 'name';
  static const String year = 'year';
  static const String lastDate = 'last_date';

  static const List<String> values = [
    id,
    name,
    year,
    lastDate,
  ];

  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
}

class TeamModel {
  int? id;
  final String name;
  final int year;
  final DateTime lastDate;

  TeamModel({
    this.id,
    required this.name,
    required this.year,
    required this.lastDate,
  });

  Map<String, dynamic> toJson() => {
        TeamFields.id: id,
        TeamFields.name: name,
        TeamFields.year: year,
        TeamFields.lastDate: lastDate.toIso8601String(),
      };

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        id: json[TeamFields.id] as int?,
        name: json[TeamFields.name] as String,
        year: json[TeamFields.year] as int,
        lastDate: DateTime.parse(json[TeamFields.lastDate] as String),
      );

  TeamModel copyWith({
    int? id,
    String? name,
    int? year,
    DateTime? lastDate,
  }) =>
      TeamModel(
        id: id ?? this.id,
        name: name ?? this.name,
        year: year ?? this.year,
        lastDate: lastDate ?? this.lastDate,
      );
}
