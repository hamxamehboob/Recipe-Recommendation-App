// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum ConnectivityStatus { notDetermined, isConnected, isDisonnected, connected }

// class ConnectivityStatusNotifier extends StateNotifier<ConnectivityStatus> {
//    ConnectivityStatus? lastResult;
//   ConnectivityStatus? newState;

//   ConnectivityStatusNotifier() : super(ConnectivityStatus.isConnected) {
//     if (state == ConnectivityStatus.isConnected) {
//       lastResult = ConnectivityStatus.isConnected;
//     } else {
//       lastResult = ConnectivityStatus.isDisonnected;
//     }
//     lastResult = ConnectivityStatus.NotDetermined;
//     Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
//       switch (result) {
//         case ConnectivityResult.mobile:
//         case ConnectivityResult.wifi:
//           newState = ConnectivityStatus.isConnected;
//           break;
//         case ConnectivityResult.none:
//           newState = ConnectivityStatus.isDisonnected;
//           break;
//       }
//       if (newState != lastResult) {
//         state = newState!;
//         lastResult = newState;
//       }
//     });
//   }

// }

// // final connectivityStatusProviders = StateNotifierProvider((ref) {
// //   return ConnectivityStatusNotifier();
// // });



// // class ConnectivityProvider extends ChangeNotifier {
// //   bool isDeviceConnected = false;

// //   Future<void> checkConnectivity() async {
// //     isDeviceConnected = await InternetConnectionChecker().hasConnection;
// //     notifyListeners();
// //   }

// //   late StreamSubscription<ConnectivityResult> _subscription;

// //   void startListening(BuildContext context) {
// //     _subscription = Connectivity().onConnectivityChanged.listen(
// //       (ConnectivityResult result) async {
// //         isDeviceConnected = await InternetConnectionChecker().hasConnection;
// //         notifyListeners();

// //         if (!isDeviceConnected) {
// //           // ignore: use_build_context_synchronously
// //           showInternetConnectionDialog(context);
// //         }
// //       },
// //     );
// //   }

// //   void stopListening() {
// //     _subscription.cancel();
// //   }
// // }
