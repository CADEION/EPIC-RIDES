import 'package:epic_rides/data/datasources/firebase_car_datasources.dart';
import 'package:epic_rides/data/models/car.dart';
import 'package:epic_rides/domain/repositories/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDatasources datasources;

  CarRepositoryImpl({required this.datasources});

  @override
  Future<List<Car>> fetchCars() {
    return datasources.getCars();
  }

}