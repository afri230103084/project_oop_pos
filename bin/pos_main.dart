import '../lib/produk.dart';
import '../lib/keranjang.dart';
import '../lib/transaksi.dart';
import '../lib/laporan.dart';
import 'dart:io';
  
void main() {
  // Inisialisasi data awal
  List<Produk> daftarProduk = [
    Produk('Kopi', 15000, 20),
    Produk('Teh', 10000, 30),
    Produk('Roti', 12000, 15),
  ];
  Keranjang keranjang = Keranjang();
  Laporan laporan = Laporan();

  // Loop menu utama
  while (true) {
    print('\n' + '=' * 40);
    print('=== Sistem Point of Sales (POS) ===');
    print('=' * 40);
    print('1. Tampilkan Produk');
    print('2. Tambah Produk ke Keranjang');
    print('3. Hapus Produk dari Keranjang');
    print('4. Tampilkan Keranjang');
    print('5. Proses Transaksi');
    print('6. Tampilkan Laporan Penjualan');
    print('7. Keluar');
    stdout.write('Pilih menu (1-7): ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        print('\n' + '=' * 40);
        print('=== Daftar Produk ===');
        print('=' * 40);
        for (var produk in daftarProduk) {
          produk.tampilkanInfo();
        }
        break;
      case '2':
        print('\n' + '=' * 40);
        print('=== Tambah Produk ke Keranjang ===');
        print('=' * 40);
        stdout.write('Nama produk: ');
        String? namaProduk = stdin.readLineSync();
        stdout.write('Jumlah: ');
        int? jumlah = int.tryParse(stdin.readLineSync() ?? '0');

        var produk = daftarProduk.firstWhere(
          (p) => p.nama.toLowerCase() == namaProduk?.toLowerCase(),
          orElse: () =>
              Produk('', 0, 0),
        );

        if (produk.nama.isNotEmpty && jumlah != null) {
          keranjang.tambahProduk(produk, jumlah);
        } else {
          print('Produk tidak ditemukan atau jumlah tidak valid.');
        }
        break;
      case '3':
        print('\n' + '=' * 40);
        print('=== Hapus Produk dari Keranjang ===');
        print('=' * 40);
        stdout.write('Nama produk: ');
        String? namaProduk = stdin.readLineSync();
        keranjang.hapusProduk(namaProduk ?? '');
        break;
      case '4':
        print('\n' + '=' * 40);
        print('=== Tampilkan Keranjang ===');
        print('=' * 40);
        keranjang.tampilkanKeranjang();
        break;
      case '5':
        print('\n' + '=' * 40);
        print('=== Proses Transaksi ===');
        print('=' * 40);
        double total = keranjang.hitungTotal();
        if (total > 0) {
          Transaksi transaksi =
              Transaksi(DateTime.now(), keranjang.items, total);
          transaksi.cetakStruk();
          laporan.tambahTransaksi(transaksi);
          keranjang.kosongkanKeranjang();
        } else {
          print('Keranjang kosong. Tidak ada transaksi yang dapat diproses.');
        }
        break;
      case '6':
        print('\n' + '=' * 40);
        print('=== Tampilkan Laporan Penjualan ===');
        print('=' * 40);
        laporan.tampilkanLaporan();
        break;
      case '7':
        print('Keluar dari sistem.');
        return;
      default:
        print('Pilihan tidak valid.');
    }
  }
}
