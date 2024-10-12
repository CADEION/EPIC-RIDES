import 'package:epic_rides/data/models/car.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final Car car;
  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xff212020),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 5,
            offset: Offset(0, 4),
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Fortuner GR',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.directions_car_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    '${car.distance.toStringAsFixed(0)}km',
                    style: const TextStyle(color: Colors.white,fontSize: 12,),
                  ),
                  Icon(Icons.battery_charging_full_sharp,color: Colors.white,),
                  Text(
                    '${car.fuelCapacity.toStringAsFixed(0)}L',
                    style: const TextStyle(color: Colors.white,fontSize: 12,),
                  ),
                ],
              ),
              Icon(Icons.arrow_forward_ios,color: Colors.white,)
            ],
          )
        ],
      ),
    );
  }
}
