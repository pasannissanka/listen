import 'package:Listen/model/book_librivox_API.dart';
import 'package:Listen/model/librivox_book.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ListWidgetVerticle extends StatelessWidget {
  const ListWidgetVerticle({Key key, @required this.librivoxBook})
      : super(key: key);

  final BookLibrivoxAPI librivoxBook;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {
            print('Card tapped.'); // TODO:  Navigate to Book page
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                // onTap: () {}, // Navigate to Book page?
                leading: AspectRatio(
                    aspectRatio: 1.0,
                    child: CachedNetworkImage(
                      imageUrl:
                          'http://archive.org/download/secret_garden_librivox/Secret_Garden_1003.jpg',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                                  value: downloadProgress.progress),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )),
                title: Text('${librivoxBook.title}'),
                subtitle: Text(
                    'by ${librivoxBook.authors[0].firstName} ${librivoxBook.authors[0].lastName}\n${librivoxBook.numSections} Sections, ${librivoxBook.totaltime} Hrs'),
                isThreeLine: true,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
                child: Text('${librivoxBook.description.substring(0, 200)}...'),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: <Widget>[
                  FlatButton(
                    child: const Text('Listen'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('Read'),
                    onPressed: () {/* ... */},
                  ),
                  FlatButton(
                    child: const Text('Save'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
