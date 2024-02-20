import 'package:flutter/material.dart';
import 'package:test_one/pages/listview.dart';
import 'package:test_one/pages/page_first.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const WindowRegistrtion(),
        '/todo': (context) => const NewWindow(),
        '/tolist': (context) => const ViewWatchesState(),
      },
    );
  }
}

class WindowRegistrtion extends StatefulWidget {
  const WindowRegistrtion({super.key});

  @override
  State<WindowRegistrtion> createState() => _WindowRegistrtionState();
}

class _WindowRegistrtionState extends State<WindowRegistrtion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.withOpacity(0.6),
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: const Text('Sign in'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Authorize',
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
              height: 300,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.tealAccent,
              ),
              padding: const EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                    const Padding(
                      padding: EdgeInsets.only(top: 42),
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
                            context, '/todo', (route) => false);
                      },
                      child: const Text('Sign in'),
                    ),
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
