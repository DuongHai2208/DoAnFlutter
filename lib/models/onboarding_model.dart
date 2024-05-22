class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'MEDICINE APP',
    image: 'assets/images/news.jpg',
    discription: "Khám phá thế giới y tế và chăm sóc sức khỏe ngay trong tầm tay bạn."
    
  ),
  UnbordingContent(
    title: 'Mua Thuốc Dễ Dàng',
    image: 'assets/images/news.jpg',
    discription: "Tìm kiếm và mua thuốc chính hãng một cách nhanh chóng và tiện lợi."

  ),
  UnbordingContent(
    title: 'Tin Tức Y Tế',
    image: 'assets/images/news.jpg',
    discription: "Nhận những thông tin y tế mới nhất và quan trọng nhất mỗi ngày."

  ),
];