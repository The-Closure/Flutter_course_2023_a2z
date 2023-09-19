import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              dynamic data = snapshot.data;
              
              Post postData = Post.fromJson(data.toString());
                  
              return Center(
                child: Text(postData.title),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(
                child: Text("There is no Internet"),
              );
            }
          },
        ),
      ),
    );
  }
}

getData() async {
  Dio dio = Dio();
  final response = await dio.get('http://jsonplaceholder.typicode.com/posts/1');
  print(response.statusCode);

  return response;
}

class Post {
  int userId;
  int id;
  String title;
  String body;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  Post copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Post(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'userId': userId});
    result.addAll({'id': id});
    result.addAll({'title': title});
    result.addAll({'body': body});
  
    return result;
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userd']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Post &&
      other.userId == userId &&
      other.id == id &&
      other.title == title &&
      other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      body.hashCode;
  }
}
