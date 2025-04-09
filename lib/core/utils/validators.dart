class Validators {
  // Validação de CPF
  static String? cpf(String? value) {
    if (value == null || value.isEmpty) return 'CPF obrigatório';
    final cleanedCpf = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanedCpf.length != 11) return 'CPF inválido';
    return null;
  }

  // Validação de e-mail
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'E-mail obrigatório';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'E-mail inválido';
    return null;
  }
}