import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Icon(Icons.workspace_premium, size: 64),
      const SizedBox(height: 16),
      Text('DriverLedger Pro', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('Drive smarter. Keep more of what you earn.', textAlign: TextAlign.center),
      const SizedBox(height: 28),
      const _Feature('Unlimited income and expense tracking'),
      const _Feature('Mileage tracking and trip history'),
      const _Feature('Receipt storage and exports'),
      const _Feature('Inventory and maintenance reminders'),
      const _Feature('Advanced profit and tax-ready reports'),
      const _Feature('Multiple vehicles and cloud backup'),
      const SizedBox(height: 28),
      FilledButton(onPressed: () {}, child: const Padding(padding: EdgeInsets.all(14), child: Text('Start Pro trial · \$9.99 CAD/month'))),
      const SizedBox(height: 10),
      const Text('Annual plan: \$79.99 CAD/year. Purchases will be connected to Apple and Google through RevenueCat.', textAlign: TextAlign.center),
    ],
  );
}

class _Feature extends StatelessWidget {
  const _Feature(this.text);
  final String text;
  @override
  Widget build(BuildContext context) => ListTile(leading: const Icon(Icons.check_circle_outline), title: Text(text), contentPadding: EdgeInsets.zero);
}
