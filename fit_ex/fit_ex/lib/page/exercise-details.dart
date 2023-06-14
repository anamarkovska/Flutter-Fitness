import 'package:flutter/material.dart';
import 'package:fit_ex/model/Exercise.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final Exercise exercise;

  ExerciseDetailsScreen(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FitEx'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                '${exercise.name}',
                style: TextStyle(fontSize: 30.0, backgroundColor: Color.alphaBlend(Colors.black, Colors.black)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30, // <-- SEE HERE
              ),
              Image.asset(
                exercise.image,
                height: 200.0,
                fit: BoxFit.fill,
              ),

              Padding(padding: EdgeInsets.all(16.0), child:
              Text(
                'Instructions: ',
                style: Theme.of(context).textTheme.headline5,
              ),),
              Text(
                '${exercise.description}',
                style: Theme.of(context).textTheme.headline6,

              ),
              SizedBox(
                height: 30, // <-- SEE HERE
              ),
              Padding(padding: EdgeInsets.all(16.0), child:
              Text(
                'Focus area: ${exercise.category}',
                style: Theme.of(context).textTheme.headline5,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}