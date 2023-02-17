import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/cubit22.dart';
import 'package:news_app/cubit/states22.dart';
import 'package:news_app/local/cache_Helper.dart';
import 'package:news_app/network/MyBlocOserver.dart';
import 'package:news_app/network/dio_helper.dart';

import 'layout/news_Layout.dart';

void main() async{
  // Make sure everything is done, then open the application
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer=MyBlocObserver();
  DioHelper.init();

  // Here the value is returned
  bool? isDark = await CacheHelper.getData(key: "isDark");
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
 late bool isDark;

  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubet()
          ..getBusiness()..getSport()..getScience(),),
        BlocProvider(create: (BuildContext context)=>AppCubit()
          ..changeAppMode(
            fromShared: isDark,
          ),),

      ],
        child: BlocConsumer<AppCubit , AppState>(
          listener: (context, state){},
          builder: (context , state){
            return  MaterialApp(
              title: 'News app',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(

                appBarTheme: const AppBarTheme(
                    color: Colors.white,
                    elevation: 0,

                    titleTextStyle: TextStyle(
                        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    iconTheme: IconThemeData(
                        color: Colors.black
                    ),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark)),
                bottomNavigationBarTheme:
                BottomNavigationBarThemeData(
                  type:BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.red[300],
                  elevation: 20,

                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(fontSize: 16 ,
                        fontWeight: FontWeight.w600 , color: Colors.black),
                    bodyText2: TextStyle(color: Colors.grey)
                ),
                scaffoldBackgroundColor: Colors.white,
              ),
              darkTheme:ThemeData(
                  scaffoldBackgroundColor: Colors.white24,
                  primaryTextTheme: TextTheme(
                    bodyText1: TextStyle(fontSize: 18 ,
                        fontWeight: FontWeight.w600 , color: Colors.white),
                  ),
                  appBarTheme: const AppBarTheme(
                    //the theme is changed to dark mode
                      color: Colors.black12,
                      elevation: 0,
                      titleTextStyle: TextStyle(
                          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      iconTheme: IconThemeData(
                          color: Colors.white
                      ),
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white24,
                          statusBarIconBrightness: Brightness.dark)),
                  bottomNavigationBarTheme:
                  BottomNavigationBarThemeData(
                      type:BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.red[300],
                      elevation: 20,
                      backgroundColor: Colors.white12,
                      unselectedItemColor: Colors.white

                  ),
                  textTheme: TextTheme(
                      bodyText1: TextStyle(fontSize: 16 ,
                          fontWeight: FontWeight.w600 , color: Colors.white),
                      bodyText2: TextStyle(color: Colors.grey)
                  ),



              ) ,
              // i cull up the cubit and cull isDark of boolean
              // When isDark is true, the screen turns into Dark mode and vice versa
              themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              home: NewsLayout(),


            );
          },

      ),
    );
  }
}
