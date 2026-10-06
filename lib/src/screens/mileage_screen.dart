import 'package:flutter/material.dart';

class MileageScreen extends StatelessWidget {
  const MileageScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Mileage')),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      Card(child: Padding(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text('BUSINESS DISTANCE · OCTOBER'),
        const SizedBox(height: 8),
        Text('3,214 km', style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Keep business and personal driving separated for cleaner records.'),
      ]))),
      const SizedBox(height: 20),
      FilledButton.icon(onPressed: null, icon: Icon(Icons.play_arrow), label: Text('Start trip tracking')),
      const SizedBox(height: 10),
      OutlinedButton.icon(onPressed: null, icon: Icon(Icons.edit_road), label: Text('Add trip manually')),
    ]),
  );
}
