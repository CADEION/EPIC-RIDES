import 'package:epic_rides/data/models/car.dart';
import 'package:epic_rides/domain/repositories/car_repository.dart';

class GetCars {
  final CarRepository repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}