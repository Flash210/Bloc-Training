part of 'my_cubit.dart';

@immutable
sealed class MyState {}

final class MyInitial extends MyState {}

class DataLoaded extends MyState {
  final List<Results> films;
  DataLoaded(this.films);
}
