enum TransactionType { income, expense }

class DriverTransaction {
  const DriverTransaction({
    required this.title,
    required this.category,
    required this.amount,
    required this.type,
    required this.date,
  });

  final String title;
  final String category;
  final double amount;
  final TransactionType type;
  final DateTime date;
}

class InventoryItem {
  const InventoryItem({
    required this.name,
    required this.quantity,
    required this.minimumQuantity,
    required this.unitCost,
  });

  final String name;
  final int quantity;
  final int minimumQuantity;
  final double unitCost;

  bool get isLow => quantity <= minimumQuantity;
}
