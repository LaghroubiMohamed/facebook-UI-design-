import 'package:facebook_ui/Widget/profile_avatar.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  const Rooms({Key key, this.onLineUsers}) : super(key: key);
  final List<User> onLineUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 8.0),
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onLineUsers.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: _RoomBotton(),
            );
          }
          final User user = onLineUsers[index - 1];
          return GestureDetector(
            onTap: () => print(user.name),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _RoomBotton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      borderSide: BorderSide(width: 3.0, color: Colors.blueAccent[100]),
      onPressed: () => print("Creat Room"),
      textColor: Palette.facebookBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (bounds) =>
                Palette.createRoomGradient.createShader(bounds),
            child: Icon(
              Icons.video_call,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'Creat\nRoom',
          )
        ],
      ),
    );
  }
}
