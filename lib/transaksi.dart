import 'produk.dart';

class Transaksi {
  DateTime tanggal;
  List<Map<String, dynamic>> items;
  double total;

  // Constructor untuk inisialisasi transaksi
  Transaksi(this.tanggal, this.items, this.total);

  // Method untuk mencetak struk
  void cetakStruk() {
    print('--- STRUK PEMBELIAN ---');
    print('Tanggal: $tanggal');
    print('-----------------------');
    for (var item in items) {
      var produk = item['produk'] as Produk;
      var jumlah = item['jumlah'] as int;
      print('${produk.nama} - Rp${produk.harga} x $jumlah');
    }
    print('-----------------------');
    print('Total Bayar: Rp$total');
  }
}
