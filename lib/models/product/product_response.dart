
import 'package:energeek_test/models/product/products.dart';

class ProductResponse {

  List<Products> products;

	ProductResponse.fromJsonMap(Map<String, dynamic> map): 
		products = List<Products>.from(map["products"].map((it) => Products.fromJson(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['products'] = products != null ? 
			this.products.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
