import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../photo/provider/photo_provider.dart';
import '../../photo/view/photo_screen.dart';
import '../../video/view/video_screen.dart';

class BottombarScreen extends StatefulWidget {
  const BottombarScreen({Key? key}) : super(key: key);

  @override
  State<BottombarScreen> createState() => _BottombarScreenState();
}

class _BottombarScreenState extends State<BottombarScreen> {
  PhotoProvider? photoProvidertrue;
  PhotoProvider? photoProviderfalse;
  List screen = [
    PhotoScreen(),
    VideoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    photoProvidertrue = Provider.of<PhotoProvider>(context, listen: true);
    photoProviderfalse = Provider.of<PhotoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: screen[photoProvidertrue!.bari],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: photoProvidertrue!.bari,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          iconSize: 30,
          onTap: (value) {
            photoProviderfalse!.barIndex(value);
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.photo,
              ),
              label: "Photos",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.video_collection,
              ),
              label: "Videos",
            ),
          ],
        ),
      ),
    );
  }
}
