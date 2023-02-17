import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit22.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/search/search_screen.dart';

import '../cubit/cubit.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubet , NewsStates>(

        listener: (BuildContext context, state) { },

    builder: (BuildContext context, Object? state) {
          var cubit = NewsCubet.get(context);

          return  Scaffold(
            appBar: AppBar(
              title: Text("News" ,),
              actions: [

                IconButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>SearchScreen()));
                },
                    icon: Icon(Icons.search)),

                IconButton(onPressed: (){
                  // cull up method change App Mode Every time the IconButton is pressed, the value of isDark is changed
                  AppCubit.get(context).changeAppMode();
                },
                    icon: Icon(Icons.brightness_4_outlined)),

              ],
            ),

            body: cubit.screens[cubit.currentIndex],
            // Here to display the screens in the BottomNavigationBar by means of an index for the screens
            bottomNavigationBar:BottomNavigationBar(
              items: cubit.bottomItems,
              // Properties Bottom Navigation Bar icon and label
              currentIndex: cubit.currentIndex,  // The number of the BottomNavigationBar
              onTap: (index){
                cubit.changeBottomNavBar(index);
        // Here the screen is changed when the BottomNavigationBar is pressed
              },
            ) ,
          );

    },
    );
  }
}
