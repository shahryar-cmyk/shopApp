import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

import '../providers/orders.dart' as ord;

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  const OrderItem({this.order});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
              ),
              trailing: IconButton(
                  icon: Icon(expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  }),
            ),
            if (expanded)
              Container(
                  height: min(widget.order.products.length * 20.0 + 10, 180),
                  child: ListView(
                    children: widget.order.products
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${e.title}',
                                  style: TextStyle(
                                      // color: Colors.grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${e.quantity} x \$${e.price}',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                              ],
                            ))
                        .toList(),
                  ))
          ],
        ));
  }
}
