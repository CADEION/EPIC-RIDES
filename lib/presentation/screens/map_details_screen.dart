import 'package:epic_rides/data/models/car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapDetailsScreen extends StatelessWidget {
  final Car car;
  const MapDetailsScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 40,
            )),
      ),
      body: Stack(children: [
        FlutterMap(
            options: MapOptions(
              initialCenter:
                  LatLng(51.509364, -0.128928), // Center the map over London
              initialZoom: 13,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
                subdomains: const ['a', 'b', 'c'],
              ),
            ]),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: CarDetailsCard(),
        )
      ]),
    );
  }

  Widget CarDetailsCard() {
    return SizedBox(
      height: 350,
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 4)
              ]),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                ' ${car.model}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.directions_car_rounded,
                    color: Colors.white,
                  ),
                  Text(
                    '${car.distance.toStringAsFixed(0)}km',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    Icons.battery_charging_full_sharp,
                    color: Colors.white,
                  ),
                  Text(
                    ' ${car.fuelCapacity.toStringAsFixed(0)}L',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38, spreadRadius: 0, blurRadius: 4)
                ]),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  'Features',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                featureIcons(),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('\$${car.pricePerHour.toStringAsFixed(2)}/h'),
                    SizedBox(height: 10,),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(top: 60,right: 30,child: Image.asset('assets/white_car.png'),),
      ]),
    );
  }

  Widget featureIcons() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      featureIcon(Icons.local_gas_station, 'Diesel', 'Common Rail'),
      featureIcon(Icons.speed, 'Acceleration', '0 - 100km/s'),
      featureIcon(Icons.ac_unit, 'Cold', 'Temp Control'),
    ],
  );
}

}
  Widget featureIcon(IconData icon,String title,String subTitle){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.grey,width: 1)
      ),
      child: Column(
        children: [
          Icon(icon,size: 28,),
          Text(title,style: TextStyle(),),
          Text(subTitle,style: TextStyle(fontSize: 10),)
        ],
      ),
    );
  }

