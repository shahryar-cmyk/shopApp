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
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height:
          expanded ? min(widget.order.products.length * 20.0 + 200, 180) : 95,
      child: Card(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              ListTile(
                title: Text('\$${widget.order.amount}'),
                subtitle: Text(
                  DateFormat('dd/MM/yyyy hh:mm').format(widget.order.dateTime),
                ),
                trailing: IconButton(
                    icon:
                        Icon(expanded ? Icons.expand_less : Icons.expand_more),
                    onPressed: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    }),
              ),
              // if (expanded)
              AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: expanded
                    ? min(widget.order.products.length * 20.0 + 10, 200)
                    : 0,
                child: ListView(
                  children: widget.order.products
                      .map(
                        (e) => ListTile(
                          title: Text(
                            '${e.title}',
                            style: TextStyle(
                                // color: Colors.grey,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          trailing: Text(
                            '${e.quantity} x \$${e.price}',
                            style: TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                        ),
                      )
                      .toList(),
                ),
              )
            ],
          )),
    );
  }
}
