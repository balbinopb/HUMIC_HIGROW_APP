import 'package:flutter/material.dart';
import 'package:higrow/models/measure_model.dart';

class MeasurementTile extends StatelessWidget {
  final Measurement measurement;

  const MeasurementTile({super.key, required this.measurement});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        measurement.imageUrl,
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      ),
      title: Text(
        measurement.title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(measurement.date),
    );
  }
}
