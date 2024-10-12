part of 'car_bloc.dart';

@immutable
sealed class CarState {}

final class CarInitial extends CarState {}

class CarsLoadingState extends CarState {}

class CarsLoadedState extends CarState {
  final List<Car> cars;
  CarsLoadedState({required this.cars});
}

class CarsLoadingErrorState extends CarState {
  final String message;
  CarsLoadingErrorState({required this.message});
}


