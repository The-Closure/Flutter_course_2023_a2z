import 'package:dio/dio.dart';

import 'package:service/service.dart' as service;

import 'model/todos_model.dart';
import 'service/todos_service.dart';

void main() async {
  print(await getHttp());
}

