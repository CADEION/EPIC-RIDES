import 'package:bloc/bloc.dart';
import 'package:epic_rides/data/models/car.dart';
import 'package:epic_rides/domain/usecases/get_cars.dart';
import 'package:meta/meta.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarsLoadingState()) {
    on<LoadCars>((event, emit) async {
      emit(CarsLoadingState());
      try{
        final cars = await getCars.call();
        emit(CarsLoadedState(cars: cars ));
      }catch(e){
        emit(CarsLoadingErrorState(message: e.toString()));
      }
  });
}}
