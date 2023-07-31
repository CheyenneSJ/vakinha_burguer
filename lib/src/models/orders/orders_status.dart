import 'dart:ui';

import 'package:flutter/material.dart';

enum OrderStatus {
  pendente('Pendente', 'P', Colors.blue),
  confirmado('confirmado', 'C', Colors.green),
  finalizado('finalizado', 'D', Colors.black),
  cancelado('cancelado', 'R', Colors.red),
  ;

  final String name;
  final String acronym;
  final Color color;

  const OrderStatus(this.name, this.acronym, this.color);
  static OrderStatus parse(String acronym) {
    return values.firstWhere((s) => s.acronym == acronym);
  }
}
