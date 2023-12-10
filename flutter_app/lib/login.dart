
import 'package:flutter_app/textFormField.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/doctor.dart';
import 'package:flutter_app/student.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MaterialApp(
  home: Test(),
));

class Test extends StatefulWidget {

  Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}
//
// bool validateuser(List<Map<String, String>> test, String mail, String password) {
//   for (var user in test) {
//     if (user['mail'] == mail && user['pass'] == password) {
//       return true;
//     }
//   }
//   return false;
// }
//
class _TestState extends State<Test> {
  bool isLoading = false;
  GlobalKey<FormState> formstate = GlobalKey();
  Function(String)? onChanged;
  String? email, password;


//   List<Map<String, String>> users = [
//     {'mail': 'kamal@gmail.com', 'pass': '12345'},
//     {'mail': 'admin@gmail.com', 'pass': '12345'},
//     {'mail': 'admin', 'pass': 'admin1'},
//     {'mail': 'admin2', 'pass': 'admin2'}
//   ];
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
//   GlobalKey<FormState> secondkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return
      ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: Color(0xff2B475E),
          body: Container(
            margin: EdgeInsets.all(25),
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      child: Column(
                        children: [
                          Image(image: AssetImage('image/scholar.png')),
                          Text(
                            'GET',
                            style: TextStyle(
                              fontFamily: 'Pacifico',
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 100)),
                    Form(
                      key: formstate,
                      child: Column(
                        children: [
                          textFormField(
                            onChanged: (data){
                              email=data;
                            },
                            labelText: 'username',
                            hintText: 'username',
                          ),
                          // TextFormField(
                          //
                          //   onChanged: (value) {
                          //     email = value;
                          //   },
                          //   // controller: emailController,
                          //   validator: (value) {
                          //     if (value!.isEmpty) return 'Required';
                          //     // if (!validateuser(
                          //     //     users, emailController.text, passwordController.text))
                          //     return 'Check Email';
                          //   },
                          //   decoration: InputDecoration(
                          //       labelText: 'Username',
                          //       hintText: 'Username',
                          //       border: OutlineInputBorder(
                          //           borderRadius: BorderRadius.circular(20))),
                          // ),
                          SizedBox(
                            height: 20,
                          ),
                          // TextFormField(
                          //     onChanged: (value) {
                          //       password = value;
                          //
                          //     },
                          //     // controller: passwordController,
                          //     obscureText: true,
                          //     validator: (value) {
                          //       if (value!.isEmpty) return 'Required';
                          //       // if (!validateuser(
                          //       //     users, emailController.text, passwordController.text))
                          //       return 'Check password';
                          //     },
                          //     decoration: InputDecoration(
                          //         labelText: 'Password',
                          //         hintText: 'Password',
                          //         border: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(
                          //                 20)))),
                          textFormField(
                            onChanged: (data){
                              password=data;
                            },
                            labelText: 'password',
                            hintText: 'password',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MaterialButton(
                            color: Colors.white,
                            onPressed: () async {
                              if (formstate.currentState!.validate()) {
                                // print('Siiiiu');
                                isLoading = true;
                                setState(() {

                                });
                                try {
                                  UserCredential userCredential = await FirebaseAuth
                                      .instance.signInWithEmailAndPassword(
                                      email: email!,
                                      password: password!

                                  );
                                   // showDialog(
                                   //    context: context,
                                   //    builder: (context) {
                                   //      return AlertDialog(
                                   //        title: Text('SIIIIIU'),
                                   //        content: Text('انا المشطشط'),
                                   //        actions: [
                                   //          TextButton(
                                   //              onPressed: () {
                                   //                // Navigate to the MyApp page
                                   //                Navigator.push(
                                   //                  context,
                                   //                  MaterialPageRoute(
                                   //                    builder: (context) =>
                                   //                        HomePage(),
                                   //                  ),
                                   //                );
                                   //              },
                                   //              child: Text('Ok'))
                                   //        ],
                                   //      );
                                   //    });
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) =>  HomePage()),
                                  // );
                                  route();
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == 'user-not-found') {
                                    print('No user found for that email.');
                                  } else if (e.code == 'wrong-password') {
                                    print(
                                        'Wrong password provided for that user.');
                                  }
                                }
                                isLoading= false;
                                setState(() {

                                });
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

        ),
      );

  }
  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var kk = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('rool') == "student") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  HomePage(),
            ),
          );
        }else{
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>  MyHomePage(),
            ),
          );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }


}
