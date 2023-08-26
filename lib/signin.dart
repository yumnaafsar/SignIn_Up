// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  String _emailErrorMessage = '';
  String _passErrorMessage = '';

  void updateEmailErrorMessage(String errorMessage) {
    setState(() {
      _emailErrorMessage = '';
    });
  }

  void updatePassErrorMessage(String errorMessage) {
    setState(() {
      _passErrorMessage = '';
    });
  }


  void login() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore db = FirebaseFirestore.instance;

    final String email = _emailController.text;
    final String password = _passController.text;

    try {
      final UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      
      Navigator.of(context).pushNamed(
        '/home',
      );
       ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User Authenticated!")),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "";
      String errorMessage1 = "";
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for the email';
      } else if (e.code == 'invalid-email') {
      errorMessage = 'Invalid email format';
    } else if (e.code == 'wrong-password') {
        errorMessage1 = 'Wrong password provided';
      }
      setState(() {
        _emailErrorMessage = errorMessage;
        _passErrorMessage = errorMessage1;
      });
    } catch (e) {
      print("error");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/bg3.png'),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 150.0, bottom: 30),
                    child: Column(
                      children: [
                        Text(
                          'Welcome back !',
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Righteous'),
                        ),
                        Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Righteous'),
                        ),
                      ],
                    ),
                  ),
                  // emailInput(_emailController, _emailErrorMessage),
                  emailInput(_emailController, _emailErrorMessage, updateEmailErrorMessage),
                  SizedBox(
                    height: 10,
                  ),
                  // passInput(_passController, _passErrorMessage),
                  passInput(_passController, _passErrorMessage, updatePassErrorMessage),

                   SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/reset_pass',
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Text(
                                ' Forgot password?',
                                style: TextStyle(fontSize: 15, 
                                fontWeight: FontWeight.w700
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                  
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: login,
                    child: Container(
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                      width: 250,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.pink),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '/signup',
                          );
                        },
                        child: Text(
                          ' Sign Up',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ))),
    );
  }
}

Widget emailInput(_controller, String errorMessage,Function(String) updateErrorMessage) {
  bool _showEmailError = errorMessage.isNotEmpty;
  return Padding(
    
    padding: const EdgeInsets.only(left: 25, right: 25, top: 15),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
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
            controller: _controller,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
            onChanged: (value) {
      updateErrorMessage(''); // Clear the error message
    },
            
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.pink,
              ),
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Colors.black, fontSize: 18),
              suffixIcon: _showEmailError
                  ? Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    )
                  : null,
              errorText: _showEmailError ? errorMessage : null,
              
              errorStyle: TextStyle(
                color: Colors.red, // Customize the color
                fontSize: 16,
              ),



            ),
            validator: (value) => EmailValidator.validate(value!)
                ? null
                : "Please enter a valid email",
          ),
        )
      ],
    ),
  );
}

Widget passInput(_controller, String errorMessage, Function(String) updateErrorMessage) {
  bool _showPassError = errorMessage.isNotEmpty;
  return Padding(
    padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: TextStyle(
              color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
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
            controller: _controller,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(fontSize: 18, color: Colors.black87),
            onChanged: (value) {
      updateErrorMessage(''); // Clear the error message
    },
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.pink,
              ),
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: Colors.black, fontSize: 18),
              suffixIcon: _showPassError
                  ? Icon(
                      Icons.error_outline,
                      color: Colors.red,
                    )
                  : null,
              errorText: _showPassError ? errorMessage : null,
              errorStyle: TextStyle(
                color: Colors.red, // Customize the color
                fontSize: 16, // Customize the font size
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password can not be empty';
              }
              if (value!.length < 4) {
                return 'Must be more than 4 charater';
              } else {
                return null;
              }
            },
          ),
        )
      ],
    ),
  );
}
