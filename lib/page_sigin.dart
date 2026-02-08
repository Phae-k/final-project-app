import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/account/board.dart';
//import 'package:final_project/account/board.dart';
//import 'package:final_project/account/home.dart';
//import 'package:final_project/account/home.dart';
//import 'package:final_project/another/more_page.dart';
import 'package:flutter/material.dart';
import 'package:final_project/page_signup.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key, required this.title});
  final String title;
  

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  
  TextEditingController controller_username = TextEditingController();
  TextEditingController controller_password = TextEditingController();

  bool is_password_visible = true;

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Spacer(),
            Row(
              children: [
                Spacer(),

                Text("Username: "),
                SizedBox(
                  width: 240,
                  child: TextField(controller: controller_username),
                ),
                SizedBox(width: 46),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),

                Text("Password: "),

                SizedBox(
                  width: 240,
                  child: TextField(
                    obscureText: is_password_visible,
                    controller: controller_password,
                  ),
                ),
                IconButton(
                    onPressed: () => setState(() => is_password_visible = !is_password_visible),
                    icon: Icon(is_password_visible ? Icons.visibility_off : Icons.visibility)),
                Spacer(),
              ],
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () async {

                      String username = controller_username.text;
                      String password = controller_password.text;
                      await db.collection("collection_credential")
                          .where("username", isEqualTo: username)
                          .where("password", isEqualTo: password)
                          .get()
                          .then((q) {

                        if (q.docs.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Sign In failed.")),
                          );

                        } else {
                           Navigator.of(context).push(
                           MaterialPageRoute(builder: (context) => DashboardView(title: "")),
                      );
                        }
                      });
                    },
                    child: const Text("Sign In")),
                SizedBox(width: 20),
                
                OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SignupPage(title: "Teacher Account")),
                      );
                    },
                    child: Text("Sign UP")),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}