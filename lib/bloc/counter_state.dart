part of 'counter_bloc.dart';

abstract class CounterState {}

final class CounterInitial extends CounterState {}

class IncreasState extends CounterState {
  int counter =0;
  IncreasState({
    required this.counter,
  });
}

class DecreasState extends CounterState {
   int counter = 0;
  DecreasState({
    required this.counter,
  });
}

class ErrorState extends CounterState {}