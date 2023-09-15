import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:padding_and/config/resources/color_schema.dart';
import 'package:padding_and/config/resources/string.dart';
import 'package:padding_and/config/resources/values_app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.home), label: 'Home')
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(onPressed: (){}, icon: Icon(Icons.notification_add)),
              pinned: true,
              floating: true,
              centerTitle: true,
              expandedHeight: 200,
              // elevation: 0,
              // flexibleSpace: Image.asset(
              //   'assets/image1.jpg',
              //   fit: BoxFit.fitWidth,
              // ),
              // bottom: ,
              title: Text(HELLOWORLD).tr()),
          SliverList.separated(
            itemCount: 15,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) => ListTile(
              title: Text(index.toString()),
            ),
          ),
          SliverToBoxAdapter(
            child: ElevatedButton(onPressed: () {

              // ! Change Lang
              if(context.locale.languageCode == 'en'){

              context.setLocale(Locale('ar'));
              } else {
                context.setLocale(Locale('en'));
              }


            }, child: Text(HELLO).tr()),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: secondary,
              height: 200,
              width: 200,
            ),
          ),
          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, crossAxisSpacing: 10, mainAxisSpacing: 12),
            itemCount: 40,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(Value.p8),
              child: CircleAvatar(
                child: Text(index.toString()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
