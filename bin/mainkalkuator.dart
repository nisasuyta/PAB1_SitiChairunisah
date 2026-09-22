import 'dart:io';
import 'package:nisap4/kalkuator.dart';

void main() {
  Kalkulator kalkulator = Kalkulator();

  bool ulangi = true;

  while (ulangi) {
    print('\n=== KALKULATOR SEDERHANA ===');

    double? bilanganPertama;
    double? bilanganKedua;

    // Input bilangan pertama
    while (bilanganPertama == null) {
      stdout.write('Masukkan bilangan pertama: ');
      String? input = stdin.readLineSync();

      try {
        bilanganPertama = double.parse(input!);
      } catch (e) {
        print('Input tidak valid. Silakan masukkan angka.');
      }
    }

    // Input bilangan kedua
    while (bilanganKedua == null) {
      stdout.write('Masukkan bilangan kedua: ');
      String? input = stdin.readLineSync();

      try {
        bilanganKedua = double.parse(input!);
      } catch (e) {
        print('Input tidak valid. Silakan masukkan angka.');
      }
    }

    print('\nPilih operasi:');
    print('[1] Tambah');
    print('[2] Kurang');
    print('[3] Kali');
    print('[4] Bagi');

    stdout.write('Masukkan pilihan (1-4): ');
    String? pilihan = stdin.readLineSync();

    try {
      double hasil;

      switch (pilihan) {
        case '1':
          hasil = kalkulator.tambah(bilanganPertama, bilanganKedua);
          break;

        case '2':
          hasil = kalkulator.kurang(bilanganPertama, bilanganKedua);
          break;

        case '3':
          hasil = kalkulator.kali(bilanganPertama, bilanganKedua);
          break;

        case '4':
          hasil = kalkulator.bagi(bilanganPertama, bilanganKedua);
          break;

        default:
          print('Pilihan operasi tidak valid.');
          continue;
      }

      print('Hasil perhitungan: $hasil');
    } catch (e) {
      print('Terjadi kesalahan: ${e.toString().replaceFirst('Exception: ', '')}');
    }

    stdout.write('\nApakah ingin melakukan perhitungan lagi? (Ya/Tidak): ');
    String? jawaban = stdin.readLineSync();

    if (jawaban == null || jawaban.toLowerCase() != 'ya') {
      ulangi = false;
    }
  }

  print('\nProgram selesai. Terima kasih!');
}