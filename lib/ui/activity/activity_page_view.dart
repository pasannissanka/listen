import 'package:flutter/material.dart';


class ActivityPageView extends StatefulWidget {
  ActivityPageView({Key key}) : super(key: key);

  @override
  _ActivityPageViewState createState() => _ActivityPageViewState();
}

class _ActivityPageViewState extends State<ActivityPageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('Activity')
    );
  }
}