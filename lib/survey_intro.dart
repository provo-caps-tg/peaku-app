import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_survey/flutter_survey.dart';
import 'global_varibles.dart';
import 'main.dart';
List<QuestionResult> _surveyResults = [];
bool buttonVisibility = true;

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});
  @override
  State<SurveyPage> createState() => _SurveyPageState();}

class _SurveyPageState extends State<SurveyPage> {
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  
  final List<Question> _initialData = [

    Question(
      isMandatory: true,
      question: "ENTRANT CODE: \n\n(First two initials first name + First two initials last name + Last 2 digits from phone number; eg. GISM05)",
    ),
    Question(
      isMandatory: true,
      question: "Please choose one of the following two options:",
      answerChoices: const {
        "I have read the information provided in the instructions and above, and I consent to participate.": null,
        "I do not consent to participate": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "I have experienced frustration in the past week about communicating my needs",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "I understand my needs in a romantic relationship",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "I understand my needs with my family",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "I clearly express my needs in my relationship with my family",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "I express myself confidently in relationships",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "In close relationships I speak without fear of being misunderstood.",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "I feel confident in being able to identify a healthy relationship",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "I have a clear vision of my future over the next 5 years",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "I have a trusted adult who understands my values",
      answerChoices: const {
        "Strongly Agree": null,
        "Agree": null,
        "Neutral": null,
        "Disagree": null,
        "Strongly Disagree": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "Age Range",
      answerChoices: const {
        "14-19": null,
        "20-25": null,
        "26-35": null,
        "35+": null,
        "Prefer not to say": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "Ethnicity\n\nWith which race(s)/ethnicit(ies) do you identify (choose all that apply)?",
      answerChoices: {
        "Asian or Pacific Islander": null,
        "Native American or Native Alaskan": null,
        "Black / African-American": null,
        "Latino / Hispanic": null,
        "Middle Eastern": null,
        "White / Caucasian": null,
        "Other": [
          Question(
            isMandatory: true,
            question: "Please Specify:",
          ),
        ],
        "Prefer not to say": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "Gender (Select those that apply)",
      answerChoices: const {
        "Male": null,
        "Female": null,
        "Non-Binary": null,
        "Unsure": null,
        "Other": null,
        "Prefer not to say": null,
      }
    ),
    Question(
      isMandatory: true,
      question: "Primary Language Spoken",
      answerChoices: const {
        "Spanish": null,
        "English": null,
        "French": null,
        "Arabic": null,
        "Tagalog": null,
        "Tongan": null,
        "Italian": null,
        "Pashtu": null,
        "Other": null,
      }
    ),
  ];
  @override
  Widget build(BuildContext context) {
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
                          //Start of widgets//
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:35, left: 40, right: 40, bottom: 20),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "Let's start with\n a quick survey.", 
                                  style: TextStyle( 
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 70, 
                                    color: blue, 
                                    fontFamily: 'Barlow'
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:0, left: 40, right: 40, bottom: 00),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "*PeakU uses this data to measure and improve the impact of our\n curriculum and may be used to publish a study of our methodology.", 
                                  textAlign: TextAlign.center,
                                  style: TextStyle( 
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 50, 
                                    color: blue, 
                                    fontFamily: 'Barlow'
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:5, left: 40, right: 40, bottom: 30),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  "This information is collected anonymously and is not resold.", 
                                  textAlign: TextAlign.center,
                                  style: TextStyle( 
                                    fontWeight: FontWeight.bold, 
                                    fontSize: 50, 
                                    color: blue, 
                                    fontFamily: 'Barlow'
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 10),
                              child: SizedBox(
                                width: double.infinity,
                                height: double.infinity,   //TODO: Fix Height                             
                                child: Form(
                                  key: _formKey,
                                  child: Survey(
                                    onNext: (surveyResults) {
                                      _surveyResults = surveyResults;
                                      print(surveyResults);
                                    },
                                    initialData: _initialData,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:10, left: 40, right: 40, bottom: 30),
                              child: SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                      backgroundColor: MaterialStateProperty.all<Color>(orange),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const IntroPage())); 
                                    }
                                    },
                                    child: const Text('Submit & Continue', style: TextStyle(fontSize: 23)),
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

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  @override
  State<IntroPage> createState() => _IntroPageState();}

class _IntroPageState extends State<IntroPage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;            
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    const delay = Duration(seconds: 5);
    controller = AnimationController(duration: const Duration(milliseconds: 500) + delay, vsync: this);
    final Animation<double> curve = CurvedAnimation(parent: controller, curve: Curves.easeInExpo);
    animation = Tween<double>(begin: 0, end: 100).animate(curve);
    animation.addListener(() {
    setState(() {
      //You can change stuff here, but we don't need to
      });
    });
  Timer timer = Timer(const Duration(seconds: 5), () {
    if (mounted) {
        controller.forward();
      }
    });
  }
  

