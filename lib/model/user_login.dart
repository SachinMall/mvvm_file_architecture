class UserDetails {
  final String email;
  final String password;

  UserDetails({
    required this.email,
    required this.password,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) {
    return UserDetails(
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
