import 'package:facebook_ui/Widget/profile_avatar.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:flutter/material.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({Key key, this.currentUser}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      child: Column(
        children: [
          Row(children: [
            ProfileAvatar(imageUrl: currentUser.imageUrl),
            const SizedBox(width: 8.0),
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: 'What\'s in Your Mind?',
                ),
              ),
            ),
          ]),
          const Divider(height: 10, thickness: 0.5),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () => print('Live'),
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text('Live'),
                ),
                VerticalDivider(
                  width: 8.0,
                  endIndent: 5.5,
                ),
                FlatButton.icon(
                  onPressed: () => print('Camera'),
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text('Camera'),
                ),
                VerticalDivider(
                  width: 8.0,
                  endIndent: 5.5,
                ),
                FlatButton.icon(
                  onPressed: () => print('Room'),
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: Text('Room'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
