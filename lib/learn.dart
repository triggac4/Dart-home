import 'package:flutter/material.dart';
import 'package:testing/volcabulary_container.dart';
import 'button.dart';
import 'recommended_conponents.dart';

class Learn extends StatefulWidget {
  const Learn({Key? key}) : super(key: key);

  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  final List<String> categories = [
    'Brainstorm',
    'Books',
    'Videos',
    'romance',
    'extra stuffs',
    'fill gap '
  ];

  int selected = 0;

  final List<Map<String, String>> recommendedComp = [
    {'Chatting': '5 minutes'},
    {'Listen': '5 minutes'},
    {'Speak': '3 minutes'},
    {'Exercise': '30 minutes'},
    {'Eating': '10 minutes'},
    {'Video Games': '30 minutes'},
  ];

  List<int> recommendedSelected = [0];

  onCategorySelect(int index) {
    setState(() {
      selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Choose what',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
              const Text(
                'to learn today',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 25),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: categories.asMap().entries.map((e) {
                    return Button(
                        onClick: () {
                          onCategorySelect(e.key);
                        },
                        value: e.value,
                        isSelected: selected == e.key);
                  }).toList(),
                ),
              ),
              const SizedBox(height: 25),
              const VocabularyContainer(value: 'ada'),
              const SizedBox(height: 25),
              const Text(
                "Recommended",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 17),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, i) {
                    var rec = recommendedComp[i];
                    bool isSelected = recommendedSelected.contains(i);
                    return RecommendedComponent(
                        activity: rec.keys.toList()[0],
                        icon: const Icon(Icons.local_activity),
                        isSelected: isSelected,
                        time: rec.values.toList()[0]);
                  },
                  itemCount: recommendedComp.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
