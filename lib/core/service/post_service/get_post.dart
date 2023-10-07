
import 'package:clean_arhc/core/data/post_model/post_model.dart';
import 'package:dio/dio.dart';

getPosts()async {
  Dio dio = Dio();


  Response response = await dio.get('http://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200){
    PostModel postData = PostModel.fromMap(response.data);
    return postData;
  }
  else {
    return 'There is an Error';
  }
}