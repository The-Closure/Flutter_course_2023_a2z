import 'dart:convert';

class ToDoModel {
  int userId;
  int id;
  String title;
  bool completed;
  ToDoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  ToDoModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return ToDoModel(
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

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) => ToDoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ToDoModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is ToDoModel &&
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
