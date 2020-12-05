class HotelListData {
  HotelListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.subTxt = "",
    this.dist = 1.8,
    this.reviews = 80,
    this.rating = 4.5,
    this.participants = 180,
  });

  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  int reviews;
  int participants;

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
      imagePath: 'assets/hotel/office.jpg',
      titleTxt: 'Office Room',
      subTxt: 'Open space office',
      dist: 2.0,
      reviews: 80,
      rating: 4.4,
      participants: 180,
    ),
    HotelListData(
      imagePath: 'assets/hotel/conference.jpg',
      titleTxt: 'Conference Room',
      subTxt: 'Confernce Room #1',
      dist: 4.0,
      reviews: 74,
      rating: 4.5,
      participants: 200,
    ),
    HotelListData(
      imagePath: 'assets/hotel/game.jpg',
      titleTxt: 'Game Room',
      subTxt: 'Game Room #1',
      dist: 3.0,
      reviews: 62,
      rating: 4.0,
      participants: 60,
    ),
    HotelListData(
      imagePath: 'assets/hotel/kitchen.jpg',
      titleTxt: 'Coffee Room',
      subTxt: 'Coffee Room #1',
      dist: 7.0,
      reviews: 90,
      rating: 4.4,
      participants: 170,
    ),
  ];
}
