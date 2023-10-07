// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_arhc/core/data/post_model/post_model.dart';
import 'package:clean_arhc/core/service/post_service/get_post.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Post Service Test', ()async {
    expect(
       await getPosts(),
        PostModel(
            userId: 1,
            id: 1,
            title:
                "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
            body:
                "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"));
  });
}
