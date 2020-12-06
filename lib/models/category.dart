class Category {
  Category({
    this.title = '',
    this.imagePath = '',
    this.lessonCount = 0,
    this.money = 0,
    this.rating = 0.0,
  });

  String title;
  int lessonCount;
  int money;
  double rating;
  String imagePath;

  static List<Category> officeRooms = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace1.jpg',
      title: 'Room #1',
      lessonCount: 24,
      money: 25,
      rating: 4.3,

    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Room #2',
      lessonCount: 22,
      money: 18,
      rating: 4.6,
    ),
    Category(
      imagePath: 'assets/design_course/interFace1.png',
      title: 'Room #3',
      lessonCount: 14,
      money: 25,
      rating: 4.3,
    ),
    Category(
      imagePath: 'assets/design_course/interFace2.png',
      title: 'Room #4',
      lessonCount: 32,
      money: 18,
      rating: 4.6,
    ),
  ];

  static List<Category> conferenceRooms = <Category>[
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Room #1',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Room #2',
      lessonCount: 27,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Room #3',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Room #4',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/design_course/interFace3.png',
      title: 'Room #5',
      lessonCount: 22,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/design_course/interFace4.png',
      title: 'Room #6',
      lessonCount: 34,
      money: 208,
      rating: 4.9,
    ),
  ];


  static List<Category> gamesList = <Category>[
    Category(
      imagePath: 'assets/games/among.jpeg',
      title: 'Among Us',
      lessonCount: 4,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/games/tictactoe.jpg',
      title: 'Tic Tac Toe',
      lessonCount: 7,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/games/agar.png',
      title: 'Agar.io',
      lessonCount: 8,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/games/chess.jpg',
      title: 'Chess',
      lessonCount: 28,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/games/pubg.jpg',
      title: 'PUBG',
      lessonCount: 16,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/games/tank.jpg',
      title: 'Tank Stars',
      lessonCount: 13,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/games/hole.png',
      title: 'Hole.io',
      lessonCount: 14,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/games/callof.jpg',
      title: 'Call of Duty',
      lessonCount: 12,
      money: 25,
      rating: 4.8,
    ),
  ];

  static List<Category> coffeeRooms = <Category>[
    Category(
      imagePath: 'assets/games/gaming.jpg',
      title: 'Gaming',
      lessonCount: 22,
      money: 25,
      rating: 4.8,
    ),
    Category(
      imagePath: 'assets/games/movie.jpg',
      title: 'Movies',
      lessonCount: 12,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/games/music.jpg',
      title: 'Music',
      lessonCount: 14,
      money: 208,
      rating: 4.9,
    ),
    Category(
      imagePath: 'assets/games/gossip.jpg',
      title: 'Gossip',
      lessonCount: 18,
      money: 208,
      rating: 4.9,
    ),
  ];
}
