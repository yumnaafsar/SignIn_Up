import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordResetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Password Reset", style: TextStyle(fontSize: 30),))),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: PasswordResetForm()),
    );
  }
}

class PasswordResetForm extends StatefulWidget {
  @override
  _PasswordResetFormState createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        SizedBox(height: 50,),
        Container(
          width: 350,
          height: 350,
          child: Image.asset('assets/reset1.png'),
        ),
      
      SizedBox(height: 30,),
      Text('Provide Registered Email', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),  
        
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 149, 175, 219),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(255, 17, 131, 26),
                    blurRadius: 5.0,
                    offset: Offset(0, 5)),
                BoxShadow(
                    color: Color.fromARGB(255, 52, 132, 179),
                    blurRadius: 5.0,
                    offset: Offset(-5, 5))
              ],
            ),
            height: 60,
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18,
              ),
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.pink,
                ),
        
              ),
              
            ),
          ),
      ),

        SizedBox(height: 30,),
        
        GestureDetector(
                    onTap:  _resetPassword,
                    child: Container(
                      child: Center(
                          child: Text(
                        'Send Reset Email',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      width: 250,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.blue),
                    ),
                  ),
      ],
    );
  }

  void _resetPassword() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    String email = _emailController.text;

    try {
      await _auth.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password reset email sent!")),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send reset email")),
      );
    }
  }
}
