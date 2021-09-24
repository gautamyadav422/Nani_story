import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Model.dart';

class ShowStoryPage extends StatefulWidget {
  final List<StoryApi> storyPage;
  final StoryApi? selectedStory;
  const ShowStoryPage({Key? key, required this.storyPage, this.selectedStory})
      : super(key: key);

  @override
  _ShowStoryPageState createState() => _ShowStoryPageState();
}

class _ShowStoryPageState extends State<ShowStoryPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: (ctx, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Image.network("http://yourdost-blog-images.s3-ap-southeast-1.amazonaws.com/wp-content/uploads/2016/01/15175219/Dadimaa-1.png"),
                      SizedBox(height: 20,),
                      Text("${widget.selectedStory?.post_title}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                      Image.network("https://sarahchrzanowskiportfolio.files.wordpress.com/2013/12/gray-line-vector.png?w=300",height: 100,width: 300,),
                      SizedBox(height: 20,),
                      Text("${widget.selectedStory?.post_desc}",style: TextStyle(fontSize: 18,color: Colors.black54),),
                      Image.asset("assets/s12.png"),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
