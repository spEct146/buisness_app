import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final int index;

  const TransactionCard({
    super.key,
    required this.transaction,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$index ${transaction.isProfit ? "Заработано" : "Потрачено"}: ${transaction.amount} \$',
        style: TextStyle(
          color: transaction.isProfit ? Colors.green : Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: const Icon(Icons.monetization_on, color: Colors.green),
    );
  }
}
