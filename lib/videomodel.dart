class VideoApi {
  String? id;
  String? image;
  String? title;
  String? url;
  String? thumbImage;

  VideoApi({this.id, this.image, this.title, this.url, this.thumbImage});

  VideoApi.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.image = json["image"];
    this.title = json["title"];
    this.url = json["url"];
    this.thumbImage = json["thumb_image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = this.id;
    data["image"] = this.image;
    data["title"] = this.title;
    data["url"] = this.url;
    data["thumb_image"] = this.thumbImage;
    return data;
  }
}