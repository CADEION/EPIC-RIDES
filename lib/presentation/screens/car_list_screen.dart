import 'package:epic_rides/data/models/car.dart';
import 'package:epic_rides/presentation/bloc/car_bloc.dart';
import 'package:epic_rides/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  // final List<Car> cars = [
  //   Car(
  //       model: 'Fortuner GR',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 100),
  //   Car(
  //       model: 'Fortuner GR',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 100),
  //   Car(
  //       model: 'Fortuner GR',
  //       distance: 870,
  //       fuelCapacity: 50,
  //       pricePerHour: 100),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Choose Your Car',
            textAlign: TextAlign.center,
          ),
          shadowColor: Colors.black12,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarsLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CarsLoadedState) {
              return ListView.builder(
                  itemCount: state.cars.length,
                  itemBuilder: (context, index) {
                    return CarCard(car: state.cars[index]);
                  });
            } else if (state is CarsLoadingErrorState) {
              return Center(
                child: Text('error : ${state.message}'),
              );
            }
            return Container();
          },
        ));
  }
}
