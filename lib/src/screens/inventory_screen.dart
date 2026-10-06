import 'package:flutter/material.dart';
import '../models/driver_data.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  static const items = [
    InventoryItem(name: 'Water bottles', quantity: 18, minimumQuantity: 6, unitCost: 0.72),
    InventoryItem(name: 'Cleaning wipes', quantity: 2, minimumQuantity: 2, unitCost: 4.25),
    InventoryItem(name: 'Charging cables', quantity: 3, minimumQuantity: 1, unitCost: 8.00),
    InventoryItem(name: 'Air fresheners', quantity: 1, minimumQuantity: 2, unitCost: 6.99),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Inventory')),
    floatingActionButton: FloatingActionButton.extended(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Item')),
    body: ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: items.length,
      separatorBuilder: (_, __) => const Divider(),
      itemBuilder: (_, i) {
        final item = items[i];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(child: Icon(item.isLow ? Icons.warning_amber : Icons.inventory_2_outlined)),
          title: Text(item.name),
          subtitle: Text('\$ ${item.unitCost.toStringAsFixed(2)} each'),
          trailing: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text('${item.quantity} left', style: const TextStyle(fontWeight: FontWeight.bold)),
            if (item.isLow) const Text('Reorder', style: TextStyle(fontSize: 12)),
          ]),
        );
      },
    ),
  );
}
