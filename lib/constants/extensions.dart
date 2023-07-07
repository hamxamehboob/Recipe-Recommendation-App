import 'package:flutter/material.dart';

extension Capitialize on String {
  String capitilize() {
    return this[0].toUpperCase() + substring(1);
  }
}

// extension OnContext on BuildContext {
//   Size get sizeOf => MediaQuery.sizeOf(this);
// }
