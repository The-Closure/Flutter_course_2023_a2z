part of 'posts_bloc.dart';

@immutable
sealed class PostsEvent {}

class FetchPost extends PostsEvent {
  
}