part of 'posts_bloc.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

class Success extends PostsState {
  PostModel post_data;
  Success({
    required this.post_data,
  });
}

class Error extends PostsState {
  String error_message;
  Error({
    required this.error_message,
  });
}

class Loading extends PostsState {}