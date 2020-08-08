import 'package:Listen/ui/activity/activity_page_view.dart';
import 'package:Listen/ui/explore/explore_page_view.dart';
import 'package:Listen/ui/home/home_page_view.dart';
import 'package:flutter/material.dart';

class TabNavigationItem {

  final Widget page;
  final Widget title;
  final Widget icon;

  TabNavigationItem({
    @required this.page,
    @required this.title,
    @required this.icon});

  static List<TabNavigationItem> get items => [
    TabNavigationItem(
      page: HomePageView(),
      icon: Icon(Icons.home),
      title: Text('Home')
      ),
    TabNavigationItem(
      page: ExplorePageView(),
      icon: Icon(Icons.search),
      title: Text('Explore')
      ),
    TabNavigationItem(
      page: ActivityPageView(),
      icon: Icon(Icons.library_books),
      title: Text('Activity')
      ),
  ];
}