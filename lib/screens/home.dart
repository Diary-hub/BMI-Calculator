import 'package:flutter/material.dart';
import 'package:flutterapp/Components/custom_appbar.dart';
import 'package:flutterapp/Components/custom_field.dart';
import 'package:flutterapp/Components/simple_button.dart';
import 'package:flutterapp/screens/gender_select.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar('Login Form'),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            const SizedBox(
              height: 100,
            ),
            const Image(
              image: NetworkImage(
                  "https://cdn-icons-png.flaticon.com/512/4349/4349072.png"),
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
                child: Column(
              children: [
                CustomField(
                  obscureText: false,
                  controller: usernameController,
                  icon: const Icon(Icons.person),
                  label: "Username",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomField(
                  obscureText: true,
                  controller: passwordController,
                  icon: const Icon(Icons.lock),
                  label: "Password",
                ),
                const SizedBox(
                  height: 10,
                ),
                SimpleButton(
                  onPressed: () {
                    String userName = usernameController.text;
                    String password = passwordController.text;
                    print(userName + password);
                    if (userName == "diary" && password == "1234") {
                      print('Successfully log in ');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GenderSelector(),
                        ),
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              'Authintication Faild',
                            ),
                            content: Text(
                                'Sorry, Your Email or Password Are Inccorect.'),
                          );
                        },
                      );
                      usernameController.text = '';
                      passwordController.text = '';
                    }
                  },
                  text: 'Login',
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
