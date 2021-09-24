import 'dart:convert';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/Model.dart';
import 'package:untitled/storyshowpage.dart';
import 'package:untitled/videoPage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<StoryApi> storyPage = [];
  loadApi() async {
    var response = await http.get(
      Uri.parse(
          "http://mapi.trycatchtech.com/v1/kids_stories/kids_stories_list"),
    );

    var respArr = json.decode(response.body);

    setState(() {
      for (var item in respArr) {
        storyPage.add(
          StoryApi.fromJson(item),
        );
      }
    });
    print("Lenth is -------${storyPage.length}");
  }

  var colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];
  var colorizeTextStyle = TextStyle(
      fontSize: 50.0, fontFamily: 'Schyler', fontWeight: FontWeight.bold);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadApi();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: SizedBox(
              width: 300.0,
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    'Nani Ki Story',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
                repeatForever: true,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                  child: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(
                          icon: Icon(Icons.book),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.video_call,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // create widgets for each tab bar here
                Expanded(
                  child: TabBarView(
                    children: [
                      // first tab bar view widget
                      GridView.builder(
                        itemCount: storyPage.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200),
                        itemBuilder: (ctx, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => ShowStoryPage(
                                          storyPage: storyPage,
                                          selectedStory: storyPage[index],
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
                                      "https://cevo.com.au/wp-content/uploads/2020/07/tell-me-a-story.jpg",
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("${storyPage[index].post_title}"),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      // second tab bar viiew widget
                      VideoPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
