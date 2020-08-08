import 'package:Listen/ui/shared/list/list_widget_verti.dart';
import 'package:flutter/material.dart';

class ExplorePageView extends StatefulWidget {
  ExplorePageView({Key key}) : super(key: key);

  @override
  _ExplorePageViewState createState() => _ExplorePageViewState();
}

class _ExplorePageViewState extends State<ExplorePageView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: true,
                backgroundColor: Colors.white,
                pinned: true,
                // titleSpacing: 0.0,
                elevation: 2,
                forceElevated: true,
                title: Container(
                  margin: EdgeInsets.all(2),
                  // decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(8),
                  //     border: Border.all(color: Colors.black, width: 0.1)),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.black),
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search",
                        // border: InputBorder.none,
                        border: OutlineInputBorder()),
                  ),
                ),
                bottom: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: "Call"),
                    Tab(text: "Message"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              Container(
                child: ListView(
                  children: List.generate(
                    10,
                    (index) => Text('test'),
                  ),
                ),
              ),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
  }
}
