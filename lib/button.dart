import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      required this.value,
      required this.isSelected,
      required this.onClick})
      : super(key: key);
  final String value;
  final bool isSelected;
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isSelected ? Colors.black : Colors.white),
          child: Text(
            value,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
