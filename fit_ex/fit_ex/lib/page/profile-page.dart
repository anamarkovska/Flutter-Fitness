import 'package:flutter/material.dart';
import 'package:fit_ex/model/User.dart';
import 'package:fit_ex/controller/profile-controller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController _profileController = ProfileController();

  Users? _currentUserData;
  double _distanceCovered = 0.0;

  @override
  void initState() {
    super.initState();
    _getCurrentUserData();
    _calculateDistanceCovered();
  }

  _getCurrentUserData() async {
    final data = await _profileController.getCurrentUser();
    setState(() {
      _currentUserData = data;
    });
  }

  Future<void> _updateWeight(BuildContext context) async {
    final TextEditingController controller =
    TextEditingController(text: _currentUserData!.weight.toString());
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Weight'),
          content: TextFormField(
            controller: controller,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('SAVE'),
              onPressed: () async {
                final newWeight = int.parse(controller.text);
                await _profileController.updateUserWeight(
                    _currentUserData!, newWeight);
                Navigator.of(context).pop();
                _getCurrentUserData();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateWeightGoal(BuildContext context) async {
    final TextEditingController controller = TextEditingController(
        text: _currentUserData!.weightGoal.toString());
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Weight Goal'),
          content: TextFormField(
            style: TextStyle(color: Colors.black),
            controller: controller,
            keyboardType: TextInputType.number,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('CANCEL'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('SAVE'),
              onPressed: () async {
                final newWeightGoal = int.parse(controller.text);
                await _profileController.updateUserWeightGoal(
                    _currentUserData!, newWeightGoal);
                Navigator.of(context).pop();
                _getCurrentUserData();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _calculateDistanceCovered() async {
    final currentPosition = await Geolocator.getCurrentPosition();
    final previousPosition = await _getLastKnownPosition();

    if (previousPosition != null) {
      final distance = Distance().as(
        LengthUnit.Kilometer,
        LatLng(previousPosition.latitude, previousPosition.longitude),
        LatLng(currentPosition.latitude, currentPosition.longitude),
      );
      setState(() {
        _distanceCovered = distance;
      });
    }
  }

  Future<Position?> _getLastKnownPosition() async {
    final position = await Geolocator.getLastKnownPosition();

    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Card(
          color: Colors.grey,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Text(
                  'Username: ${_currentUserData!.username}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  'Height: ${_currentUserData!.height} cm',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: () => _updateWeight(context),
                  child: Text(
                    'Weight: ${_currentUserData!.weight} kg',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                InkWell(
                  onTap: () => _updateWeightGoal(context),
                  child: Text(
                    'Weight goal: ${_currentUserData!.weightGoal} kg',
                    style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  'Distance Covered: $_distanceCovered km',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}