import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InternetConnectionDialog extends StatelessWidget {
  final VoidCallback onRetryPressed;

  const InternetConnectionDialog({Key? key, required this.onRetryPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('No Internet Connection'),
      content: const Text('Please Check Your Internet Connection'),
      actions: <Widget>[
        TextButton(
          onPressed: onRetryPressed,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
