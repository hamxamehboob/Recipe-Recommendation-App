import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

Future<void> showInternetConnectionDialog(BuildContext context) async {
  bool isDeviceConnected = await InternetConnectionChecker().hasConnection;
  if (!isDeviceConnected) {
    // ignore: use_build_context_synchronously
    return showDialogBox(context);
  }
}

void showDialogBox(BuildContext context) {
  showCupertinoDialog<String>(
    context: context,
    builder: (BuildContext context) => CupertinoAlertDialog(
      title: const Text('No Internet Connection'),
      content: const Text('Please Check Your Internet Connection'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            bool isDeviceConnected =
                await InternetConnectionChecker().hasConnection;
            if (!isDeviceConnected) {
              // ignore: use_build_context_synchronously
              showDialogBox(context);
            }
          },
          child: const Text('OK'),
        )
      ],
    ),
  );
}
