import 'package:flexicharge/models/charger_point.dart';
import 'package:flutter/material.dart';

import 'package:flexicharge/ui/widgets/nearest_station.dart';

class ChargerLocations extends StatelessWidget {
  const ChargerLocations({
    required this.chargerPoints,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final Function(ChargerPoint)? onTap;
  final List<Map<String, dynamic>> chargerPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: chargerPoints.map((chargerPoint) {
        return NearestStation(
          onTap:
              onTap != null ? () => onTap!(chargerPoint['chargerPoint']) : null,
          location: chargerPoint['location'],
          distance: chargerPoint['distance'],
          chargers: (chargerPoint['chargerPoint'] as ChargerPoint)
              .chargers
              .where((charger) => charger.status == "Available")
              .length,
        );
      }).toList(),
    );
  }
}


/*
class Charger {
  String id = '';
  ChargerStatus status = ChargerStatus.available;
  LatLng location = LatLng(0, 0);

  Charger(this.id, this.status, this.location);
}

 List<Charger> chargers = [
      Charger('5412345', ChargerStatus.booked, LatLng(0023, 1230)),
      Charger('1234543', ChargerStatus.occupied, LatLng(123, 1230)),
      Charger('1225453', ChargerStatus.available, LatLng(5463, 1230)),
      Charger('1234543', ChargerStatus.available, LatLng(2433, 1230)),
      Charger('1654654', ChargerStatus.available, LatLng(2343, 1230)),
    ];
    */