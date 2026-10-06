import 'package:flutter/material.dart';
import '../models/driver_data.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  static final transactions = [
    DriverTransaction(title: 'Uber earnings', category: 'Rideshare', amount: 286.40, type: TransactionType.income, date: DateTime.now()),
    DriverTransaction(title: 'Fuel', category: 'Fuel', amount: 72.18, type: TransactionType.expense, date: DateTime.now()),
    DriverTransaction(title: 'Car wash', category: 'Cleaning', amount: 18.00, type: TransactionType.expense, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Income & expenses')),
    floatingActionButton: FloatingActionButton.extended(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Transaction')),
    body: ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, i) {
        final t = transactions[i];
        final income = t.type == TransactionType.income;
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(child: Icon(income ? Icons.south_west : Icons.north_east)),
          title: Text(t.title),
          subtitle: Text(t.category),
          trailing: Text('${income ? '+' : '-'}\$ ${t.amount.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
        );
      },
    ),
  );
}
