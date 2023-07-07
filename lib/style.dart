

import 'package:flutter/material.dart';

InputDecoration myInputDecoretion(label){
  return InputDecoration(
    labelText: label,
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purple, width:1),
    ),
  );
}