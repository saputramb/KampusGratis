import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kampus_gratis/constants.dart';
import 'package:kampus_gratis/database/db.dart';
import 'package:kampus_gratis/model/videoModel.dart';
import 'package:kampus_gratis/screens/bookmark/bvideo.dart';
import 'package:kampus_gratis/screens/pemutarVideo/youtube_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final VideoModel selectedModel;
  final List<VideoModel> videos;
  const VideoPage({Key? key, required this.selectedModel, required this.videos})
      : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _ytbPlayerController;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    _videoMetaData = const YoutubeMetaData();
    _ytbPlayerController = YoutubePlayerController(
      initialVideoId: widget.selectedModel.link,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: true,
        loop: false,
        isLive: true,
        hideControls: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    _idController = TextEditingController();
    _seekToController = TextEditingController();
    _playerState = PlayerState.unknown;
  }

  void listener() {
    if (mounted && !_ytbPlayerController.value.isFullScreen) {
      setState(() {
        _playerState = _ytbPlayerController.value.playerState;
        _videoMetaData = _ytbPlayerController.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _ytbPlayerController.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _ytbPlayerController.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(_videoMetaData.title),
        //   backgroundColor: AppColor.fixsecondarycolor,
        // ),
        body: SafeArea(
      child: Column(
        children: [
          _buildYtbView(),
          _buildMenu(),
          _buildMoreVideosView(),
        ],
      ),
    ));
  }

  _buildYtbView() {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _ytbPlayerController,
          showVideoProgressIndicator: true,
          progressColors: ProgressBarColors(playedColor: Colors.amber),
          onReady: () {
            print("ready");
          },
        ),
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
              player,
              //some other widgets
            ],
          );
        });
  }

  _buildMenu() {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(width: 8.0),
                        Flexible(
                          child: Text(
                            _videoMetaData.title,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FavoriteButton(
                  video: widget.selectedModel,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Icon(Icons.access_time),
                    SizedBox(width: 8.0),
                    Text(_videoMetaData.duration.inMinutes.toString() +
                        ' Menit'),
                  ],
                ),
                FullScreenButton(
                  controller: _ytbPlayerController,
                  color: Colors.blueAccent,
                )
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: AnimatedContainer(
                    width: MediaQuery.of(context).size.width,
                    duration: const Duration(milliseconds: 800),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: _getStateColor(_playerState),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _playerState.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Color _getStateColor(PlayerState state) {
    switch (state) {
      case PlayerState.unknown:
        return Colors.grey[700]!;
      case PlayerState.unStarted:
        return Colors.pink;
      case PlayerState.ended:
        return Colors.red;
      case PlayerState.playing:
        return Colors.blueAccent;
      case PlayerState.paused:
        return Colors.orange;
      case PlayerState.buffering:
        return Colors.yellow;
      case PlayerState.cued:
        return Colors.blue[900]!;
      default:
        return Colors.blue;
    }
  }

  _buildPanel() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          color: Colors.redAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Place holder judul",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "Place holder durasi",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildMoreVideosView() {
    return Flexible(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
            itemCount: widget.videos.length,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  final _newCode = widget.videos[index].link;
                  _ytbPlayerController.load(_newCode);
                  //_ytbPlayerController.setSize(size);
                },
                child: Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 7,
                    margin: EdgeInsets.symmetric(vertical: 7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 10,
                            offset: Offset(-1, -5),
                            color: Colors.blueAccent.withOpacity(0.3),
                          ),
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://img.youtube.com/vi/${widget.videos[index].link}/0.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.videos[index].judul,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: 'Monsterrat',
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.timer, size: 20),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(top: 3, left: 5),
                                          child: Text(
                                            "lama video",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.grey[500],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final VideoModel video;
  FavoriteButton({Key? key, required this.video}) : super(key: key);
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isBookmarked = false;
  addVideo(VideoModel video) async {
    DB().insertVideo(video as VideoModel).then((value) => print(value));
  }

  deleteVideo(int id) async {
    DB().deleteWhereIdVideo(id).then((value) => print(value));
  }

  cekVideo() async {
    //ngambil parameter id
    bool isExist = await DB().cekvideo(widget.video.id);
    isBookmarked = isExist;
    setState(() {});
  }

  @override
  void initState() {
    cekVideo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isBookmarked
            ? Icons.bookmark_add_rounded
            : Icons.bookmark_border_outlined,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isBookmarked = !isBookmarked;
        });
        if (isBookmarked) {
          addVideo(widget.video);
        } else {
          deleteVideo(widget.video.id);
        }
      },
    );
  }
}
