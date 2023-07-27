import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/component.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/state.dart';


class Sports extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context, state) {},
      builder: (context , state){
        var List = NewsCubit.get(context).sports;
        return  articleBuilder(List,context);
      },
    );
  }
}


