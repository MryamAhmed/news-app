import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modules/search/search.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/state.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (BuildContext context)=> NewsCubit()..getBussines(),
        child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context,state) {
            var cubit = NewsCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title:  Text(
                  'News App',
                ),
                actions: [
                  IconButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>Search())
                        );
                      },
                      icon: Icon(Icons.search)
                  ),
                  IconButton(
                      onPressed: (){
                        NewsCubit.get(context).changeAppMode();

                      },
                      icon: Icon(Icons.brightness_4_outlined)
                  ),
                ],
              ),

              body: cubit.screens[cubit.currindex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currindex,
                items: cubit.bottoms,
                onTap: (index)
                {
                  cubit.changeBottomNave(index);
                },
              ),

            );

          }
      )
    );




  }
}
