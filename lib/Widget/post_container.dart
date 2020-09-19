import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/Widget/profile_avatar.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({Key key, @required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post: post),
                const SizedBox(height: 8.0),
                Text(post.caption),
                post.imageUrl != null
                    ? Container()
                    : Container(
                        height: 8,
                      )
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post: post),
          )
        ],
      ),
    );
  }
}

class _PostStats extends StatelessWidget {
  const _PostStats({Key key, this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                MdiIcons.thumbUp,
                color: Colors.white,
                size: 10,
              ),
            ),
            SizedBox(width: 4),
            Expanded(
              child: Text(
                '${post.likes} ',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} Comments',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(width: 8),
            Text(
              '${post.shares} Shares',
              style: TextStyle(color: Colors.grey[600]),
            ),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _PostLikeBotton(),
            _PostBotton(
              icon: Icon(
                MdiIcons.commentOutline,
                color: Colors.grey[600],
                size: 20,
              ),
              label: 'Comments',
              onTap: () => print('Comment'),
            ),
            _PostBotton(
              icon: Icon(
                MdiIcons.shareOutline,
                color: Colors.grey[600],
                size: 24,
              ),
              label: 'shares',
              onTap: () => print('shares'),
            ),
          ],
        )
      ],
    );
  }
}

class _PostBotton extends StatelessWidget {
  const _PostBotton({
    Key key,
    @required this.label,
    @required this.onTap,
    @required this.icon,
  }) : super(key: key);
  final Icon icon;
  final String label;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: 4),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              )
            ],
          ),
        ));
  }
}

class _PostLikeBotton extends StatefulWidget {
  _PostLikeBotton({Key key}) : super(key: key);

  @override
  __PostLikeBottonState createState() => __PostLikeBottonState();
}

class __PostLikeBottonState extends State<_PostLikeBotton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isClicked = !isClicked;
          print('Like');
        });
      },
      child: Container(
        height: 25,
        child: Row(
          children: [
            Icon(
              isClicked ? MdiIcons.thumbUp : MdiIcons.thumbUpOutline,
              color: isClicked ? Palette.facebookBlue : Colors.grey[600],
              size: 20,
            ),
            SizedBox(width: 4),
            Text(
              'Like',
              style: TextStyle(
                color: isClicked ? Palette.facebookBlue : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  const _PostHeader({Key key, this.post}) : super(key: key);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: post.user.imageUrl,
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${post.timeAgo} • ',
                    style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 14.0,
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(Icons.more_horiz),
          onPressed: () => print('more'),
        )
      ],
    );
  }
}
