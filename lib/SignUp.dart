import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'RealTimeDataBase/Post.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _loginState();
}

class _loginState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp', style:
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      
      body:

      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                ),
                validator: (value) {


                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }

                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }else{
                    return null;
                  }

                },
                keyboardType: TextInputType.emailAddress,



              ),




              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),

                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                ),
                obscureText: _obscurePassword,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.0),

              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: 'Confirm your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                ),
                validator: (value) {


                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }

                  if (value.length < 5) {
                    return 'Password should be at least 7 characters long';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },

              ),





              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    try {
                      // Attempt to create a new user
                      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );

                      // Show success message
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Account created successfully')),
                      );
                      // Optionally, navigate to another screen or reset the form
                      // Navigator.pop(context); // Go back to the previous screen or handle navigation
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'email-already-in-use') {
                        // Show error message for email already in use
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Account already exists. Try another email.')),
                        );
                      } else {
                        // Show generic error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to create account. Please try again.')),
                        );
                      }
                    } catch (e) {
                      // Handle other exceptions

                    }
                  }
                },
                child: Text('SignUp'),
              ),
              SizedBox(height: 10),

              TextButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginForm()));

              }, child: Text('Login')),

              


            ],
          ),
        ),
      ),





    );

  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  FirebaseAuth _auth = FirebaseAuth.instance;


  void login(){
    _auth.signInWithEmailAndPassword(email: _emailController.text.toString(), password: _passwordController.text.toString()).then((value) {
    });

  }


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(title: Text('Login Form'),

        backgroundColor: Colors.blue,

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }

                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }else{
                    return null;
                  }

                },
                keyboardType: TextInputType.emailAddress,

              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),

                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                ),
                obscureText: _obscurePassword,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                },
                keyboardType: TextInputType.emailAddress,
              ),


              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailController.text,
                        password: _passwordController.text,
                      );
                      // If login is successful, navigate to the next screen
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Post()));
                    } catch (e) {
                      String errorMessage = 'Please enter correct email and password.';
                      if (e is FirebaseAuthException) {
                        if (e.code == 'user-not-found') {
                          errorMessage = 'No user found for that email.';
                        } else if (e.code == 'wrong-password') {
                          errorMessage = 'Wrong password provided.';
                        }
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(errorMessage)),
                      );
                    }
                  }
                },
                child: Text('Login'),
              ),

              SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  // Perform other login action

                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                },
                child: Text('Create an Account'),
              )],
          ),
        ),
      ),
    );
  }

}










