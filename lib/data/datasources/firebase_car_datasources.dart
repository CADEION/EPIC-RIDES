import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epic_rides/data/models/car.dart';

class FirebaseCarDatasources {
  final FirebaseFirestore firebaseFirestore;

  FirebaseCarDatasources({required this.firebaseFirestore});

  Future<List<Car>> getCars() async{
    var snap = await firebaseFirestore.collection('cars').get();
    return snap.docs.map((doc)=> Car.fromMap(doc.data())).toList();
  }
}