



import 'package:bloct_training/busnisess_logic/cubit/my_cubit.dart';
import 'package:bloct_training/constants/strings.dart';
import 'package:bloct_training/data/repository/my_repository.dart';
import 'package:bloct_training/data/web_services/web_service.dart';
import 'package:bloct_training/presentation/screens/details/details.dart';
import 'package:bloct_training/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class AppRouter{



  late MyRepository repository;
  late MyCubit cubit;


   AppRouter(){
    repository=MyRepository(WebService());
    cubit=MyCubit(repository);
   }

  Route? generateRoute(RouteSettings settings){

    switch(settings.name){
      case homeScreen:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
        create: (context) => cubit,
        child: const HomeScreen(),
      ));

       case detailsScreen:
      return MaterialPageRoute(builder: (_) => const DetailsScreen());
    }
    return null;
  } 
}