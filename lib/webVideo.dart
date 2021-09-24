import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled/videomodel.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoWeb extends StatefulWidget {
  final List<VideoApi> storyVideo;
  final VideoApi? selectedURL;
  const VideoWeb({Key? key,required this.storyVideo,this.selectedURL}) : super(key: key);

  @override
  _VideoWebState createState() => _VideoWebState();
}

class _VideoWebState extends State<VideoWeb> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: WebView(
          initialUrl: "https://www.youtube.com/results?search_query=story",
          javascriptMode: JavascriptMode.unrestricted,
        )
      )
    );
  }
}
