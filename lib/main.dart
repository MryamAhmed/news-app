
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';


import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/state.dart';
import 'package:newsapp/shared/network/remote/dio_helpear.dart';

import 'layout/newslayout.dart';

void main() async{
  //Bloc.observer = MyBlocObserver();
  DioHelper.init();


  runApp(MyApp());
}


class MyApp extends StatelessWidget
{
  @override
  Widget build (BuildContext context)
  {
    return BlocProvider(
        create: (BuildContext context)=> NewsCubit(),
        child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
          builder: (context,state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,   // البتاعة الي بتلف
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.black,
                    ),
                    titleSpacing: 20
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20,
                  backgroundColor: Colors.white,
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                textTheme: TextTheme(
                  bodyText1:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black
                  ),
                )
            ),

            darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),// البتاعة الي بتلف
                appBarTheme: AppBarTheme(
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ),
                    backgroundColor: HexColor('333739'),
                    elevation: 0.0,
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    iconTheme: IconThemeData(
                      color: Colors.white,
                    ),
                    titleSpacing: 20
                ),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20,
                  backgroundColor: HexColor('333739'),
                ),
                floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor: Colors.deepOrange
                ),
                textTheme: TextTheme(
                  bodyText1:TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                  ),
                )
            ),

            themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light ,

            home: NewsLayout(),
          );
        }
        )
      );



  }
}