import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'manage_example_event_event.dart';
part 'manage_example_event_state.dart';

class ManageExampleEventBloc extends Bloc<ManageExampleEventEvent, ManageExampleEventState> {
  ManageExampleEventBloc() : super(ManageExampleEventInitial()) {
    on<ShowFlutterLogo>((event, emit) {
      print(state);
      emit(Success());
    } );

    on<ShowCircleProgress>((event, emit) => emit(Loading()));

    on<ShowErrorMessage>((event, emit) => emit(Error()));
  }
}
