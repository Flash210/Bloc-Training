import 'package:bloct_training/data/models/model.dart';
import 'package:bloct_training/data/repository/my_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {

final MyRepository repository;

 List<Results> filmsList=[];


  MyCubit(this.repository) : super(MyInitial());

  List<Results> getAll(){
    repository.getALl().then((films) {
emit(DataLoaded(films!)); // 
filmsList=films;
    });

    return filmsList;
  }
}
