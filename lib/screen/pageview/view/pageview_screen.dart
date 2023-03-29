import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../photo/provider/photo_provider.dart';

class PageviewScreen extends StatefulWidget {
  const PageviewScreen({Key? key}) : super(key: key);

  @override
  State<PageviewScreen> createState() => _PageviewScreenState();
}

class _PageviewScreenState extends State<PageviewScreen> {
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
        body: PageView.builder(
          itemCount: photoProviderfalse!.imageList.length,
          controller: PageController(
            initialPage: photoProvidertrue!.i,
          ),
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            photoProviderfalse!.changeIndex(value);
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                height: double.infinity,
                width: double.infinity,
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
    );
  }
}
