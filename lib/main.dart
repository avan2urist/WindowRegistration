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
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => const NewWindow (),
        '/todo': (context) => const WindowRegistrtion(),
        '/tolist': (context) => const ViewWatchesState(),
        '/listProduct':(context)=> const ViewWatchesState(),
        
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
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pushNamedAndRemoveUntil(
              context, '/', (route) => false);
            },
            icon: const Icon(Icons.auto_awesome_sharp),
          ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 600,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.purple, Colors.blue, Colors.green],
                        ),
                      ),
                child: Padding(
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
                        height: 250,
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
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                              ),
                              
                              
                              const Padding(
                                padding: EdgeInsets.only(top: 20),
                              ),
                              ElevatedButton(
                              style: ButtonStyle(
                                minimumSize: MaterialStateProperty.all<Size>(
                                  const Size(double.infinity, 50),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.pink),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/listProduct', (route) => false);
                              },
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
