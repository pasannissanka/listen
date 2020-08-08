import 'package:flutter/material.dart';

class ListWidgetHorizontal extends StatelessWidget {
  const ListWidgetHorizontal(
      {Key key, this.thumbnail, @required this.title, @required this.id, @required this.authorName})
      : super(key: key);

  final Widget thumbnail;
  final String title;
  final int id;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      // margin: EdgeInsets.all(1),
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.');
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 7, bottom: 5, left: 10, right: 10),
                width: 130,
                height: 130,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: thumbnail != null
                      ? thumbnail
                      : Image.network(
                          'https://www.koganpage.com/images/book-placeholder.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Letters of Two Brides',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 3),
                child: Text(
                  'by Honoré de Balzac',
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
