



import 'package:bloct_training/constants/strings.dart';
import 'package:bloct_training/presentation/screens/details/details.dart';
import 'package:bloct_training/presentation/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter{



  Route? generateRoute(RouteSettings settings){

    switch(settings.name){
      case homeScreen:
      return MaterialPageRoute(builder: (_) => const HomeScreen());

       case detailsScreen:
      return MaterialPageRoute(builder: (_) => const DetailsScreen());
    }
    return null;
  } 
}