import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  var myFormKey = GlobalKey<FormState>();
  var password = TextEditingController();
  var confirmPassword = TextEditingController();
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Form(
          key: myFormKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (msg) {
                    if (msg!.isEmpty) {
                      return 'Please Enter Name';
                    }
                    if (msg.length < 3) {
                      return "Name is less than 3 character";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Enter Your Name",
                      labelStyle: const TextStyle(fontSize: 16),
                      hintStyle: const TextStyle(fontSize: 18),
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.cyan)),
                      prefixIcon: const Icon(
                        Icons.account_circle,
                        color: Colors.cyan,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  validator: (msg) {
                    if (msg!.isEmpty) {
                      return 'please enter your number';
                    }
                    if (msg.length != 10) {
                      return 'please enter valid number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(fontSize: 16),
                      hintStyle: const TextStyle(fontSize: 18),
                      hintText: "Enter Your Number",
                      labelText: "Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.cyan)),
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.cyan,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (msg) {
                    if (msg!.isEmpty) {
                      return 'please enter your password';
                    }
                    if (msg.length < 8) {
                      return 'password must be 8 character';
                    }
                    return null;
                  },
                  controller: password,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    labelStyle: const TextStyle(fontSize: 16),
                    hintStyle: const TextStyle(fontSize: 18),
                    hintText: "Enter Your Password",
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.cyan)),
                    prefixIcon: const Icon(
                      Icons.admin_panel_settings_sharp,
                      color: Colors.cyan,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      icon: Icon(
                        passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.cyan,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (msg) {
                    if (msg != password.value.text) {
                      return 'please enter same password';
                    }
                    return null;
                  },
                  controller: confirmPassword,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(fontSize: 16),
                      hintStyle: const TextStyle(fontSize: 18),
                      hintText: "Enter Your confirm Password",
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.cyan)),
                      prefixIcon: const Icon(
                        Icons.admin_panel_settings_sharp,
                        color: Colors.cyan,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyan,
        onPressed: () {
          myFormKey.currentState?.validate();
        },
        child: const Icon(
          Icons.done,
          color: Colors.black87,
        ),
      ),
    );
  }
}
