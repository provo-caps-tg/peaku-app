import 'package:flutter/material.dart';
void main() {runApp(const PeakUApp());}
String userResponse = '';
Color blue = const Color.fromARGB(255, 15, 49, 86);
Color orange = const Color.fromARGB(255, 232, 105, 0);
final responseController = TextEditingController(text: userResponse);

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
                      Container(
                        transform: Matrix4.translationValues(0.0, -35.0, 0.0),
                        child: Text(
                          'Relationships Elevated', 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: blue, fontFamily: 'Barlow'),
                          textAlign: TextAlign.center,),
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
                          child:  OutlinedButton(
                            onPressed: () {
                              if ((emailKey.currentState!.validate()) && (passKey.currentState!.validate())){
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(builder: (context) => const DailyQuestionPage())); 
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
                      Container(
                        transform: Matrix4.translationValues(0.0, 30, 0.0),
                        child: const Text(
                          "Don't have an account?", 
                          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20, color: Color.fromARGB(255, 96, 96, 96), fontFamily: 'Barlow'),
                          textAlign: TextAlign.center,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20, right:20, top:40),
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
      )
    );
  }
}

class DailyQuestionPage extends StatefulWidget {
  const DailyQuestionPage({super.key});
  @override
  State<DailyQuestionPage> createState() => _DailyQuestionPage();
}

class _DailyQuestionPage extends State<DailyQuestionPage> {
  bool enabled = true;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> switchColor = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return orange;
        }
        else {
          return blue;
        }
      },
    );
    final MaterialStateProperty<Color?> whiteSwitch = MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        }
        if (states.contains(MaterialState.disabled)) {
          return blue;
        }
        return null;
      },
    );
    final MaterialStateProperty<Icon?> thumbIcon = MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check, color: Colors.white);
        }
        return const Icon(Icons.close, color: Colors.white);
      },
    );

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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Start of children
                      children: <Widget>[ 
                        const Image(
                          fit: BoxFit.scaleDown,
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0.0, -35.0, 0.0),
                          child: const Text(
                            'Daily Question',
                            style: TextStyle(height: 0,fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Barlow', color: Color.fromRGBO(15, 49, 86, 1)),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top:00, bottom: 30, left: 16, right: 16),
                          child: Text(
                            'Are you the same as you were 2 years ago?  5 years ago?  What has changed, if anything?',
                            textAlign: TextAlign.center,
                            style: TextStyle(height: 0,fontSize: 20,  fontFamily: 'Barlow', color: Color.fromRGBO(83, 83, 83, 1)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          child: TextFormField(
                            maxLines: 5,
                            minLines: 1,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Answer question here'
                            ),
                            controller: responseController,
                            onChanged:(value){
                              setState(() {
                                userResponse = responseController.text;
                              });
                            }
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              surfaceTintColor: MaterialStateProperty.all<Color>(Colors.white),
                              iconColor: MaterialStateProperty.all<Color>(Colors.white),
                              shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              overlayColor: MaterialStateProperty.all<Color>(Colors.white),
                            ),
                            onPressed: () {
                              setState(() {
                                userResponse = '';
                              });
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const ResponsePage()));},
                            child: const Text("Skip", style: TextStyle(height: 00,fontSize: 17,  fontFamily: 'Barlow', color: Color.fromRGBO(83, 83, 83, 1)))
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right:20, bottom: 12),
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: blue,
                                width: 2,
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Row(
                                children: [
                                 const Padding(
                                    padding: EdgeInsets.only(right: 10, left: 5, top: 0),
                                    child: Text(
                                    'Share with others:',
                                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontFamily: 'Barlow', color: Color.fromRGBO(15, 49, 86, 1)),
                                    ),
                                  ),
                                  Switch(
                                    focusColor: Colors.white,
                                    inactiveThumbColor: blue,
                                    inactiveTrackColor: Colors.white,
                                    trackOutlineColor: switchColor,
                                    trackColor: whiteSwitch,
                                    value: enabled,
                                    thumbIcon: thumbIcon,
                                    overlayColor: switchColor,
                                    activeColor: orange,
                                    onChanged: (bool value) {
                                      setState(() {
                                        enabled = value;
                                        if(enabled==false){
                                          userResponse = '';
                                        } 
                                        else if(enabled==true){
                                          userResponse = responseController.text;
                                        } 
                                      });
                                    }
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ), 
                        Padding(
                          padding: const EdgeInsets.only(left:20, right:20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child:  ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage())); 
                              },
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(orange),
                              ),
                              child: const Text("Submit", style: TextStyle(fontSize: 23)),
                            )
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
                        const Image(
                          fit: BoxFit.scaleDown,
                          image: AssetImage('assets/images/logo.png'),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0.0, -35.0, 0.0),
                          child: Text('Relationships Elevated', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: blue, fontFamily: 'Barlow')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:0, bottom: 10),
                          child: Text("Our Mission", style: TextStyle(fontSize: 30, color: blue, fontFamily: 'Barlow')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:10, bottom: 20, left: 16, right: 16),
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
                                    MaterialPageRoute(builder: (context) => const DailyQuestionPage())); 
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
      )
    );
  }
}

class ResponsePage extends StatefulWidget {
  const ResponsePage({super.key});
  @override
  State<ResponsePage> createState() => _ResponsePage();
}

class _ResponsePage extends State<ResponsePage> {
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
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //Start of children
                      children: <Widget>[ 
                        Text(userResponse)
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
                      setState(() {
                        userResponse = responseController.text;
                      });
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const DailyQuestionPage()),);
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