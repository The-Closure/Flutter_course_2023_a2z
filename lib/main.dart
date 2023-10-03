import 'package:demo_bloc/bloc/counter_bloc.dart';
import 'package:demo_bloc/config/bloc_observe.dart';
import 'package:demo_bloc/model/question.dart';
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
        home: MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => CounterBloc(),
          )
        ], child: QuestionPage()));
  }
}

class QuestionPage extends StatelessWidget {
  QuestionPage({super.key});

  List<Question> question = [
    Question(title: 'How Long this Tower is ?', answers: [
      Answers(answer_title: '2', is_correct: false),
      Answers(answer_title: '29', is_correct: true),
      Answers(answer_title: '20', is_correct: false),
      Answers(answer_title: '16', is_correct: false)
    ])
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: question.length,
        itemBuilder: (context, index) => Column(
          children: [
            Text(question[index].title),
            SizedBox(
              width: double.maxFinite,
              height: 600,
              child: GridView.builder(
                itemCount: question[index].answers.length,
                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, ind) => Container(
                  child: Center(
                    child: Text(question[index].answers[ind].answer_title),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
