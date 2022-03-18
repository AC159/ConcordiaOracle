
class SlideItem {

  late String url;
  late String title;
  late String description;

  SlideItem(String url, String title, String desc) {
    this.url = url;
    this.title = title;
    this.description = desc;
  }

  static List<SlideItem> getSlideItems() {
    return [
      SlideItem('assets/images/question-answer.jpg', 'Answers', 'Get answers to your questions'),
      SlideItem('assets/images/lightbulb.jpg', 'Help students', 'Help students by answering their questions'),
      SlideItem('assets/images/anonymous.jpg', 'Anonymous', 'Stay anonymous')
    ];
  }

}
