import 'package:flutter/material.dart';

class SeverityGauge extends StatelessWidget {
  final double severity;

  SeverityGauge({required this.severity});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Low', style: TextStyle(color: Colors.green)),
            Text('Moderate', style: TextStyle(color: Colors.yellow)),
            Text('High', style: TextStyle(color: Colors.red)),
          ],
        ),
        SizedBox(height: 8.0),
        Container(
          width: 400.0,
          height: 20.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.grey[300],
          ),
          child: Stack(
            children: [
              Container(
                width: 400.0 * severity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.yellow,
                      Colors.red,
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 4.0,
                    height: 20.0,
                    color: Color.fromRGBO(241, 241, 249, 1),
                  ),
                  Container(
                    width: 4.0,
                    height: 20.0,
                  ),
                  Container(
                    width: 4.0,
                    height: 20.0,
                    color: Color.fromRGBO(241, 241, 249, 1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}





