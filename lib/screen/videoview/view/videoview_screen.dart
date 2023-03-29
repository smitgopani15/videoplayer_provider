import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../video/provider/video_provider.dart';

class VideoviewScreen extends StatefulWidget {
  const VideoviewScreen({Key? key}) : super(key: key);

  @override
  State<VideoviewScreen> createState() => _VideoviewScreenState();
}

class _VideoviewScreenState extends State<VideoviewScreen> {
  @override
  void initState() {
    Provider.of<VideoProvider>(context, listen: false).initVideo();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<VideoProvider>(context, listen: false).stopVideo();
    super.dispose();
  }

  @override
  void deactivate() {
    Provider.of<VideoProvider>(context, listen: false).stopVideo();
    super.deactivate();
  }

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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.black,
            ),
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
                    "Edit",
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
        body: Padding(
          padding: EdgeInsets.all(2),
          child: Center(
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black12,
              ),
              alignment: Alignment.center,
              child: Chewie(
                controller: videoProvidertrue!.chewieController!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
