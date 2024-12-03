import 'produk.dart';

class Keranjang {
  // Daftar item di keranjang
  List<Map<String, dynamic>> items = [];

  // Method untuk menambahkan produk ke keranjang
  void tambahProduk(Produk produk, int jumlah) {
    if (produk.stok >= jumlah) {
      produk.stok -= jumlah; // Kurangi stok produk
      items.add({'produk': produk, 'jumlah': jumlah});
      print('${produk.nama} ditambahkan ke keranjang.');
    } else {
      print('Stok tidak mencukupi.');
    }
  }

  // Method untuk menghapus produk dari keranjang
  void hapusProduk(String namaProduk) {
    items.removeWhere((item) {
      if (item['produk'].nama == namaProduk) {
        Produk produk = item['produk'] as Produk;
        produk.stok += item['jumlah'] as int; // Kembalikan stok
        print('$namaProduk dihapus dari keranjang.');
        return true;
      }
      return false;
    });
  }

  // Method untuk menampilkan isi keranjang
  void tampilkanKeranjang() {
    if (items.isEmpty) {
      print('Keranjang kosong.');
      return;
    }
    print('Isi Keranjang:');
    for (var item in items) {
      Produk produk = item['produk'] as Produk;
      print('${produk.nama} - Rp${produk.harga} x ${item['jumlah']}');
    }
  }

  // Method untuk menghitung total belanja
  double hitungTotal() {
    double total = 0;
    for (var item in items) {
      Produk produk = item['produk'] as Produk;
      total += produk.harga * (item['jumlah'] as int);
    }
    return total;
  }

  // Method untuk mengosongkan keranjang
  void kosongkanKeranjang() {
    items.clear();
    print('Keranjang telah dikosongkan.');
  }
}
