import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/photo_provider.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  PhotoProvider? photoProvidertrue;
  PhotoProvider? photoProviderfalse;

  @override
  Widget build(BuildContext context) {
    photoProvidertrue = Provider.of<PhotoProvider>(context, listen: true);
    photoProviderfalse = Provider.of<PhotoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Photos",
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
        body: Padding(
          padding: EdgeInsets.only(
            left: 2,
            right: 2,
          ),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: photoProviderfalse!.imageList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  photoProviderfalse!.selectIndex(index);
                  Navigator.pushNamed(
                    context,
                    'pageview_screen',
                    arguments: photoProvidertrue!.i,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.black12,
                  ),
                  child: Image.asset(
                    photoProviderfalse!.imageList[index],
                    fit: BoxFit.contain,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
