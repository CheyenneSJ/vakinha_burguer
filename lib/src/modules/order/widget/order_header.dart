import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import '../../../models/orders/orders_status.dart';
import '../order_controller.dart';

class OrderHeader extends StatefulWidget {
  final OrderController controller;

  const OrderHeader({super.key, required this.controller});

  @override
  State<OrderHeader> createState() => _OrderHeaderState();
}

class _OrderHeaderState extends State<OrderHeader> {
  OrderStatus? statusSeletecd;

  @override
  Widget build(BuildContext context) {
    return BaseHeader(
      title: 'Administrar pedidos',
      addButton: false,
      filterWidget: DropdownButton<OrderStatus?>(
        value: null,
        items: [
          const DropdownMenuItem(
            value: null,
            child: Text('Todos'),
          ),
          ...OrderStatus.values
              .map(
                (s) => DropdownMenuItem(
                  value: s,
                  child: Text(s.name),
                ),
              )
              .toList()
        ],
        onChanged: (value) {
          setState(() {
            widget.controller.changeStatusFilter(value);
            statusSeletecd = value;
          });
        },
      ),
    );
  }
}
