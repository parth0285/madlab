import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Icons, Images & Charts Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // 1. Header with Icon
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, size: 50, color: Colors.orange),
                SizedBox(width: 10),
                Text(
                  'My Dashboard',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20),

            // 2. Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://picsum.photos/400/200',
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),

            // 3. Chart Section
            Text(
              'Monthly Sales',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 20,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          const labels = ['Jan', 'Feb', 'Mar', 'Apr'];
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(labels[value.toInt()]),
                          );
                        },
                      ),
                    ),
                  ),
                  barGroups: [
                    BarChartGroupData(
                        x: 0,
                        barRods: [BarChartRodData(toY: 8, color: Colors.blue)]),
                    BarChartGroupData(
                        x: 1,
                        barRods: [BarChartRodData(toY: 12, color: Colors.green)]),
                    BarChartGroupData(
                        x: 2,
                        barRods: [BarChartRodData(toY: 15, color: Colors.orange)]),
                    BarChartGroupData(
                        x: 3,
                        barRods: [BarChartRodData(toY: 10, color: Colors.red)]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
