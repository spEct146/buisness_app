import 'package:flutter/material.dart';
import 'dart:math';
import '../models/transaction.dart';
import '../widgets/app_bar.dart';

class BusinessPage extends StatefulWidget {
  final int balance;
  final List<Transaction> history;
  final Function(int, List<Transaction>) onUpdate;

  const BusinessPage({
    super.key,
    required this.balance,
    required this.history,
    required this.onUpdate,
  });

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  final _random = Random();

  void _modifyMoney(bool isEarn) {
    final amount = isEarn ? _random.nextInt(101) : _random.nextInt(51);
    int newBalance = isEarn ? widget.balance + amount : widget.balance - amount;

    List<Transaction> newHistory = List.from(widget.history);
    newHistory.insert(
      0,
      Transaction(amount: amount, date: DateTime.now(), isProfit: isEarn),
    );

    // Вызываем функцию родителя вместо локального setState
    widget.onUpdate(newBalance, newHistory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Business"),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 66, 236, 80),
                  Color.fromARGB(255, 5, 155, 0),
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  'Balance: ${widget.balance}\$',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () => _modifyMoney(true),
                      icon: const Icon(Icons.add),
                      label: const Text('Заработать'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () => _modifyMoney(false),
                      icon: const Icon(Icons.remove),
                      label: const Text('Потратить'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(64, 189, 189, 189),
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: widget.history.length > 10
                          ? 10
                          : widget.history.length,
                      itemBuilder: (context, index) {
                        final item = widget.history[index];
                        return ListTile(
                          title: Text(
                            '${item.isProfit ? "Доход" : "Расход"}: ${item.amount}\$',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          textColor: item.isProfit ? Colors.green : Colors.red,
                          leading: Icon(
                            item.isProfit
                                ? Icons.arrow_upward
                                : Icons.arrow_downward,
                            color: item.isProfit ? Colors.green : Colors.red,
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
