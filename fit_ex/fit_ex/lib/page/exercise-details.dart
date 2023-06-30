import 'package:flutter/material.dart';
import 'package:fit_ex/model/Exercise.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final Exercise exercise;

  ExerciseDetailsScreen(this.exercise);

  @override
  Widget build(BuildContext context) {
    final headlineStyle = Theme.of(context).textTheme.headline5;

    return Scaffold(
      appBar: AppBar(
        title: Text('FitEx'),
      ),
      body: SafeArea(
        child: Container(
          color: Color.fromRGBO(95, 95, 95, 1), // Set the background color to a dark shade of grey
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                '${exercise.name}',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  exercise.image,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Instructions',
                style: headlineStyle?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ) ??
                    TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              SizedBox(height: 12),
              Text(
                '${exercise.description}',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 24),
              Text(
                'Focus Area: ${exercise.category}',
                style: headlineStyle?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ) ??
                    TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
              ),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
