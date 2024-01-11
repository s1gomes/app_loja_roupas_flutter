import 'package:flutter/material.dart';

class ContadorItemsCarrinho extends StatelessWidget {
  const ContadorItemsCarrinho(
      {super.key, required this.child, required this.value, this.color});
  final Widget child;
  final String value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color ?? Theme.of(context).cardColor),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13),
              ),
            ))
      ],
    );
  }
}
