import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeakU',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 250, 125, 0)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hello',),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(29)),),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'bruh'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10, bottom: 10, left:20, right: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 232, 105, 0)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginPage())); 
                        },
                        child: const Text('Get Started'),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final emailController = TextEditingController();
final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    final _emailKey = GlobalKey<FormState>();
    final _passKey = GlobalKey<FormState>();
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Container(
        //background
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          //White exterior box
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(29))
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[ 
                  const Image(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  Form(key: _emailKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       const Align(
                          alignment: Alignment.bottomLeft,
                            child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                            child:  Text('Email', style: TextStyle(fontFamily: 'Barlow', color: Color.fromRGBO(15, 49, 86, 1)),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: 'Enter your email here'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                         ),
                        ],
                      ),
                    ),
                  Form(key: _passKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       const Align(
                          alignment: Alignment.bottomLeft,
                            child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                            child:  Text('Password', style: TextStyle(fontFamily: 'Barlow', color: Color.fromRGBO(15, 49, 86, 1)),),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(labelText: 'Enter your password here'),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text.';
                                  }
                                  return null;
                                },
                              ),
                            ),
                         ),
                        ],
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child:  ElevatedButton(
                        onPressed: () {
                          
                          if ((_emailKey.currentState!.validate()) && (_passKey.currentState!.validate())){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DailyQuestionPage())); 
                          }
                          else {
                            
                          }
                          
                              },
                        style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 232, 105, 0)),
                                ),
                        child: const Text("Login"),
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}





class DailyQuestionPage extends StatefulWidget {
  const DailyQuestionPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DailyQuestionPage createState() => _DailyQuestionPage();
}

class _DailyQuestionPage extends State<DailyQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(29))
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //Start of children
              children: <Widget>[ 
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}