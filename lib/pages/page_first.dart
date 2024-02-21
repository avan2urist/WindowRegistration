import 'package:flutter/material.dart';

class NewWindow extends StatefulWidget {
  const NewWindow({super.key});

  @override
  State<NewWindow> createState() => _NewWindowState();
}

class _NewWindowState extends State<NewWindow> {
  List<String> genders = ['Male', 'Female'];
  String? selectedGender = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.6),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
              context, '/todo', (route) => false);
            },
            icon: const Icon(Icons.auto_awesome_sharp),
          ),
        ],
        backgroundColor: Colors.tealAccent,
        title: const Text('Sign up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registration',
              style: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.teal.withOpacity(0.4),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 15),
            ),
            Container(
              width: 380,
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.tealAccent,
              ),
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Login"),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Enter password again"),
                      obscureText: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 25),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ToggleButtons(
                          isSelected: genders
                              .map((gender) => gender == selectedGender)
                              .toList(),
                          onPressed: (int index) {
                            setState(() {
                              selectedGender = genders[index];
                            });
                          },
                          children:
                              genders.map((gender) => Text(gender)).toList(),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 28),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 50),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pushNamedAndRemoveUntil(
                          context, '/listProduct', (route) => false);
                        },
                        child: const Text('Sign up'))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
