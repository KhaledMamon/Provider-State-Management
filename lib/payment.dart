import 'package:flutter/material.dart';
import 'package:counter/provider.dart';
import 'package:provider/provider.dart';

class Payment extends StatelessWidget {
  const Payment({super.key, required this.model});

  final Model model;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: model,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.brown, title: Text('Payment')),
        body: Consumer<Model>(
          builder: (context, val, child) => Center(
            child: Column(
              children: [
                SizedBox(height: 200),
                Text(
                  'number of cups : ${val.cups} \n nuber of coffee : ${val.coffeeCount} \n number of suger ${val.sugarCount}',
                  style: TextStyle(fontSize: 25, color: Color(0xFF5D4037)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
