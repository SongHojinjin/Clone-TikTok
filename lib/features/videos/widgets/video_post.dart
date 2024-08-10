import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:tiktok_clone/features/videos/widgets/videos_comment.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});
  final Function onVideoFinished;
  final int index;

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  final VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset('assets/videos/gapyeong.mp4');
  late final AnimationController _animationController;
  bool _isPaused = false;
  final _animationDuration = const Duration(milliseconds: 200);

  void _initVideoPlayer() async {
    await _videoPlayerController.initialize();
    await _videoPlayerController.setLooping(true);
    setState(() {});
    _videoPlayerController.addListener(_onVideoChange);
  }

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
    // _animationController.addListener(() {
    //   setState(() {});
    // },);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 &&
        !_isPaused &&
        !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
    if (_videoPlayerController.value.isPlaying && info.visibleFraction == 0) {
      _onToggleTap();
    }
  }

  void _onToggleTap() {
    if (!_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
      _animationController.reverse();
    } else {
      _videoPlayerController.pause();
      _animationController.forward();
    }
    setState(() {
      _isPaused = !_isPaused;
    });
  }

  void _onCommentTap(BuildContext context) async {
    if (_videoPlayerController.value.isPlaying) {
      _onToggleTap();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => VideosComment(),
    );
    _onToggleTap();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.index}'),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Container(
                      color: Colors.black,
                    )),
          Positioned.fill(
              child: GestureDetector(
            onTap: _onToggleTap,
          )),
          Positioned.fill(
              child: IgnorePointer(
            child: Center(
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animationController.value,
                    child: child,
                  );
                },
                child: AnimatedOpacity(
                  duration: _animationDuration,
                  opacity: _isPaused ? 1 : 0,
                  child: const FaIcon(
                    FontAwesomeIcons.play,
                    color: Colors.white,
                    size: Sizes.size52,
                  ),
                ),
              ),
            ),
          )),
          const Positioned(
              bottom: 60,
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '@username',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w400),
                  ),
                  Gaps.v20,
                  Text(
                    'firefirefire. this is fire.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: Sizes.size16,
                    ),
                  ),
                  Gaps.v6,
                ],
              )),
          Positioned(
              bottom: 50,
              right: 10,
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue,
                    child: Text('^_^'),
                    foregroundImage: NetworkImage(
                        'https://avatars.githubusercontent.com/u/74577721?v=4'),
                  ),
                  Gaps.v28,
                  const VideoButton(
                    icon: FontAwesomeIcons.solidHeart,
                    label: '2.5M',
                  ),
                  Gaps.v20,
                  GestureDetector(
                      onTap: () => _onCommentTap(context),
                      child: const VideoButton(
                        icon: FontAwesomeIcons.solidComment,
                        label: '33.0K',
                      )),
                  Gaps.v20,
                  const VideoButton(
                    icon: FontAwesomeIcons.share,
                    label: 'Share',
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
