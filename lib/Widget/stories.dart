import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/Widget/widgets.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories,
  }) : super(key: key);

  final User currentUser;
  final List<Story> stories;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: _StoryCard(currentUser: currentUser, isAddStory: true),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: _StoryCard(story: story),
          );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard(
      {Key key, this.currentUser, this.isAddStory = false, this.story})
      : super(key: key);

  final User currentUser;
  final bool isAddStory;
  final Story story;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CachedNetworkImage(
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: Palette.storyGradient,
          ),
        ),
        Positioned(
          left: 8.0,
          top: 8.0,
          child: isAddStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(
                        Icons.add,
                        color: Palette.facebookBlue,
                        size: 30,
                      ),
                      onPressed: () => print('Add Story')),
                )
              : ProfileAvatar(
                  hasBorder: !story.isViewed,
                  imageUrl: story.user.imageUrl,
                ),
        ),
        Positioned(
          bottom: 10.0,
          left: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add To Story' : story.user.name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
