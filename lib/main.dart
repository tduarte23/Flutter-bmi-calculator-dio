import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: BMICalculator(),
    ));

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: const BMIForm(),
    );
  }
}

class BMIForm extends StatefulWidget {
  const BMIForm({super.key});

  @override
  _BMIFormState createState() => _BMIFormState();
}

class _BMIFormState extends State<BMIForm> {
  double height = 180.0;
  double weight = 70.0;
  double bmi = 0.0;

  void calculateBMI() {
    setState(() {
      // BMI formula: weight (kg) / (height (m) * height (m))
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Coloque sua altura (cm):'),
        Slider(
          value: height,
          min: 120,
          max: 220,
          onChanged: (value) {
            setState(() {
              height = value;
            });
          },
        ),
        const Text('Coloque seu peso (kg):'),
        Slider(
          value: weight,
          min: 40,
          max: 140,
          onChanged: (value) {
            setState(() {
              weight = value;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            calculateBMI();
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Seu IMC é de :'),
                  content: Text(bmi.toStringAsFixed(2)),
                );
              },
            );
          },
          child: const Text('Calculate BMI'),
        ),
      ],
    );
  }
}
