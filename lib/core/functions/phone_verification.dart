bool isValidPakistaniPhoneNumber(String phone) {
  final RegExp phoneRegex = RegExp(
    r'^(?:\+92|92|0)?3[0-9]{9}$'
  );
  return phoneRegex.hasMatch(phone);
}
