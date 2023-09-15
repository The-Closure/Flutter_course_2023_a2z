import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            centerTitle: true,
            expandedHeight: 200,
            // elevation: 0,
            flexibleSpace: Image.asset(
              'assets/image1.jpg',
              fit: BoxFit.fitWidth,
            ),
            // bottom: ,
            // title:
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 15,
              (context, index) => ListTile(
                title: Text(index.toString()),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.red,
              height: 200,
              width: 200,
            ),
          ),
          SliverGrid.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,crossAxisSpacing: 10,mainAxisSpacing: 12),
                itemCount: 40,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                child: Text(index.toString()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
