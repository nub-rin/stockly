import 'dart:io';
import 'package:flutter/material.dart';

class ChangeDetailsPage extends StatefulWidget {
  @override
  _ChangeDetailsPageState createState() => _ChangeDetailsPageState();
}

class _ChangeDetailsPageState extends State<ChangeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // set app bar color to black
        title: Text(
          'Change Details',
          style: TextStyle(
            color: Colors.white, // set text color to white
          ),
        ),
      ),
      backgroundColor: Colors.black, // set background color to black
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          child: ListView(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    NetworkImage('https://via.placeholder.com/150'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text('Change Image'),
                
              ),
              SizedBox(height: 50),
              TextFormField(
                style: TextStyle(color: Colors.white),
                // initialValue: _username,
                decoration: InputDecoration(
                  // labelText: 'Username',
                  hintText: 'Enter your Phone Number',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                ),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter a username';
                //   }
                //   return null;
                // },
                // onSaved: (value) {
                //   setState(() {
                //     _username = value;
                //   });
                // },
              ),
              SizedBox(height: 20),
              TextFormField(
                style: TextStyle(color: Colors.white),
                // initialValue: _phoneNumber,
                decoration: InputDecoration(
                  hintText: 'Enter your Phone Number',
                  hintStyle: TextStyle(
                    color: Colors.grey[600],
                  ),
                  fillColor: Colors.grey,
                  // labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter a phone number';
                //   }
                //   return null;
                // },
                // onSaved: (value) {
                //   setState(() {
                //     _phoneNumber = value;
                //   });
                // },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState.validate()) {
                  //   _formKey.currentState.save();
                  //   // TODO: implement save changes logic
                  //   Navigator.pop(context);
                  // }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Padding(
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
      ),
    );
  }
}
