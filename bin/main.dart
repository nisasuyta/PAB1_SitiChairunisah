import 'package:nisap4/data_service.dart';
void main() async {
  try {
    print('Mengambil data dari internet...');
    final data1 = await fetchDataFromInternet('berhasil');
    print('Data 1: $data1');

    final data2 = await fetchDataFromInternet('tidak berhasil');
    print('Data 2: $data2');
  } catch (e) {
    print('Terjadi kesalahan: $e');
  }
}