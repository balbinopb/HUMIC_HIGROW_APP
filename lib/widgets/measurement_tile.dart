import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:higrow/models/measure_model.dart';

class MeasurementTile extends StatelessWidget {
  final Measurement measurement;

  const MeasurementTile({super.key, required this.measurement});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.memory(base64Decode(measurement.photoBase64)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Height: ${measurement.height.toStringAsFixed(1)} cm',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
