import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ExpansionTile(
  
                trailing: IconButton(icon: Icon(Icons.add),onPressed: (){}),
                title: Text("Hel Expasion"),
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 9,
                      itemBuilder: (context, index) => FlutterLogo(
                        size: 300,
                      ),
                    ),
                  )
                ],
              ),
              ListTile(
                title: Text("Hello ListTIle"),
              ),
              FlutterLogo(
                size: 300,
              ),
              FlutterLogo(
                size: 300,
              ),
              FlutterLogo(
                size: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double conitare_height = 500;
double conatiner_width = 300;
Color color = Colors.red;

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              setState(() {
                conatiner_width = conatiner_width + 20;
                conitare_height = 300;

                color = Colors.black;
              });
            }),
      ),
      body: Center(
        child: Hero(
          tag: '1',
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            width: conatiner_width,
            height: conitare_height,
            color: color,
            child: FlutterLogo(
              size: 400,
            ),
          ),
        ),
      ),
    );
  }
}

// class ThirdPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [IconButton(onPressed: (){
      
//       }, icon: icon)]),
//     );
//   }

// }