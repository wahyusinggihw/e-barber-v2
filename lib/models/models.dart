class FormData {
  late String id = "id",
      namaDepan = "Nama Depan",
      namaBelakang = "Nama Belakang",
      email = "Email",
      password = "Password",
      confirmPassword = "Konfirmasi Password",
      role = '';
}

class UserRole {
  late String role = '';
}

class SimpanData {
  static late String id,
      namaDepan,
      namaBelakang,
      email,
      password,
      confirmPassword,
      role;
}

class authValidation {
  static late String role = '', action = '';
}
