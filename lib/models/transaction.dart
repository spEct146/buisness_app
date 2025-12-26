class Transaction {
  final int amount;
  final DateTime date;
  final bool isProfit;

  Transaction({
    required this.amount,
    required this.date,
    required this.isProfit,
  });
}
