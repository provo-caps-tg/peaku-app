import 'package:flutter/material.dart';
void main() {runApp(const MyApp());}
Color orange = const Color.fromARGB(255, 232, 105, 0);
Color blue = const Color.fromARGB(255, 15, 49, 86);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeakU',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: orange, toolbarHeight: 3,
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
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      transform: Matrix4.translationValues(0.0, 100.0, 0.0),
                      child: const Image(
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    transform: Matrix4.translationValues(0.0, 60.0, 0.0),
                    child: Text('Relationships Elevated', style: TextStyle( fontWeight: FontWeight.bold, fontSize: 30, color: blue, fontFamily: 'Barlow')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:10, bottom: 0, left:20, right: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color.fromARGB(255, 15, 49, 86), 
                          side: const BorderSide(color: Color.fromARGB(255, 15, 49, 86), width: 2),
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
                          foregroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                          backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 232, 105, 0)),
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
static final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
static final GlobalKey<FormState> passKey = GlobalKey<FormState>();
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
    return Scaffold(
      
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: orange, foregroundColor: Colors.white, toolbarHeight: 3,

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
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[ 
                  const Image(
                    fit: BoxFit.scaleDown,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                  Form(key: emailKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       const Align(
                          alignment: Alignment.bottomLeft,
                            child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                            child:  Text('Email', style: TextStyle( fontWeight: FontWeight.bold, fontFamily: 'Barlow', color: Color.fromRGBO(15, 49, 86, 1)),),
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
                  Form(key: passKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                       const Align(
                          alignment: Alignment.bottomLeft,
                            child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 16.0),
                            child:  Text('Password', style: TextStyle( fontWeight: FontWeight.bold, fontFamily: 'Barlow', color: Color.fromRGBO(15, 49, 86, 1)),),
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
                          if ((emailKey.currentState!.validate()) && (passKey.currentState!.validate())){
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const DailyQuestionPage())); 
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
                    MaterialPageRoute(builder: (context) => const MyHomePage()), );
                    }, 
                icon: const Icon(Icons.arrow_back)
              ),
            ),
          ),
        ),
          ],
        ),
      )
    );
  }
}



//Daily Question Page

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: orange, foregroundColor: Colors.white, toolbarHeight: 3
      ),
      body: Container(
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
              child: const SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //Start of children
                  children: <Widget>[ 
                    const Image(
                        fit: BoxFit.scaleDown,
                        image: AssetImage('assets/images/logo.png'),
                      ),
                    const Text(
                      'Daily Question',
                      style: TextStyle(height: 0,fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Barlow', color: Color.fromRGBO(15, 49, 86, 1)),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric( vertical: 40.0, horizontal: 16,),
                      child: Text(
                        'Are you the same as you were 2 years ago?  5 years ago?  What has changed, if anything?',
                        textAlign: TextAlign.center,
                        style: TextStyle(height: 0,fontSize: 20,  fontFamily: 'Barlow', color: Color.fromRGBO(83, 83, 83, 1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Answer question here'
                        ),
                      ),
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
                    MaterialPageRoute(builder: (context) => const LoginPage()), );
                    }, 
                icon: const Icon(Icons.arrow_back)
              ),
            ),
          ),
        ),
          ],
      ),
      ),
    );
  }
}

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AboutUs createState() => _AboutUs();
}

class _AboutUs extends State<AboutUs> {
  static final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> passKey = GlobalKey<FormState>();
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: orange,foregroundColor: Colors.white,toolbarHeight: 3,
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
                    const Image(
                      fit: BoxFit.scaleDown,
                      image: AssetImage('assets/images/logo.png'),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0.0, -35.0, 0.0),
                      child: Text('Relationships Elevated', style: TextStyle(fontSize: 30, color: blue, fontFamily: 'Barlow')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:0, bottom: 10),
                      child: Text("Our Mission", style: TextStyle(fontSize: 24, color: blue, fontFamily: 'Barlow')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10, bottom: 20),
                      child: Text(
                        "PeakU's Mission is to mitigate domestic, and dating violence by empowering teens and young adults to build and connect to their sense of self through educational resources, workshops, and community partnerships.",
                         style: TextStyle(fontSize: 20, color: blue,),
                         textAlign: TextAlign.center,
                      ),
                    ),
                   Padding(
                      padding: const EdgeInsets.only(top:10, bottom: 10),
                      child: Text("Let's set up an account.", style: TextStyle(fontSize: 25, color: blue)),
                    ),
                    Form(
                      key: emailKey,
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
                        child:  ElevatedButton(
                          onPressed: () {
                            if ((emailKey.currentState!.validate()) && (passKey.currentState!.validate())){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DailyQuestionPage())); 
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
        ),
      )
    );
  }
}