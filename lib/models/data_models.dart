class HashtagModels {
  String title;
  HashtagModels({required this.title});
}

class BlogModel {
  int id;
  String imageUrl;
  String title;
  String writer;
  String writerImgUrl;
  String date;
  String content;
  String views;

  BlogModel({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.writer,
    required this.writerImgUrl,
    required this.date,
    required this.content,
    required this.views,
  });
}

class BlogPadcastModel {
  int id;
  String title;
  String description;
  String imgPadcast;
  String speaker;
  String imgSpeaker;
  String view;
  String date;

  BlogPadcastModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imgPadcast,
    required this.speaker,
    required this.imgSpeaker,
    required this.view,
    required this.date
  });

}