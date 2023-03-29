import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer_provider/screen/video/modal/video_modal.dart';

class VideoProvider extends ChangeNotifier {
  List imageList = [
    "assets/images/1.png",
    "assets/images/2.png",
    "assets/images/3.png",
    "assets/images/4.png",
    "assets/images/5.png",
    "assets/images/6.png",
    "assets/images/7.png",
    "assets/images/8.png",
  ];
  List nameList = [
    "CSK",
    "GT",
    "MI",
    "RCB",
    "DC",
    "KKR",
    "SRH",
    "LSG",
  ];
  List timeList = [
    "01:37",
    "01:57",
    "01:30",
    "01:46",
    "01:33",
    "01:44",
    "01:48",
    "01:27",
  ];
  List<VideoModal> videoList = [
    VideoModal(video: "assets/videos/1.mp4"),
    VideoModal(video: "assets/videos/2.mp4"),
    VideoModal(video: "assets/videos/3.mp4"),
    VideoModal(video: "assets/videos/4.mp4"),
  ];
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  VideoModal? videoModal;

  void initVideo() {
    videoPlayerController = VideoPlayerController.asset("${videoModal!.video}");
    videoPlayerController!.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: false,
      looping: false,
      allowMuting: true,
      allowFullScreen: true,
      aspectRatio: 16 / 9,
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.black12,
        bufferedColor: Colors.black26,
        handleColor: Colors.black,
        playedColor: Colors.black,
      ),
    );
  }

  Future<void> stopVideo() async {
    await videoPlayerController!.pause();
  }
}
