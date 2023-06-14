// import 'package:flutter/material.dart';
// import 'package:fit_ex/model/User.dart';
// import 'package:fit_ex/controller/profile-controller.dart';
//
// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   _ProfilePageState createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   final ProfileController _profileController = ProfileController();
//
//   Users? _currentUserData;
//
//   @override
//   void initState() {
//     super.initState();
//     _getCurrentUserData();
//   }
//
//   _getCurrentUserData() async {
//     final data = await _profileController.getCurrentUser();
//     setState(() {
//       _currentUserData = data;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//       ),
//       body: Center(
//         child: _currentUserData == null
//             ? CircularProgressIndicator()
//             : Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Username: ${_currentUserData!.username}',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Weight: ${_currentUserData!.weight} kg',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Height: ${_currentUserData!.height} cm',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Weight goal: ${_currentUserData!.weightGoal} kg',
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:fit_ex/model/User.dart';
import 'package:fit_ex/controller/profile-controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileController _profileController = ProfileController();

  Users? _currentUserData;

  @override
  void initState() {
    super.initState();
    _getCurrentUserData();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: _currentUserData == null
            ? CircularProgressIndicator()
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Username: ${_currentUserData!.username}',
              style: TextStyle(fontSize: 24),
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
                    fontSize: 20, decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () => _updateWeightGoal(context),
              child: Text(
                'Weight goal: ${_currentUserData!.weightGoal} kg',
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
