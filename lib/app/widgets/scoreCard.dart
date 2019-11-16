import 'package:flutter/material.dart';
import 'package:flutter_tags/tag.dart';

class ScoreCard extends StatelessWidget {
  final List<String> _groups = [
    "Aggregrate",
    "NativeDev",
    "WebDev",
    "CoreCS",
    "BlockChain",
    "Cloud\/DevOps",
    "CyberSec",
    "IoT\/Robotics",
    "ML\/DS",
  ];

  final List<int> _scores = [150, 30, 50, 70, 40, 10, 60, 20, 0];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Score Card",
              style: TextStyle(fontSize: 25, letterSpacing: 2),
            ),
          ),
        ),
        Divider(
          endIndent: 40,
          indent: 40,
          color: Colors.black,
        ),
        Tags(
          columns: 3,
          itemCount: _groups.length,
          spacing: 24,
          runSpacing: 20,
          itemBuilder: (int index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: ItemTags(
                activeColor: Color(0xff424b54),
                textStyle: TextStyle(fontSize: 15),
                key: Key(index.toString()),
                index: index,
                title: _groups[index] + ': ${_scores[index].toString()}',
                active: true,
                color: Colors.indigo,
                textColor: Colors.white,
                elevation: 3,
                pressEnabled: false,
                onPressed: null,
                onLongPressed: null,
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "\*The scores are calculated based on the activeness in the group, participation and contribution in the group",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
            ),
          ),
        )
      ],
    );
  }
}
