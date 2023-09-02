import 'dart:math';

import 'package:bottom_navigate_bar/service/get_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int indexOfThePage = 1;

// List<String> tasks = ["Clean", "Cooking", "Study", "Work"];

// ! Responsive Design

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Container(
          decoration: ShapeDecoration(color: Colors.blue,shape: CircleBorder()),
          ),
        ),
        Positioned(
          left: 140,
          top: 20,
          child: Transform.rotate(
            angle: pi / 4,
            child: SizedBox(
              
          width: 20,
          height: 100,
          child: Container(
            color: Colors.red,
          ),
            ),
          ),
        ),
      ],
    )

        // ? Service Layer
        // body: StreamBuilder(
        //   stream: getData(1000),
        //   builder: (context, snapshot) {

        //     if (snapshot.hasData) {
        //       return Center(
        //         child: Text(snapshot.data.toString()),
        //       );
        //     } else if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     } else {
        //     return Center(
        //         child: Text("There is an error in fetching data"),
        //       );
        //     }
        //   },
        // ),
// ? Responsive
        // body: LayoutBuilder(builder: (context, constraints) {
        //   if(constraints.maxWidth > 600){
        //     return Container(color: Colors.red,);
        //   }
        //   else {
        //     return Container(color: Colors.blue,);
        //   }
        // },),
        );
  }
}
