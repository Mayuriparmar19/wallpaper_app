import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
class FullScreenData extends StatefulWidget {
   final String imageUrl;

   const FullScreenData(this.imageUrl, {super.key});



  @override
  State<FullScreenData> createState() => _FullScreenDataState();
}

class _FullScreenDataState extends State<FullScreenData> {


  Future <void>setLockWallpaper ()async
  {
              int location = WallpaperManager.LOCK_SCREEN;
              var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
              var res = await WallpaperManager.setWallpaperFromFile(file.path, location);
              // String res= (await WallpaperManager.setWallpaperFromFile(file.path, location)) as String;
  }
  Future <void>setHomeWallpaper ()async
  {
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
    var res = await WallpaperManager.setWallpaperFromFile(file.path, location);
    // String res= (await WallpaperManager.setWallpaperFromFile(file.path, location)) as String;
  }
  Future <void>setBothWallpaper ()async
  {
    int location = WallpaperManager.BOTH_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(widget.imageUrl);
    var res = await WallpaperManager.setWallpaperFromFile(file.path, location);
    // String res= (await WallpaperManager.setWallpaperFromFile(file.path, location)) as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(CupertinoIcons.back)),

      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(child: Container(
              color: Colors.transparent,

                child: Image.network(widget.imageUrl),
            )),
            Container(
              height: 60,
              color: Colors.black,
              width: double.infinity,
              // color: Colors.transparent.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){
                      Fluttertoast.showToast(

                          msg: "Lock Screen WallPaper is Set",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      setLockWallpaper();},
                    child: const Text(
                      'Lock Screen ',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Fluttertoast.showToast(

                          msg: "home Screen WallPaper is Set",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0,

                      );
                      setHomeWallpaper();
                    },

                    child: const Text(
                      'Home Screen ',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Fluttertoast.showToast(

                          msg: " On Both Screen WallPaper is Set",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      setBothWallpaper();
                    },
                    child: const Text(
                      'Set Both',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
