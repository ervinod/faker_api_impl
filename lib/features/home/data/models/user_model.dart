class User {
  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.image,
  });

  int id;
  String firstname;
  String lastname;
  String email;
  String image;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstname: json["firstname"] ?? '',
        lastname: json["lastname"] ?? '',
        email: json["email"] ?? '',
        image: json["image"] ?? 'https://demofree.sirv.com/nope-not-here.jpg',
      );

  factory User.empty() {
    return User(
      id: 0,
      firstname: '',
      lastname: '',
      email: '',
      image: 'https://demofree.sirv.com/nope-not-here.jpg',
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "image": image,
      };
}
