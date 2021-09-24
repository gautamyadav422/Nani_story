import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/videomodel.dart';
import 'package:untitled/webVideo.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  List<VideoApi> storyVideo = [];
  loadVideoApi() async {
    var responsevideo = await http.get(
      Uri.parse("http://mapi.trycatchtech.com/v1/kids_stories/videos_list"),
    );
    var resVideo = json.decode(responsevideo.body);
    setState(() {});
    for (var item in resVideo) {
      storyVideo.add(
        VideoApi.fromJson(item),
      );
      print("Hello all'''${storyVideo[0].title}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadVideoApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: storyVideo.length,
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
        itemBuilder: (ctx, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => VideoWeb(
                      storyVideo: storyVideo,
                      selectedURL: storyVideo[index],
                    )));
          },
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Card(
              elevation: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Image.network(
                      "${storyVideo[index].image}",
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${storyVideo[index].title}"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
