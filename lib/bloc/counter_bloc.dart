
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    int counter = 0;
    on<Increment>((event, emit) {
      counter++;
      emit(IncreasState(counter: counter));
      print(counter);
    },);

    on<Decrement>((event, emit) {
      counter--;
      if(counter < 0){
        emit(ErrorState());
      }else {
        emit(DecreasState(counter: counter));

      }
        print(counter);
    });
  }
}
