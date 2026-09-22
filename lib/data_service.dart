import 'dart:async';

Future<String> fetchDataFromInternet(String param) async {
  String hasil;

  if (param == 'berhasil') {
    await Future.delayed(Duration(seconds: 2));
    hasil = 'Data berhasil diambil dari internet';
  } else if (param == 'tidak berhasil') {
    await Future.delayed(Duration(seconds: 2));
    throw Exception('Gagal mengambil data dari internet');
  } else {
    throw ArgumentError('Parameter tidak valid');
  }

  return hasil;
}
