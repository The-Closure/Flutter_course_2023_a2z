
import 'package:dio/dio.dart';

import '../model/todos_model.dart';

final dio = Dio();

getHttp() async {
  final response =
      await dio.get('https://jsonplaceholder.typicode.com/todos/1');
      print(response);

  TodosModel myData = TodosModel.fromMap(response.data);

  return myData.title;
  
}
