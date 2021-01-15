class DetailHistories {
  int id;
  String nama;
  int harga;
  int qty;

  DetailHistories({this.id, this.nama, this.harga, this.qty});

  DetailHistories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    harga = json['harga'];
    qty = json['qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    data['harga'] = this.harga;
    data['qty'] = this.qty;
    return data;
  }
}