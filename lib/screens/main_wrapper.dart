import "package:flutter/material.dart";
import "buisness_screen.dart";
import "history_screen.dart";
import "../models/transaction.dart";

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0; // вкладка

  int balance = 0;
  List<Transaction> history = [];

  void updateData(int newBalance, List<Transaction> newHistory) {
    setState(() {
      balance = newBalance;
      history = newHistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      BusinessPage(
        balance: balance,
        history: history, 
        onUpdate: updateData
      ),
      HistoryScreen(
        fullHistory: history
      ),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: const Color.fromARGB(255, 0, 160, 21),
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),// Цвет активной иконки
        unselectedItemColor: Colors.white60, // Цвет неактивных иконок   

        // Настройка текста:
        showUnselectedLabels: false,  // Прятать текст у неактивных кнопок
        selectedFontSize: 14,
        unselectedFontSize: 12,  
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}