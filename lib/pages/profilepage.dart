import 'dart:convert';

import 'package:bookbyte/backend/InOut.dart' show EnterExitRoute;
import 'package:bookbyte/backend/drawer.dart';
import 'package:bookbyte/backend/my_server_config.dart';
import 'package:bookbyte/buyer/user.dart';
import 'package:bookbyte/pages/userloginpage.dart';
import 'package:bookbyte/pages/userregisterpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  final User userdata;
  const ProfilePage({Key? key, required this.userdata}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _controlleroldPassword = TextEditingController();
  final TextEditingController _controllernewPassword = TextEditingController();
  final TextEditingController _controllername = TextEditingController();
  final TextEditingController _controllerphone = TextEditingController();
  late double screenWidth, screenHeight;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "My Account",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            color: Colors.tealAccent,
            height: 1.0,
          ),
        ),
      ),
      drawer: BDrawer(
        page: 'account',
        userdata: widget.userdata,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.28,
                padding: const EdgeInsets.all(5),
                child: Card(
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: screenWidth * 0.4,
                        height: screenHeight * 0.6,
                        child: const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/main.jpg'),
                          radius: 60,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.userdata.userName.toString(),
                              style: const TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            const Divider(
                              color: Colors.blueGrey,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                widget.userdata.userEmail.toString(),
                                style: const TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text(
                                widget.userdata.userPhone.toString(),
                                style: const TextStyle(fontSize: 18),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _updateNameDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 7.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: const Text(
                      "Update Username",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _updatePhoneDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 7.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: const Text(
                      "Update Phone Number",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _showPasswordChangeDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 7.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: const Text(
                      "Update Password",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        EnterExitRoute(
                          exit: const RegisterPage(),
                          enter: const RegisterPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 7.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: const Text(
                      "New Registration",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        EnterExitRoute(
                          exit: const LoginPage(),
                          enter: const LoginPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.blue,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        vertical: 6.0,
                        horizontal: 7.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    child: const Text(
                      "Sign Out",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateNameDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          title: const Text(
            "Change Name?",
            style: TextStyle(),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _controllername,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Update",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                String newname = _controllername.text;
                _updateName(newname);
              },
            ),
            TextButton(
              child: const Text(
                "Cancel",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

 void _updateName(String newname) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm Update'),
        content: Text('Are you sure you want to update your name to $newname?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close confirmation dialog
              _confirmUpdate('name', newname); // Call _confirmUpdate with 'name' field and newname value
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close confirmation dialog
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}

  void _updatePhoneDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          title: const Text(
            "Change Phone?",
            style: TextStyle(),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _controllerphone,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter new your phone';
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Yes",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                String newphone = _controllerphone.text;
                _updatePhone(newphone);
              },
            ),
            TextButton(
              child: const Text(
                "No",
                style: TextStyle(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _updatePhone(String newphone) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Update'),
          content: Text('Are you sure you want to update your phone number to $newphone?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close confirmation dialog
                _confirmUpdate('phone', newphone); // Call _confirmUpdate with 'phone' field and newphone value
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close confirmation dialog
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showPasswordChangeDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Update Password'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _controlleroldPassword,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Old Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                TextFormField(
                  controller: _controllernewPassword,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'New Password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _updatePassword(context);
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }

  void _updatePassword(BuildContext context) {
    String oldPassword = _controlleroldPassword.text;
    String newPassword = _controllernewPassword.text;
    http.post(Uri.parse("${MyServerConfig.server}php/update_profile.php"),
        body: {
          "user_id": widget.userdata.userId,
          "old_password": oldPassword,
          "new_password": newPassword
          // ignore: duplicate_ignore
        }).then((response) {
      // Debugging: Print response body
      // ignore: avoid_print
      print("Response Body: ${response.body}");
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data['status'] == "success") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Update Success"),
            backgroundColor: Colors.green,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Failed"),
            backgroundColor: Colors.red,
          ));
        }
      }
    });
  }

  void _confirmUpdate(String field, String newValue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Update'),
          content: Text('Are you sure you want to update $field?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close confirmation dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _updateUserInfo(field, newValue);
                Navigator.of(context)
                    .pop(); // Close confirmation dialog after update
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

 void _updateUserInfo(String field, String newValue) {
  http.post(
    Uri.parse("${MyServerConfig.server}php/update_profile.php"),
    body: {
      'user_id': widget.userdata.userId.toString(),
      'newname': newValue, // Include 'newname' parameter here
      if (field == 'phone') 'newphone': newValue, // Optional: Include 'newphone' parameter for updating phone number
    },
  ).then((response) {
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      if (jsonData['status'] == 'success') {
        // Update the user data with the new information
        setState(() {
          if (field == 'name') {
            widget.userdata.userName = newValue;
          } else if (field == 'phone') {
            widget.userdata.userPhone = newValue;
          }
        });
        showSnackBar("${field.toUpperCase()} updated successfully");
      } else {
        showSnackBar(
            "Failed to update ${field.toUpperCase()}: ${jsonData['message']}");
      }
    } else {
      showSnackBar("Server error");
    }
  }).catchError((error) {
    showSnackBar("Error: $error");
  });
}

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
