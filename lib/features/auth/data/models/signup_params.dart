class SignupParams {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;
  final String imageUrl;
  final String firstName, lastName;

  SignupParams({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.imageUrl,
    required this.firstName,
    required this.lastName,
  });
}
