enum CountryCode {
  india(name: 'India', code: '91'),
  timorLeste(name: 'Timor-Leste', code: '670'); // Corrected the name and code

  const CountryCode({required this.name, required this.code})
      : codeWithPlus = '+$code';
  final String name;
  final String code;
  final String codeWithPlus;
}
