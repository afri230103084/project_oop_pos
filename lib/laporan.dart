import 'transaksi.dart';

class Laporan {
  // Daftar transaksi yang disimpan
  List<Transaksi> riwayatTransaksi = [];

  // Method untuk menambahkan transaksi ke laporan
  void tambahTransaksi(Transaksi transaksi) {
    riwayatTransaksi.add(transaksi);
    print('Transaksi berhasil disimpan.');
  }

  // Method untuk menampilkan semua laporan penjualan
  void tampilkanLaporan() {
    if (riwayatTransaksi.isEmpty) {
      print('Belum ada transaksi.');
      return;
    }

    print('--- LAPORAN PENJUALAN ---');
    for (var transaksi in riwayatTransaksi) {
      print('Tanggal: ${transaksi.tanggal} | Total: Rp${transaksi.total}');
    }
  }
}
