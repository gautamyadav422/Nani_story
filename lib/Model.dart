class StoryApi {
  String? id;
  String? post_title;
  String? post_desc;
  String? url;
  String? post_image;

  StoryApi({this.id, this.post_title, this.post_desc, this.url, this.post_image});

  StoryApi.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.post_title = json["post_title"];
    this.post_desc = json["post_desc"];
    this.url = json["url"];
    this.post_image = json["post_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["post_title"] = this.post_title;
    data["post_desc"] = this.post_desc;
    data["url"] = this.url;
    data["post_image"] = this.post_image;
    return data;
  }
}