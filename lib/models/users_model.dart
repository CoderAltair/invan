class User {
  final String lastname;
  final String email;

  User({
    required this.lastname,
    required this.email,
  });

  User.fromJson(Map<String, dynamic> json)
      : lastname = json['lastname'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'lastname': lastname,
        'email': email,
      };
}
