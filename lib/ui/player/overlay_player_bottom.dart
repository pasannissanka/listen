import 'package:flutter/material.dart';

class OverlayPlayerBottom extends StatelessWidget {
  const OverlayPlayerBottom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 1.0), //(x,y)
          blurRadius: 2.5,
        )
      ]),
      child: Container(
        width: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: 50,
              width: 50,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Image.network(
                    'https://ia802809.us.archive.org/12/items/LibrivoxCdCoverArt12/Letters_Two_Brides_1110.jpg'),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - (150),
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Letters of Two Brides', style: TextStyle(fontSize: 16),),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text('by Honoré de Balzac', style: TextStyle(fontSize: 13),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Chapter 21/', style: TextStyle(fontSize: 12, color: Colors.black54),),
                        Text('57', style: TextStyle(fontSize: 10, color: Colors.black45),),
                      ],
                    )
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              margin: EdgeInsets.all(5),
              child: IconButton(
                icon: Icon(Icons.play_arrow, size: 32,),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
