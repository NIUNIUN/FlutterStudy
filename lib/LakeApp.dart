import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(getViewed());
}

Widget getViewed() {
  return MaterialApp(
    title: 'Flutter layout demo',
    home: Scaffold(
      appBar: AppBar(title: const Text('Flutter layout demo')),
      body: ListView(
        children: [
          Image.asset(
            'images/lake.jpg',
            width: 600,
            height: 240,
            fit: BoxFit.cover,
          ),
          titleSection(),
          buttonSection(),
          textSection()
        ],
      ),
    ),
  );
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({Key? key}) : super(key: key);

  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  int _favoriteCount = 41;
  bool _isFavorited = true;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
        _favoriteCount -= 1;
      } else {
        _isFavorited = true;
        _favoriteCount += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          padding: EdgeInsets.all(1),
          onPressed: _toggleFavorite,
          alignment: Alignment.centerRight,
          icon: Icon(_isFavorited ? Icons.star : Icons.star_border),
          color: Colors.red,
        ),
        SizedBox(
          width: 18,
          child: Text("$_favoriteCount"),
        )
      ],
    );
  }
}

Widget titleSection() => Container(
      padding: EdgeInsets.all(10),
      color: Colors.amberAccent,
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Oeschinen Lake Campground',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Kandersteg, Switzerland',
                      style: TextStyle(color: Colors.black26))
                ],
              ),
            ),
          ),
          // Icon(Icons.star, color: Colors.red),
          // Text('42')
          FavoriteWidget()
        ],
      ),
    );

Widget _buildColumn(Color color, String title, IconData icon) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: color),
        ),
      ),
    ],
  );
}

Widget buttonSection() => Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildColumn(Colors.lightBlueAccent, "CALL", Icons.call),
          _buildColumn(Colors.lightBlueAccent, "ROUTE", Icons.near_me),
          _buildColumn(Colors.lightBlueAccent, "SHARE", Icons.share),
        ],
      ),
    );

Widget textSection() => Padding(
    padding: EdgeInsets.all(10),
    child: Text(
      'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
      'Alps. Situated 1,578 meters above sea level, it is one of the '
      'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
      'half-hour walk through pastures and pine forest, leads you to the '
      'lake, which warms to 20 degrees Celsius in the summer. Activities '
      'enjoyed here include rowing, and riding the summer toboggan run.',
      softWrap: true, // 文本将在填充满列宽后在单词边界出自动换行。
    ));
