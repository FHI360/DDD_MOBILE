
Future<bool> validatePasswords(
  String password,
  String confirm,
) async {
  // Add your function code here!
  if (password == confirm) {
    return Future.value(true);
  }
  return Future.value(false);
}
