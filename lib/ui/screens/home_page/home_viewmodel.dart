import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flexicharge/app/app.locator.dart';
import 'package:flexicharge/enums/bottom_sheet_type.dart';
import 'package:flexicharge/models/charger.dart';
import 'package:flexicharge/services/chargers.dart';
import 'package:flexicharge/services/local_data.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:geocoding/geocoding.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _chagerAPI = locator<ChargerService>();
  final _localData = locator<LocalData>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  init() async {
    getUserLocation();
    findUser();
    getAddress();
    greenMarkerIcon = await _greenMarkerIcon;
    redMarkerIcon = await _redMarkerIcon;
    blackMarkerIcon = await _blackMarkerIcon;
    notifyListeners();
  }

  BitmapDescriptor greenMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor redMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor blackMarkerIcon = BitmapDescriptor.defaultMarker;
  String title = '';

  Completer<GoogleMapController> controller = Completer();
  GoogleMapController? userLocateController;

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(57.781921, 14.161227),
    zoom: 14.5,
  );

  void getUserLocation() =>
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((value) {
        cameraPosition = CameraPosition(
          target: LatLng(value.latitude, value.longitude),
          zoom: 16.5,
        );
        notifyListeners();
      });

  get _greenMarkerIcon => BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(25, 25)),
        'assets/images/greenMarker.png',
      );

  get _redMarkerIcon => BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(25, 25)),
        'assets/images/redMarker.png',
      );

  get _blackMarkerIcon => BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(25, 25)),
        'assets/images/blackMarker.png',
      );

  Future<void> openFindCharger() async {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.mapBottomSheet,
    );
  }

  Future<void> findUser() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((value) async {
      cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 17,
      );
      userLocateController
          ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      notifyListeners();
    });
  }

  Future<void> getAddress() async {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((value) async {
      await placemarkFromCoordinates(value.latitude, value.longitude);
      return placemarkFromCoordinates;
    });
    notifyListeners();
    print(placemarkFromCoordinates);
  }
}
