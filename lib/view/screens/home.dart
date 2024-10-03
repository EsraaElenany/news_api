import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api/cubit/news/news_cubit.dart';
import 'package:news_api/view/screens/business_page.dart';
import 'package:news_api/view/screens/sport_page.dart';
import 'package:news_api/view/screens/tech_page.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

List<Widget> screens= [
  const BusinessPage(),
  const SportPage(),
  const TechPage(),
];
  @override
  Widget build(BuildContext context) {
   NewsCubit cubit= NewsCubit.get(context);
    return BlocBuilder<NewsCubit, NewsState>(
    builder: (context, state) {
    return Scaffold(
      body: screens[cubit.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap:(index){ cubit.changeBottomNavBar(index);},

          items:const  [

        BottomNavigationBarItem(icon: Icon(Icons.business_sharp), label: 'Business'),
        BottomNavigationBarItem(icon: Icon(Icons.sports_baseball_outlined), label: 'Sport'),
        BottomNavigationBarItem(icon: Icon(Icons.temple_hindu_outlined), label: 'technology'),

      ]),
    );
  },
);
  }
}
