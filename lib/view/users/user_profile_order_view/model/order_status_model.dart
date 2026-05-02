class OrderStatusModel {
  final String image;
  final String id;
  final String orderId;
  final double amount;
  final String date;
  final String status;

  OrderStatusModel({
    required this.image,
    required this.id,
    required this.orderId,
    required this.amount,
    required this.date,
    required this.status,
  });

  OrderStatusModel copyWith({String? status}) {
    return OrderStatusModel(
      id: id,
      image: image,
      orderId: orderId,
      amount: amount,
      date: date,
      status: status ?? this.status,
    );
  }
}