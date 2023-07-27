import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';

class Search extends StatelessWidget {

  var searchController = TextEditingController();
  @override
  //هيعمل ايرور لو كريت البلوك هنا ف عشان كدا هنعمل الليست في المان
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener:(context, state) {},
        builder: (context , state){
          var list = NewsCubit.get(context).search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children:
              [
                Padding (
                  padding: const EdgeInsets.all(20),
                  child: defultTextFeild(
                    type:TextInputType.text,
                    label: 'search',
                    validate: (String value)
                    {
                      if(value.isEmpty)
                      {
                        return 'search must not be empty';
                      }
                      else
                      {
                        return null;
                      }
                    },
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    },

                    controller: searchController,
                    prefix: Icons.search,
                  ),
                ),
                Expanded(child:articleBuilder(List,context,isSearch: true,),),
              ],
            ),
          );
        }
    );



  }
}
