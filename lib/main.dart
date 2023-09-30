import 'package:factory_dart/bloc/manage_example_event_bloc.dart';
import 'package:factory_dart/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //     create: (context) => ThemeProvier(),
    //     builder: (context, child) {
    //       var provider = Provider.of<ThemeProvier>(context);
    //       return MaterialApp(
    //         home: Homepage(),
    //         theme: Provider.of<ThemeProvier>(context).theme,
    //       );
    //     }
    return MaterialApp(
      theme: ThemeData.light(),
      home: BlocExamplePage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvier>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              provider.changeTheme();
            },
            child: Text("Hello Wolrd")),
      ),
    );
  }
}

class BlocExamplePage extends StatelessWidget {
  const BlocExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageExampleEventBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: OutlinedButton(
                      onPressed: () {
                        context
                            .read<ManageExampleEventBloc>()
                            .add(ShowFlutterLogo());
                      },
                      child: Text("Flutter logo button")),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: OutlinedButton(
                      onPressed: () {
                        context
                            .read<ManageExampleEventBloc>()
                            .add(ShowErrorMessage());
                      },
                      child: Text("Error button")),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: OutlinedButton(
                      onPressed: () {
                        context
                            .read<ManageExampleEventBloc>()
                            .add(ShowCircleProgress());
                      },
                      child: Text("Loading Button")),
                ),
                ElevatedButton(onPressed: (){
                  context.read<ManageExampleEventBloc>().add(ShowHelloWolrd());
                }, child: Text('Hello wolrd event')),
                BlocBuilder<ManageExampleEventBloc, ManageExampleEventState>(
                  builder: (context, state) {
                    if(state is Success){
                    return FlutterLogo();

                    }
                    else if (state is Loading){
                      return CircularProgressIndicator();
                    }
                    else if (state is NoInternet){
                      return ListTile(title: Text("Hello WOlrd"),subtitle: Icon(Icons.not_interested),);
                
                    }
                    else {
                      return Text("Error Message");
                    }
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
