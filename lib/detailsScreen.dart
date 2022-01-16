import 'package:flutter/material.dart';
import './learn.dart';

class DetailPage extends StatelessWidget {
  final Recommended recommend;
  const DetailPage({Key? key, required this.recommend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: recommend.entries.map((val) {
            return Row(
              children: [Text('${val.key}: '), Text(val.value)],
            );
          }).toList(),
        ),
      ),
    );
  }
}
