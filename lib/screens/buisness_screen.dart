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
    newHistory.insert(0, Transaction(
      amount: amount, 
      date: DateTime.now(), 
      isProfit: isEarn
    ));

    // Вызываем функцию родителя вместо локального setState
    widget.onUpdate(newBalance, newHistory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Business"),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Text('Balance: ${widget.balance}\$', style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: () => _modifyMoney(true), child: const Text('Заработать')),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: () => _modifyMoney(false), child: const Text('Потратить')),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.history.length > 10 ? 10 : widget.history.length,
              itemBuilder: (context, index) {
                final item = widget.history[index];
                return ListTile(
                  title: Text('${item.isProfit ? "Доход" : "Расход"}: ${item.amount}\$'),
                  textColor: item.isProfit ? Colors.green : Colors.red,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}