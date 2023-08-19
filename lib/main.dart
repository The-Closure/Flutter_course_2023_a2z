import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PageController controller = PageController();

  PageController controller1 = PageController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: FlutterLogo(),
                  otherAccountsPictures: [FlutterLogo(), FlutterLogo()],
                  accountName: Text("Dr . Yaser"),
                  accountEmail: Text("yaer123@gmail.com")),
            ],
          ),
        ),
        appBar: AppBar(),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: 200,
                child: PageView(
                  controller: controller,
                  children: [
                    Container(
                      color: Colors.red,
                    ),
                    Container(
                      color: Colors.blue,
                    ),
                    Container(
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 60,
                height: 50,
                child: PageView(
                  controller: controller1,
                  children: [
                    Image.asset("assets/image/zero.png"),
                    Image.asset("assets/image/one.png"),
                    Image.asset("assets/image/two.png"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    controller.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                    controller1.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn);
                  },
                  child: Container(
                    child: Center(
                      child:
                          Text("Next", style: TextStyle(color: Colors.white)),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 139, 168, 181)),
                    width: 317,
                    height: 54,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
