
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../component/component.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubet , NewsStates>(
      listener:(context  , state){},
      builder: (context , state){
        var list=NewsCubet.get(context).sport;
        return articaleBuilder(list, context); // Here the article Builder is called to display the ListView of each branch

      },
    );

  }
}
