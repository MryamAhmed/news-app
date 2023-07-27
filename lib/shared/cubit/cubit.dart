import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/cubit/state.dart';


import '../../modules/business/business.dart';
import '../../modules/sciense/science.dart';
import '../../modules/sports/sports.dart';
import '../network/remote/dio_helpear.dart';

class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);


  int currindex = 0;

  List<BottomNavigationBarItem>  bottoms =
  [
    const BottomNavigationBarItem(
      icon: Icon(
          Icons.business
      ),
        label: 'business'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.sports
        ),
        label: 'sports'
    ),
    const BottomNavigationBarItem(
        icon: Icon(
            Icons.science
        ),
        label: 'science'
    ),
  ];

  List<Widget> screens = [
    business(),
    Sports(),
    Science(),
  ];

  void changeBottomNave(index) {
    currindex = index;
    if(index == 1){
      getSports();
    }
    if(index == 2){
      getSciences();
    }

    emit(BottomNavState());
  }

  List<dynamic> bussiness = [];

  void getBussines() {
    emit(newsGetBussinesLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '8f992486939842f2a7c8a4cffdb6ae61',
        }
    )
        .then((value) {
      bussiness = value.data['articles'];
      print(bussiness[0]['title']);
      emit(newsGetBussinesSucceesState());
    })
        .catchError((error) {
      print(error.toString());
      emit(newsGetBussinesErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(newsGetSportsLoadingState());

    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '8f992486939842f2a7c8a4cffdb6ae61',
        }
    )
        .then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(newsGetSportsSucceesState());
    }).catchError((error) {
      print(error.toString());
      emit(newsGetSportsErrorState(error.toString()));
    });
  }


  List<dynamic> sciences = [];

  void getSciences() {
    emit(newsGetScienseLoadingState());


    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '8f992486939842f2a7c8a4cffdb6ae61',
        }
    )
        .then((value) {
      sciences = value.data['articles'];
      print(sciences[0]['title']);
      emit(newsGetScienseSucceesState());
    }).catchError((error) {
      print(error.toString());
      emit(newsGetScienseErrorState(error.toString()));
    });
  }


  bool isDark = false;
  void changeAppMode()
  {
    isDark = !isDark;
    emit(changeModeState());

     /*
    if(fromShared != null)    //  معني كدا انه مس بنل يعني جايلي قيمته من المان ف هخلي الفاريبال بتاعي دا بيساوي القيمة الي جيالي من الكان دي عشان تثبت
        {
      isDark = fromShared;
      emit(changeModeState());
    }


    else   //معني كدا انه   ب نل يعني في دوسة ع الزرار ف هعكس لان الزرار بيعكس
        {
      isDark = !isDark;

     */
     /* CacheHelper.putBool(key:'isDark', value: isDark).then((value) {
        emit(changeModeState());
      });
        // كدا بعتله قيمة الدوسة هرمح اخدها في المان بقي
      */

    }


  List<dynamic> search = [];

  void getSearch(String value) {
    emit(newsGetSearchLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q': '$value',
          'apiKey': '8f992486939842f2a7c8a4cffdb6ae61',
        }
    ).then((value)
    {
      search = value.data['articles'];
      print(search[0]['title']);
      emit(newsGetSearchSucceesState());
    }).catchError((error) {
      print(error.toString());
      emit(newsGetSearchErrorState(error.toString()));
    });


  }

}





