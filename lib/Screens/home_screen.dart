import 'package:facebook_ui/Widget/widgets.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CirleBotton(
                icon: Icons.search,
                onPressed: () => print("search"),
                iconSize: 28,
              ),
              CirleBotton(
                icon: MdiIcons.facebookMessenger,
                onPressed: () => print("messenger"),
                iconSize: 28,
              )
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
            child: CreatePostContainer(currentUser: currentUser),
          )),
          SliverToBoxAdapter(child: Rooms(onLineUsers: onlineUsers)),
          SliverToBoxAdapter(
              child: Stories(
            currentUser: currentUser,
            stories: stories,
          )),
        ],
      ),
    );
  }
}
