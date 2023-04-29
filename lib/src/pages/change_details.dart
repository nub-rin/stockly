import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../utils/user_data.dart';

class ChangeDetails extends StatefulWidget {
  const ChangeDetails({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChangeDetailsState createState() => _ChangeDetailsState();
}

class _ChangeDetailsState extends State<ChangeDetails> {

  final _userNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // set app bar color to black
        title: const Text(
          'Change Details',
          style: TextStyle(
            color: Colors.white, // set text color to white
          ),
        ),
      ),
      backgroundColor: Colors.black, // set background color to black
      body: FutureBuilder<DocumentSnapshot>(
        future: UserData().getUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.hasData && !snapshot.data!.exists) {
            return const Text("Document does not exist");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              padding: const EdgeInsets.all(16),
              child: Form(
                child: ListView(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(data['photoURL']),
                    ),
                    const SizedBox(height: 50),
                    TextFormField(
                      controller: _userNameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Change your Username, Current: ${data['name']}',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneNumberController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Change your Phone Number, Current: ${data['phoneNumber'] == '' ? 'Not Set' : data['phoneNumber']}',
                        hintStyle: TextStyle(
                          color: Colors.grey[600],
                        ),
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 5,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        UserData().updateUserData(
                          _userNameController.text,
                          _phoneNumberController.text,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Details Updated'),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Navigator.popAndPushNamed(context, '/settings');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(
                          'Save Changes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator()
            );
        },
      ),
    );
  }
}