  @override
  Widget build(BuildContext context) {
    
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
                      child: Column(
                        //Start of widgets//
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Overview of Curriculum",
                                style: TextStyle(fontSize: 25, fontFamily: 'Barlow', color: blue, fontWeight: FontWeight.bold)
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(242, 225, 227, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: const Column(
                                      children: [
                                        Align(
                                        alignment: Alignment.topCenter,
                                        child: Text("level 1", style: TextStyle(fontSize: 25, fontFamily: 'Barlow', fontWeight: FontWeight.bold)),
                                        ),
                                        Align(
                                        alignment: Alignment.topCenter,
                                        child: 
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Blabhabla bhlablahblahblabha lhb laolfdsofdsaljd lkfajk alkaasjlkwsafjlk  dwsahdsakjhksajhskjf  ahlkfdsj",
                                              style: TextStyle(fontSize: 15, fontFamily: 'Barlow'),
                                            ),
                                          )
                                        ),
                                      ]
                                    )
                                  )
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(242, 225, 227, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: const Column(
                                      children: [
                                        Align(
                                        alignment: Alignment.topCenter,
                                        child: Text("level 2", style: TextStyle(fontSize: 25, fontFamily: 'Barlow', fontWeight: FontWeight.bold)),
                                        ),
                                        Align(
                                        alignment: Alignment.topCenter,
                                        child: 
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Blabhabla bhlablahblahblabha lhb laolfdsofdsaljd lkfajk alkaasjlkwsafjlk  dwsahdsakjhksajhskjf  ahlkfdsj",
                                              style: TextStyle(fontSize: 15, fontFamily: 'Barlow'),
                                            ),
                                          )
                                        ),
                                      ]
                                    )
                                  )
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(242, 225, 227, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: const Column(
                                      children: [
                                        Align(
                                        alignment: Alignment.topCenter,
                                        child: Text("level 3", style: TextStyle(fontSize: 25, fontFamily: 'Barlow', fontWeight: FontWeight.bold)),
                                        ),
                                        Align(
                                        alignment: Alignment.topCenter,
                                        child: 
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Blabhabla bhlablahblahblabha lhb laolfdsofdsaljd lkfajk alkaasjlkwsafjlk  dwsahdsakjhksajhskjf  ahlkfdsj",
                                              style: TextStyle(fontSize: 15, fontFamily: 'Barlow'),
                                            ),
                                          )
                                        ),
                                      ]
                                    )
                                  )
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Color.fromRGBO(242, 225, 227, 1),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: const Column(
                                      children: [
                                        Align(
                                        alignment: Alignment.topCenter,
                                        child: Text("level 4", style: TextStyle(fontSize: 25, fontFamily: 'Barlow', fontWeight: FontWeight.bold)),
                                        ),
                                        Align(
                                        alignment: Alignment.topCenter,
                                        child: 
                                          Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "Blabhabla bhlablahblahblabha lhb laolfdsofdsaljd lkfajk alkaasjlkwsafjlk  dwsahdsakjhksajhskjf  ahlkfdsj",
                                              style: TextStyle(fontSize: 15, fontFamily: 'Barlow'),
                                            ),
                                          )
                                        ),
                                      ]
                                    )
                                  )
                                ),
                              ),
                            ],
                          )
                        ],
                      ) 
                    ),
                  ),
                ),
                Visibility(
                  visible: buttonVisibility,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(top:35, bottom: 35, left:35, right: 35),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(orange.withOpacity(animation.value/100)),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const SurveyPage())); 
                          },
                          child: Text('Start Course', style: TextStyle(fontSize: animation.value/4)),
                        )
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
                            MaterialPageRoute(builder: (context) => const SurveyPage()), );
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
  @override            
  void dispose() {         
    controller.dispose();            
    super.dispose();            
  }
}