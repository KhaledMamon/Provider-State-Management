import 'package:counter/payment.dart';
import 'package:counter/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.brown, title: Text(title)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Consumer<Model>(
            builder: (context, mod, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Add Coffee?'),
                Row(
                  children: [
                    if (mod.coffeeCount == 0)
                      const Text(
                        'No Coffee ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    for (int i = 0; i < mod.coffeeCount; i++)
                      Image.asset(
                        'assets/coffee.png',
                        width: 25,
                        fit: BoxFit.cover,
                      ),

                    const Expanded(child: SizedBox()),
                    FilledButton(
                      onPressed: mod.incrementCoffeeCount,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.brown[500],
                      ),
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[100],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: mod.decrementCoffeeCount,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.brown[500],
                      ),
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[100],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),

                const Text('Add Suger?'),
                Row(
                  children: [
                    if (mod.sugarCount == 0)
                      const Text(
                        'No Suger ',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    for (int i = 0; i < mod.sugarCount; i++)
                      Image.asset(
                        'assets/suger.png',
                        width: 25,
                        fit: BoxFit.cover,
                      ),

                    const Expanded(child: SizedBox()),
                    FilledButton(
                      onPressed: mod.incrementSugarCount,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.brown[500],
                      ),
                      child: Text(
                        '+',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[100],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    FilledButton(
                      onPressed: mod.decrementSugarCount,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.brown[500],
                      ),
                      child: Text(
                        '-',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown[100],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),

                SizedBox(
                  width: 180,
                  child: TextField(
                    onSubmitted: (value) => mod.cups = int.parse(value),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hint: Text('how many cups need it?'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Your Order True?'),
                        content: Text(
                          'Cups: ${mod.cups} \nCoffee: ${mod.coffeeCount}\nSuger: ${mod.sugarCount} ',
                          style: TextStyle(fontSize: 18),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'Check Order',
                    style: TextStyle(fontSize: 18, color: Color(0xFF5D4037)),
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Payment(model: mod),
                      ),
                    );
                  },
                  child: Text(
                    'pay?',
                    style: TextStyle(fontSize: 18, color: Color(0xFF5D4037)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
