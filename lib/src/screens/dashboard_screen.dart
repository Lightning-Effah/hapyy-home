import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('DriverLedger', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text('Your driving business at a glance', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        const _ProfitCard(),
        const SizedBox(height: 16),
        const Row(children: [
          Expanded(child: _MetricCard(label: 'Income', value: '\$4,820', icon: Icons.trending_up)),
          SizedBox(width: 12),
          Expanded(child: _MetricCard(label: 'Expenses', value: '\$1,340', icon: Icons.trending_down)),
        ]),
        const SizedBox(height: 12),
        const Row(children: [
          Expanded(child: _MetricCard(label: 'Business km', value: '3,214', icon: Icons.route)),
          SizedBox(width: 12),
          Expanded(child: _MetricCard(label: 'Cost / km', value: '\$0.42', icon: Icons.speed)),
        ]),
        const SizedBox(height: 24),
        Text('Quick actions', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        const Wrap(spacing: 10, runSpacing: 10, children: [
          ActionChip(avatar: Icon(Icons.add, size: 18), label: Text('Add expense')),
          ActionChip(avatar: Icon(Icons.attach_money, size: 18), label: Text('Add income')),
          ActionChip(avatar: Icon(Icons.route, size: 18), label: Text('Log trip')),
          ActionChip(avatar: Icon(Icons.camera_alt_outlined, size: 18), label: Text('Receipt')),
        ]),
      ],
    );
  }
}

class _ProfitCard extends StatelessWidget {
  const _ProfitCard();
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(22),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('NET PROFIT · THIS MONTH'),
        const SizedBox(height: 8),
        Text('\$3,480', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Income minus recorded business expenses'),
      ]),
    ),
  );
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({required this.label, required this.value, required this.icon});
  final String label;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon),
        const SizedBox(height: 16),
        Text(value, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        Text(label),
      ]),
    ),
  );
}
