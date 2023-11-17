import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int passCount = 0;
  int reworkCount = 0;
  int defectiveCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Counter'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          padding: EdgeInsets.all(10.0),
          children: [
            _buildCategoryCard('Products Passed', passCount, () {
              setState(() {
                passCount++;
              });
            }),
            _buildCategoryCard('Products Reworked', reworkCount, () {
              setState(() {
                reworkCount++;
              });
            }),
            _buildCategoryCard('Defective Products', defectiveCount, () {
              setState(() {
                defectiveCount++;
              });
            }),
            _buildCategoryCard('Total Products', passCount + reworkCount + defectiveCount, null),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String category, int count, VoidCallback? onPressed) {
    return Card(
      elevation: 5.0,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$count',
                style: TextStyle(fontSize: 54.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(category, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
