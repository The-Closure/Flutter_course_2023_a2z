part of 'manage_example_event_bloc.dart';

@immutable
sealed class ManageExampleEventState {}

final class ManageExampleEventInitial extends ManageExampleEventState {}

class Success extends ManageExampleEventState {}

class Error extends ManageExampleEventState {}

class Loading extends ManageExampleEventState {}
