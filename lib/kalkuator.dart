class Kalkulator {
  double tambah(double a, double b) {
    return a + b;
  }

  double kurang(double a, double b) {
    return a - b;
  }

  double kali(double a, double b) {
    return a * b;
  }

  double bagi(double a, double b) {
    if (b == 0) {
      throw Exception('Tidak bisa melakukan pembagian dengan nol.');
    }

    return a / b;
  }
}