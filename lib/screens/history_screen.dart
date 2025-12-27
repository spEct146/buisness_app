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
      appBar: CustomAppBar(title: "Full history"),
      body: Column(
        children: [
          Row(         
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(height: 20),
              Text(
                "История транзакций",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: fullHistory.length,
                      itemBuilder: (context, index) {
                        return TransactionCard(
                          transaction: fullHistory[index],
                          index: fullHistory.length - index,
                        );
                      },
                    ),
      ),], 
      ),
    );
  }
}
