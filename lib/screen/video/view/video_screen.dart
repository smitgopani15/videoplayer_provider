import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/video_provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? videoProvidertrue;
  VideoProvider? videoProviderfalse;

  @override
  Widget build(BuildContext context) {
    videoProvidertrue = Provider.of<VideoProvider>(context, listen: true);
    videoProviderfalse = Provider.of<VideoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Videos",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          actions: [
            Row(
              children: [
                Container(
                  height: 22,
                  width: 52,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Select",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 22,
                  width: 22,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  alignment: Alignment.center,
                  child: Center(
                    child: Icon(
                      Icons.menu_outlined,
                      size: 11,
                    ),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: videoProviderfalse!.imageList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: 10,
                top: 5,
                bottom: 5,
              ),
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.black12,
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15,
                      ),
                      child: Container(
                        height: double.infinity,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12,
                        ),
                        child: Image.asset(
                          videoProviderfalse!.imageList[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${videoProviderfalse!.nameList[index]}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${videoProviderfalse!.timeList[index]}",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        videoProviderfalse!.videoModal =
                            videoProvidertrue!.videoList[index];
                        Navigator.pushNamed(context, 'videoview_screen');
                      },
                      icon: Icon(
                        Icons.play_circle,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
