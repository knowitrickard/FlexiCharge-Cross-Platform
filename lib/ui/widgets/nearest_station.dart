import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NearestStation extends StatelessWidget {
  const NearestStation({
    required this.location,
    required this.chargers,
    required this.onTap,
    required this.distance,
    Key? key,
  }) : super(key: key);

  final String location;
  final int chargers;
  final Function()? onTap;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                location,
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Color(0xffffffff),
                  fontSize: 17,
                ),
              ),
              Image.asset("assets/images/charger_icon.png",
                  width: 18, height: 16, fit: BoxFit.fill),
            ],
          ),
          Column(
            children: [
              Text(
                distance.toString(),
                style: TextStyle(
                  fontFamily: 'Lato',
                  color: Color(0xffffffff),
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
