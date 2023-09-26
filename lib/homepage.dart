import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper_app/fullscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List images =[];
  int page =1;
  getApi() async {
    await http.get(Uri.parse( "https://api.pexels.com/v1/curated?per_page=80"),
        headers: {
          'Authorization':'2imlbyM9nP3QcRCav70SQrL1j9wXLzpQnRmfZH2fp2khHBAll9cSo4sX'
        }).then((value) {
            // print(value.body);
      Map result = jsonDecode(value.body);

        // if (kDebugMode) {
        //   print(result);
        // }
            setState(() {
                 images = result['photos'];
            });
      // if (kDebugMode) {
      //   print('IM : ${images.length}');
      // }

    });

  }
  loadMore()async
  {
            setState(() {
              page = page+1;

            });
            String url = 'https://api.pexels.com/v1/curated?per_page=80&page='+page.toString();
            await http.get(Uri.parse(url),
                headers: {
                  'Authorization':'2imlbyM9nP3QcRCav70SQrL1j9wXLzpQnRmfZH2fp2khHBAll9cSo4sX'
                }
            ).then((value) {
              Map res = jsonDecode(value.body);
              setState(() {
                images.addAll(res['photos']);
              });
            });
  }
  @override
  void initState() {
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
  // leading: const Icon(CupertinoIcons.back),
  title: const Text('Wallpaper',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 2.5),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>  FullScreenData(images[index]['src']['portrait'])));
                      },
                      child: Container(
                        color: Colors.white,
                        child: Image.network(images[index]['src']['portrait']),
                      ),
                    );
                  }),
            ),
          ),
          InkWell(
            onTap: (){
              loadMore();
            },
            child: Container(
              height: 60,
              color: Colors.black,
              width: double.infinity,
              // color: Colors.transparent.withOpacity(0.5),
              child: const Center(
                  child: Text(
                'Load More',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
