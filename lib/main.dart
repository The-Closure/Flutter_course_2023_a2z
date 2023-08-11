import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Demo Home Page"),
          ),
          body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Spacer(
                  flex: 3,
                ),
                Center(
                    child:
                        Text("you have pushed the button this many times : ")),
                Center(child: Text("5")),
                Spacer(
                  flex: 3,
                ),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.blue),
                )
              ]),
        )
        // body: Center(
        //   child: Container(
        //     decoration: BoxDecoration(
        //         gradient:const LinearGradient(
        //             colors: [Colors.red, Colors.blue, Colors.yellow],
        //             tileMode: TileMode.mirror,
        //             begin: Alignment.bottomCenter,
        //             end: Alignment.topLeft
        //             ),
        //         // color: Colors.yellow,
        //         border: Border.all(color: Colors.green, width: 3),
        //         borderRadius: BorderRadius.all(Radius.circular(35))),
        //     width: 200,
        //     height: 200,
        //     child: Center(
        //       child: Text("data"),
        //     ),
        //   ),
        // ),
        );
  }
}
