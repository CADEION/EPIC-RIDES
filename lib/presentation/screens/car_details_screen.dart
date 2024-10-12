import 'package:epic_rides/data/models/car.dart';
import 'package:epic_rides/presentation/screens/map_details_screen.dart';
import 'package:epic_rides/presentation/screens/more_card.dart';
import 'package:epic_rides/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;
  const CarDetailsScreen({super.key, required this.car});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.info_outline), Text(' Information')],
        ),
      ),
      body: Column(
        children: [
          CarCard(
            car: Car(
                model: car.model,
                distance: car.distance,
                fuelCapacity: car.fuelCapacity,
                pricePerHour: car.pricePerHour),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    decoration: BoxDecoration(
                        color: const Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 5,
                              blurRadius: 10)
                        ]),
                    child: const Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/user.png'),
                          radius: 40,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Jane Cooper',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$4,253',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MapDetailsScreen(car: car)));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      height: 170,
                      decoration: BoxDecoration(
                          color: const Color(0xffF3F3F3),
                          image: const DecorationImage(
                              image: AssetImage('assets/maps.png'),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 5,
                                blurRadius: 10)
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16),
              child: Column(
                children: [
                  MoreCard(
                    car: Car(
                        model: '${car.model} -1',
                        distance: car.distance+100,
                        fuelCapacity: car.fuelCapacity +150,
                        pricePerHour: car.pricePerHour+200),
                  ),
                  Divider(
                    height: 15,
                  ),
                  MoreCard(
                    car: Car(
                        model: '${car.model} -1',
                        distance: car.distance+200,
                        fuelCapacity: car.fuelCapacity +300,
                        pricePerHour: car.pricePerHour+400),
                  ),
                  Divider(
                    height: 15,
                  ),
                  MoreCard(
                    car: Car(
                        model: '${car.model} -3',
                        distance: car.distance+300,
                        fuelCapacity: car.fuelCapacity +450,
                        pricePerHour: car.pricePerHour+600),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
