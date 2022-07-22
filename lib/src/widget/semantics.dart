import 'package:flutter/material.dart';

Widget buildWidgetWithSemantics(String label, Widget child) {

  return Semantics(
    label: label,
    child: child,
  );
}