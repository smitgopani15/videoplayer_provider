import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer_provider/screen/bottombar/view/bottombar_screen.dart';
import 'package:videoplayer_provider/screen/pageview/view/pageview_screen.dart';
import 'package:videoplayer_provider/screen/photo/provider/photo_provider.dart';
import 'package:videoplayer_provider/screen/photo/view/photo_screen.dart';
import 'package:videoplayer_provider/screen/video/provider/video_provider.dart';
import 'package:videoplayer_provider/screen/video/view/video_screen.dart';
import 'package:videoplayer_provider/screen/videoview/view/videoview_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PhotoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => BottombarScreen(),
          'photo_screen': (context) => PhotoScreen(),
          'pageview_screen': (context) => PageviewScreen(),
          'video_screen': (context) => VideoScreen(),
          'videoview_screen': (context) => VideoviewScreen(),
        },
      ),
    ),
  );
}
