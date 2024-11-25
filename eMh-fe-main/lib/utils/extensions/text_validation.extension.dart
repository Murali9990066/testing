extension StringExtension on String {
  static final RegExp _nameRegex = RegExp(r'^[a-zA-Z ]{3,}$');
  static final RegExp _emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final RegExp _phoneRegex = RegExp(r'^\+?[0-9]{10,14}$');
  static final RegExp _passwordRegex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$');
  static final RegExp _addressRegex = RegExp(r'^[a-zA-Z0-9\s,-]{10,}$');
  static final RegExp _usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
  static final RegExp _urlRegex = RegExp(r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$');
  static final RegExp _ipAddressRegex = RegExp(r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
  static final RegExp _dateRegex = RegExp(r'^\d{4}-\d{2}-\d{2}$');
  static final RegExp _timeRegex = RegExp(r'^([01]?[0-9]|2[0-3]):[0-5][0-9]$');
  static final RegExp _creditCardRegex = RegExp(r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\d{3})\d{11})$');
  static final RegExp _otpRegex = RegExp(r'^[0-9]{6}$');

  bool isValidName() => _nameRegex.hasMatch(this);
  bool isValidEmail() => _emailRegex.hasMatch(this);
  bool isValidPhoneNumber() => _phoneRegex.hasMatch(this);
  bool isValidPassword() => _passwordRegex.hasMatch(this);
  bool isValidAddress() => _addressRegex.hasMatch(this);
  bool isValidUsername() => _usernameRegex.hasMatch(this);
  bool isValidUrl() => _urlRegex.hasMatch(this);
  bool isValidIpAddress() => _ipAddressRegex.hasMatch(this);
  bool isValidDate() => _dateRegex.hasMatch(this);
  bool isValidTime() => _timeRegex.hasMatch(this);
  bool isValidCreditCard() => _creditCardRegex.hasMatch(this);
  bool isValidOtp() => _otpRegex.hasMatch(this);
}