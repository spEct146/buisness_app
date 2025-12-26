import 'package:first_project/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import '../widgets/transaction_card.dart';

class HistoryScreen extends StatelessWidget {
  final List<Transaction> fullHistory;

  const HistoryScreen({super.key, required this.fullHistory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title:"Full history"),
      body: ListView.builder(
        itemCount: fullHistory.length,
        itemBuilder: (context, index) {
          return TransactionCard(
            transaction: fullHistory[index],
            index: fullHistory.length - index,
          );
        },
      ),
    );
  }
}