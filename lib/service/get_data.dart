

// import 'package:dio/dio.dart';

 Stream<int> getData(int count)async*{
for (var i = 0; i < count; i++) {
  await Future.delayed(Duration(seconds: 1),(){
      
  });
  yield i;
}
  
}

