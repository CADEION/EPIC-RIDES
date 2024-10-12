
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epic_rides/data/datasources/firebase_car_datasources.dart';
import 'package:epic_rides/data/repositories/car_repository_impl.dart';
import 'package:epic_rides/domain/repositories/car_repository.dart';
import 'package:epic_rides/domain/usecases/get_cars.dart';
import 'package:epic_rides/presentation/bloc/car_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void initInjection(){
  try {
    getIt.registerLazySingleton<FirebaseFirestore>(()=>FirebaseFirestore.instance);
    getIt.registerLazySingleton<FirebaseCarDatasources>(()=>FirebaseCarDatasources(firebaseFirestore: getIt<FirebaseFirestore>()));
    getIt.registerLazySingleton<CarRepository>(()=>CarRepositoryImpl(datasources: getIt<FirebaseCarDatasources>()));
    getIt.registerLazySingleton<GetCars>(()=>GetCars(getIt<CarRepository>()));
    getIt.registerFactory(()=> CarBloc(getCars: getIt<GetCars>()));
  } catch (e) {
    throw e;
  }
}