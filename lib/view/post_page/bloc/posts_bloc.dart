import 'package:bloc/bloc.dart';
import 'package:clean_arhc/core/data/post_model/post_model.dart';
import 'package:clean_arhc/core/service/post_service/get_post.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<FetchPost>((event, emit)async {
      dynamic data = await getPosts();
      if (data is String){
        emit(Error(
          error_message: data
        ));
      }
      else {
        
        emit(Success(post_data: data));
      }
    });
  }
}
