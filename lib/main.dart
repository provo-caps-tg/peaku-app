import 'package:flutter/material.dart';
import 'global_varibles.dart';
import 'level_one.dart'; 
import 'level_two.dart';
import 'level_three.dart';
import 'level_four.dart';
void main() {runApp(const PeakUApp());}

class PeakUApp extends StatelessWidget {
  const PeakUApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeakU',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: orange),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: orange, toolbarHeight: 3,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.black,
        child: Center(
          child: Container(
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
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Image(
                              image: AssetImage('assets/images/logo.png'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                'Relationships Elevated', 
                                style: TextStyle( 
                                  fontWeight: FontWeight.bold, 
                                  fontSize: 26, 
                                  color: blue, 
                                  fontFamily: 'Barlow'
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10, bottom: 0, left:20, right: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: blue, 
                              side: BorderSide(color: blue, width: 2),
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const LoginPage())); 
                            },
                            child: const Text('Login', style: TextStyle(fontSize: 23)),
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10, bottom: 10, left:20, right: 20),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(orange),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const AboutUs())); 
                            },
                            child: const Text('Get Started', style: TextStyle(fontSize: 23)),
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
static final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
static final GlobalKey<FormState> passKey = GlobalKey<FormState>();
final emailController = TextEditingController(text: email);
final passController = TextEditingController(text: pass);

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  
  @override
  Widget build(BuildContext context) {
    responded = false;
    responseController = TextEditingController(text: '');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: orange, foregroundColor: Colors.white, toolbarHeight: 3,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.black,
        child: Center(
          child: Container(
            //constraints: const BoxConstraints(maxWidth: 355, minWidth: 355, maxHeight: 669, minHeight: 669),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Padding(
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
                      child: SingleChildScrollView(                      
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Image(
                                    image: AssetImage('assets/images/logo.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Relationships Elevated', 
                                      style: TextStyle( 
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 26, 
                                        color: blue, 
                                        fontFamily: 'Barlow'
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            Form(key: emailKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                      child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                                      child:  Text('Email', style: TextStyle( fontWeight: FontWeight.bold, fontFamily: 'Barlow', color: blue),),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                                      child: TextFormField(
                                        controller: emailController,
                                        decoration: const InputDecoration(labelText: 'Enter your email here'),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text.';
                                          }
                                          email = value;
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Form(key: passKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                      child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                                      child:  Text('Password', style: TextStyle( fontWeight: FontWeight.bold, fontFamily: 'Barlow', color: blue),),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                                      child: TextFormField(
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        controller: passController,
                                        decoration: const InputDecoration(labelText: 'Enter your password here'),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text.';
                                          }
                                          pass = value;
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20, top: 20, right: 20, left: 20),
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child:  OutlinedButton(
                                  onPressed: () {
                                    if ((emailKey.currentState!.validate()) && (passKey.currentState!.validate())){
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(builder: (context) => const LoginPage())); //CHANGE ME, send to survey page
                                    }
                                  },
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: blue, 
                                    side: BorderSide(color: blue, width: 2),
                                    backgroundColor: Colors.white,
                                  ),
                                  child: const Text("Login", style: TextStyle(fontSize: 23)),
                                )
                              ),
                            ),
                            
                            Column(
                              children: [
                                const Text(
                                    "Don't have an account?", 
                                    style: TextStyle(
                                      fontStyle: FontStyle.italic, 
                                      fontSize: 20, 
                                      color: Color.fromARGB(255, 96, 96, 96), 
                                      fontFamily: 'Barlow'
                                    ),
                                    textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:20, right:20, top:10, bottom: 10),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child:  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (context) => const AboutUs())); 
                                      },
                                      style: ButtonStyle(
                                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                        backgroundColor: MaterialStateProperty.all<Color>(orange),
                                      ),
                                      child: const Text("Create Account", style: TextStyle(fontSize: 23)),
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),     
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: IconTheme(
                      data: const IconThemeData(
                      color: Colors.white),
                      child: IconButton(
                        onPressed:() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()), );
                            }, 
                        icon: const Icon(Icons.arrow_back)
                      ),
                    ),
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

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});
  @override
  State<AboutUs> createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {
  static final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> passKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  
  get children => null;

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: orange,foregroundColor: Colors.white,toolbarHeight: 3,
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: Colors.black,
        child: Center(
          child: Container(
            //constraints: const BoxConstraints(maxWidth: 355, minWidth: 355, maxHeight: 669, minHeight: 669),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 20),
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
                    //HERE IS THE PADDING THING I NEED
                    child: Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[ 
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Image(
                                    image: AssetImage('assets/images/logo.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20, right: 20),
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'Relationships Elevated', 
                                      style: TextStyle( 
                                        fontWeight: FontWeight.bold, 
                                        fontSize: 26, 
                                        color: blue, 
                                        fontFamily: 'Barlow'
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:0, bottom: 10),
                              child: Text("Our Mission", style: TextStyle(fontSize: 30, color: blue, fontFamily: 'Barlow')),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:10, bottom: 20, left: 16, right: 16),
                              child: Text(
                                "PeakU's Mission is to mitigate domestic, and dating violence by empowering teens and young adults to build and connect to their sense of self through educational resources, workshops, and community partnerships.",
                                style: TextStyle(fontFamily: 'Barlow',fontSize: 20, color: blue,),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:10, bottom: 10),
                              child: Text("Let's set up an account.", style: TextStyle(fontFamily: 'Barlow',fontSize: 27, color: blue)),
                            ),
                            Form(
                              key: emailKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                                      child:  Text('Email', style: TextStyle(fontFamily: 'Barlow', color: blue, fontWeight: FontWeight.bold),),
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
                                            return 'Please enter a valid email.';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Form(
                              key: passKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                                      child:  Text('Password', 
                                      style: TextStyle(fontFamily: 'Barlow', color: blue, fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                                      child: TextFormField(
                                        obscureText: true,
                                        decoration: const InputDecoration(labelText: 'Create a password here'),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {return 'Please enter a password';}
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
                                child:  TextButton(
                                  onPressed: () {
                                    if ((emailKey.currentState!.validate()) && (passKey.currentState!.validate())){
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginPage()));  //CHANGE ME, send to survey page
                                    }
                                  },
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    backgroundColor: MaterialStateProperty.all<Color>(orange),
                                  ),
                                  child: const Text("Create Account", style: TextStyle(fontSize: 23)),
                                )
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: orange,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: IconTheme(
                      data: const IconThemeData(
                      color: Colors.white),
                      child: IconButton(
                        onPressed:() {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()), );
                            }, 
                        icon: const Icon(Icons.arrow_back)
                      ),
                    ),
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