import 'package:flutter/material.dart';

class RecommendedComponent extends StatelessWidget {
  const RecommendedComponent(
      {Key? key,
      required this.activity,
      required this.icon,
      required this.isSelected,
      required this.time})
      : super(key: key);
  final Icon icon;
  final String activity;
  final String time;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: icon,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(activity,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w900)),
                Text(time,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey))
              ],
            ),
            const Spacer(),
            Icon(
              Icons.beenhere_sharp,
              color: isSelected ? Colors.black : Colors.grey.shade700,
            )
          ],
        ),
      ),
    );
  }
}
