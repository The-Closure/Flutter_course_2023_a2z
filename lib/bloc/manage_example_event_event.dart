part of 'manage_example_event_bloc.dart';

@immutable
sealed class ManageExampleEventEvent {}

class ShowFlutterLogo extends ManageExampleEventEvent {}

class ShowCircleProgress extends ManageExampleEventEvent {}

class ShowErrorMessage extends ManageExampleEventEvent {}
