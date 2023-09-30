import 'package:demo_bloc/bloc/counter_bloc.dart';
import 'package:demo_bloc/bloc_observe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const AppBlocObserver();
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, state) {
                    if (state is IncreasState) {
                      return Text(state.counter.toString());
                    } else if (state is DecreasState) {
                      return Text(state.counter.toString());
                    } else {
                      return Text("zero counter");
                    }
                  },
                )
              ],
            ),
          ),
          floatingActionButton: SizedBox(
            width: 200,

            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Increment());
                  },
                  tooltip: 'Increment',
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(Decrement());
                  },
                  tooltip: 'decreament',
                  child: const Icon(Icons.minimize),
                ),
              ],
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      }),
    );
  }
}
