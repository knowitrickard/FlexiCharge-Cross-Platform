import 'package:flexicharge/services/chargers.dart';
import 'package:flexicharge/services/local_data.dart';
import 'package:flexicharge/services/transactions.dart';
import 'package:flexicharge/ui/screens/home_page/home_view.dart';
import 'package:flexicharge/ui/screens/qr_scanner/qr_scanner_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: QrScannerView)
  ],
  dependencies: [
    LazySingleton(classType: Transactions),
    LazySingleton(classType: ChargerService),
    LazySingleton(classType: LocalData),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: NavigationService),
  ],
)

/// obs: When updating this file run
/// [ $ flutter pub run build_runner build --delete-conflicting-outputs ]  in the terminal &&
///  and also when you change class signature
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
