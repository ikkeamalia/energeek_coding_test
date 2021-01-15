class Products {
	int id;
	String nama;
	int harga;
	int qty = 0;

	Products({this.id, this.nama, this.harga});

	Products.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		nama = json['nama'];
		harga = json['harga'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['nama'] = this.nama;
		data['harga'] = this.harga;
		return data;
	}
}