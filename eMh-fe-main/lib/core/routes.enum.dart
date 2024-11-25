enum Routes {
  root('/'),
  login('/login'),
  signup('/signup'),
  otpVerification('/otpVerification'),
  welcomeScreen('/welcomeScreen'),
  dashboard('/dashboard'),
  settings('/settings'),
  medicalReports('/medicalReports'),
  addMedicalReports('/addMedicalReports'),
  profile('/profile'),
  reportDetails('/reportDetails');

  final String route;
  const Routes(this.route);
}
