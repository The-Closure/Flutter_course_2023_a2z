import 'package:clean_arhc/view/post_page/bloc/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostUI extends StatelessWidget {
  const PostUI({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostsBloc()..add(FetchPost()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: BlocBuilder<PostsBloc, PostsState>(
              builder: (context, state) {
                if (state is Success) {
                  return Center(
                    child: ListTile(
                      title: Text(state.post_data.title),
                      subtitle: Text(state.post_data.body),
                    ),
                  );
                } else if (state is Error) {
                  return Center(
                    child: Text(state.error_message),
                  );
                }
                else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          );
        }
      ),
    );
  }
}
