import 'package:bloc/bloc.dart';
import 'package:bloct_training/data/models/model.dart';
import 'package:bloct_training/data/repository/my_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'my_state.dart';

class MyCubit extends Cubit<MyState> {

final MyRepository repository;

late List<Films> filmsList;


  MyCubit(this.repository) : super(MyInitial());

  List<Films> getAll(){
    repository.getALl().then((films) {
emit(DataLoaded(films!)); // 
this.filmsList=films;
    });

    return filmsList;
  }
}
