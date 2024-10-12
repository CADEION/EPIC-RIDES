import 'package:epic_rides/data/models/car.dart';

abstract class CarRepository {
  Future<List<Car>> fetchCars();
}