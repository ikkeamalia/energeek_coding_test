import 'env.dart';

class VUrl {
  static String api = "${Env.baseUrl}/api";

  static String products = "$api/produk";
  static String transactions = "$api/penjualan";
  static String addTransactions = "$transactions/save";
  static String transactionDetail = "$transactions/detail?id=";

}