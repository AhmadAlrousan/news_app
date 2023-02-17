
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/component/component.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/cubit22.dart';
import 'package:news_app/cubit/states.dart';
class SearchScreen extends StatelessWidget {


  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubet,NewsStates>(
      listener: (context , state){

      },
      builder: (context , state){
        ///......
        var list=NewsCubet.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SafeArea(
              child: Column(children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color:  AppCubit.get(context).isDark ? Colors.white24 : Colors.black12,
                  child: TextFormField(
                    style: TextStyle(color:  AppCubit.get(context).isDark ? Colors.white : Colors.black),
                      onChanged: (value){
                        NewsCubet.get(context).getSearch(value);
                      },
                      controller: searchController,
                      keyboardType: TextInputType.text,
                      validator: (String? value){
                        if(value!.isEmpty)
                        {
                          return 'search nust be empty';
                        }
                        return '';
                      },
                      decoration: InputDecoration(

                          label: Text('Search' ,style: TextStyle(
                              color:  AppCubit.get(context).isDark ? Colors.white : Colors.black),),
                          fillColor: AppCubit.get(context).isDark ? Colors.white : Colors.black,

                      )),
                ),
               Expanded(child:  articaleBuilder(list, context))
              ],),
            ),
          ),

        );
      },
    );
  }
}
