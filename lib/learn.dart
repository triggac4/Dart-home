import 'package:flutter/material.dart';
import 'package:testing/volcabulary_container.dart';
import 'button.dart';
import 'recommended_conponents.dart';

typedef Recommended = Map<String, String>;

class Learn extends StatefulWidget {
  final List<Recommended> recommendedComp;
  final Function(Recommended) pageChanger;
  const Learn(
      {Key? key, required this.recommendedComp, required this.pageChanger})
      : super(key: key);

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
                    var rec = widget.recommendedComp[i];
                    return RecommendedComponent(
                        activity: rec.keys.toList()[0],
                        icon: const Icon(Icons.local_activity),
                        isSelected: true,
                        onSelect: () => widget.pageChanger(rec),
                        time: rec.values.toList()[0]);
                  },
                  itemCount: widget.recommendedComp.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
