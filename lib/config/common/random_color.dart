import 'dart:math';

import 'package:flutter/material.dart';

Color generateRandomColor() {
    Random random = Random();
    // Exclure les couleurs proches du noir et du blanc
    int minColorValue = 50;  // Ajuster pour éviter le noir
    int maxColorValue = 205; // Ajuster pour éviter le blanc
    return Color.fromARGB(
      255, // Alpha (opacité)
      minColorValue + random.nextInt(maxColorValue - minColorValue), // Red
      minColorValue + random.nextInt(maxColorValue - minColorValue), // Green
      minColorValue + random.nextInt(maxColorValue - minColorValue), // Blue
    );
  }