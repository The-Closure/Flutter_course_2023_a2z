import 'dart:convert';


class TodosModel {
  int userId;
  int id;
  String title;
  bool completed;
  TodosModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });


  TodosModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TodosModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userId': userId});
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'completed': completed});
  
    return result;
  }

  factory TodosModel.fromMap(Map<String, dynamic> map) {
    return TodosModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodosModel.fromJson(String source) => TodosModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TodosModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TodosModel &&
      other.userId == userId &&
      other.id == id &&
      other.title == title &&
      other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      completed.hashCode;
  }
}
