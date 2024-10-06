String? emailValidator(String? value) {
  if (value!.isEmpty) {
    return 'Email address is required';
  }

  if (!RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$").hasMatch(value)) {
    return 'Please enter a valid email address';
  }

  return null;
}

String? passwordValidator(String? value) {
  if (value!.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  return null;
}