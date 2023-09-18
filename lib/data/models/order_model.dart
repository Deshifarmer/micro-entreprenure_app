// ignore_for_file: non_constant_identifier_names

class OrderModel {
  OrderModel({
    required this.product_id,
    required this.unit,
    required this.quantity,
  });
  final String product_id;
  final int unit;
  final int quantity;
  Map<String, dynamic> toMap() {
    return {
      'product_id': product_id,
      'unit': unit,
      'quantity': quantity,
    };
  }
}
