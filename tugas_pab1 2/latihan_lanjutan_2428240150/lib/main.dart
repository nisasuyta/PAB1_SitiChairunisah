// MIXIN PERAWATAN

mixin Perawatan {
  void jadwalPerawatan() {
    print('Kendaraan memerlukan perawatan berkala.');
  }
}

// ABSTRACT CLASS KENDARAAN

abstract class Kendaraan {
  // Encapsulation: atribut dibuat private
  String _merk;
  String _model;
  int _tahun;

  // Constructor
  Kendaraan(String merk, String model, int tahun)
      : _merk = merk,
        _model = model,
        _tahun = tahun >= 1900 ? tahun : 1900;

  // Getter
  String get merk => _merk;
  String get model => _model;
  int get tahun => _tahun;

  // Setter
  set merk(String merk) {
    _merk = merk;
  }

  set model(String model) {
    _model = model;
  }

  set tahun(int tahun) {
    if (tahun >= 1900) {
      _tahun = tahun;
    } else {
      print('Tahun tidak valid. Nilai tahun tidak diubah.');
    }
  }

  // Method abstrak
  double hitungBiayaOperasional();
  void tampilkanInfo();

  // Method untuk mengakses method mixin
  void jadwalPerawatan();
}

// CLASS MOBIL

class Mobil extends Kendaraan with Perawatan {
  int jumlahKursi;
  String bahanBakar;

  // Constructor
  Mobil(
    String merk,
    String model,
    int tahun,
    this.jumlahKursi,
    this.bahanBakar,
  ) : super(merk, model, tahun);

  // Polymorphism
  @override
  double hitungBiayaOperasional() {
    return 150000 + (jumlahKursi * 25000);
  }

  // Polymorphism
  @override
  void tampilkanInfo() {
    print('Jenis Kendaraan : Mobil');
    print('Merk            : $merk');
    print('Model           : $model');
    print('Tahun           : $tahun');
    print('Jumlah Kursi    : $jumlahKursi');
    print('Bahan Bakar     : $bahanBakar');
  }
}

// CLASS MOTOR

class Motor extends Kendaraan with Perawatan {
  String jenisMotor;
  int kapasitasMesin;

  // Constructor
  Motor(
    String merk,
    String model,
    int tahun,
    this.jenisMotor,
    this.kapasitasMesin,
  ) : super(merk, model, tahun);

  // Polymorphism
  @override
  double hitungBiayaOperasional() {
    return 75000 + (kapasitasMesin * 100);
  }

  // Polymorphism
  @override
  void tampilkanInfo() {
    print('Jenis Kendaraan : Motor');
    print('Merk            : $merk');
    print('Model           : $model');
    print('Tahun           : $tahun');
    print('Jenis Motor     : $jenisMotor');
    print('Kapasitas Mesin : $kapasitasMesin cc');
  }
}

// FUNGSI TOTAL BIAYA OPERASIONAL

double totalBiayaOperasional(List<Kendaraan> kendaraan) {
  double total = 0;

  for (var item in kendaraan) {
    total += item.hitungBiayaOperasional();
  }

  return total;
}

// FUNGSI MENCARI KENDARAAN DENGAN BIAYA TERBESAR

Kendaraan kendaraanTermahal(List<Kendaraan> kendaraan) {
  if (kendaraan.isEmpty) {
    throw ArgumentError('Daftar kendaraan tidak boleh kosong.');
  }

  Kendaraan termahal = kendaraan[0];

  for (var item in kendaraan) {
    if (item.hitungBiayaOperasional() >
        termahal.hitungBiayaOperasional()) {
      termahal = item;
    }
  }

  return termahal;
}

// MAIN PROGRAM

void main() {
  // Membuat 2 objek Mobil
  Mobil mobil1 = Mobil(
    'Toyota',
    'Avanza',
    2022,
    7,
    'Bensin',
  );

  Mobil mobil2 = Mobil(
    'Honda',
    'HR-V',
    2023,
    5,
    'Bensin',
  );

  // Membuat 2 objek Motor
  Motor motor1 = Motor(
    'Honda',
    'Vario',
    2022,
    'Matic',
    150,
  );

  Motor motor2 = Motor(
    'Yamaha',
    'NMAX',
    2024,
    'Matic',
    155,
  );

  // Polymorphism:
  // semua objek disimpan dalam satu List<Kendaraan>
  List<Kendaraan> kendaraan = [
    mobil1,
    mobil2,
    motor1,
    motor2,
  ];

  print('========================================');
  print('      SISTEM PENGELOLAAN KENDARAAN');
  print('========================================');

  // Menampilkan informasi setiap kendaraan
  // tanpa mengecek apakah Mobil atau Motor
  for (var item in kendaraan) {
    print('\n----------------------------------------');
    item.tampilkanInfo();
    print(
      'Biaya Operasional: Rp${item.hitungBiayaOperasional().toStringAsFixed(0)}',
    );
    item.jadwalPerawatan();
  }

  // Menghitung total biaya operasional
  double total = totalBiayaOperasional(kendaraan);

  print('\n========================================');
  print('TOTAL BIAYA OPERASIONAL');
  print('Rp${total.toStringAsFixed(0)}');

  // Mencari kendaraan dengan biaya operasional terbesar
  Kendaraan termahal = kendaraanTermahal(kendaraan);

  print('\n========================================');
  print('KENDARAAN DENGAN BIAYA TERBESAR');
  print('Merk  : ${termahal.merk}');
  print('Model : ${termahal.model}');
  print(
    'Biaya : Rp${termahal.hitungBiayaOperasional().toStringAsFixed(0)}',
  );
  print('========================================');
}