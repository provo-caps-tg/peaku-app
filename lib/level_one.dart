import 'global_varibles.dart';
import 'survey_intro.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:survey_kit/survey_kit.dart';
import 'package:material_color_generator/material_color_generator.dart';

class InfoDumpResult extends QuestionResult<String> {
  InfoDumpResult({
    required super.id,
    required super.startDate,
    required super.endDate,
    required String super.valueIdentifier,
    required String super.result,
  });
  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];
}

class InfoDumpStep extends Step {
  final String title;
  final String text;
  InfoDumpStep({
    bool isOptional = false,
    String buttonText = 'Next',
    required this.title,
    required this.text,
  });

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
  
  @override
  Widget createView({required QuestionResult? questionResult}) {
    return StepView(
      step: QuestionStep(answerFormat: const BooleanAnswerFormat(positiveAnswer: "wa", negativeAnswer: "we")),
      title: const Text(''),
      resultFunction: () => InfoDumpResult(
        id: Identifier(id: "124912"), 
        startDate: DateTime.now(),
        endDate: DateTime.now(), 
        valueIdentifier: 'custom',//Identification for NavigableTask
        result: 'custom_result',
      ),
      child: Container(),
    );
  }
}

class BoxesResult extends QuestionResult<String> {
  BoxesResult({
    required super.id,
    required super.startDate,
    required super.endDate,
    required String super.valueIdentifier,
    required String super.result,
  });
  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];
}

class CustomStep extends Step {
  final String title;
  final String text;
  CustomStep({
    required this.title,
    required this.text,
  });
  @override
  Widget createView({required QuestionResult? questionResult}) {
    return BoxesStepState(
      title: title,
      text: text,
    );
  }
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class BoxesStepState extends StatefulWidget {
  final String title;
  final String text;
  const BoxesStepState({
    super.key,
    required this.title,
    required this.text,
  });
  @override
  State<BoxesStepState> createState() => _BoxesStepState();
}

class _BoxesStepState extends State<BoxesStepState> {
  @override
  void initState() {
    super.initState();
    if(firstGenerate==true){
      firstGenerate = false;
      firstList = _generateDraggables([
        'Respect',
        'Love', 
        'Kindness',
        'Contentment', 
        'Understanding the other person',
        'Generosity',
        'Care',
        'Empathy',
        'Mutual effort',
        'Loyalty',
        'Humor',
        'Playful Teasing',
        'Righteousness',
        'Being in the Lead Role',
        'Intelligence',
        'Acceptance',
        'Sharing Values',
        'Spontaneity',
        'Educating Them When They are Wrong',
        ]
      );
    }
  }

  List<Widget> _generateDraggables(List<String> texts) {
    return texts.map((text) {
      return Draggable<String>(
        data: text,
        feedback: SizedBox(
          child: Flexible(
            child: Container(
                height: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
                color: const Color.fromARGB(255, 236, 236, 236),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
          ),
        ),
        childWhenDragging: SizedBox(
          child: Container(
            width: 0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: SizedBox(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
                color: const Color.fromARGB(255, 236, 236, 236),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: QuestionStep(answerFormat: const TextAnswerFormat(defaultValue: "ha")),
      controller: SurveyController(),
      title: const Text(''),
      resultFunction: () => BoxesResult(
        id: Identifier(id: "12312"),
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        valueIdentifier: 'custom', // Identification for NavigableTask
        result: 'custom_result',
      ),
      child: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "What makes for a\nhealthy realtionship?", 
                  textAlign: TextAlign.center,
                  style: TextStyle( 
                    //fontWeight: FontWeight.w700,, 
                    fontSize: 60, 
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "Select the top 5 qualities from the \ngroup below that make for healthy relationships:", 
                  textAlign: TextAlign.center,
                  style: TextStyle( 
                    //fontWeight: FontWeight.w700,, 
                    fontSize: 30, 
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                constraints: const BoxConstraints(minHeight: 60),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: orange, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DragTarget<String>(
                  builder: (context, candidateData, rejectedData) {
                    return Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: secondList,
                    );
                  },
                    onAcceptWithDetails: (details) {
                      if (secondList.length < 5) {
                        setState(() {
                          String? data = details.data;
                          firstList.removeWhere((widget) {
                            if (widget is Draggable<String> && widget.data == data) {
                              secondList.add(widget);
                              return true;
                            }
                            return false;
                          });
                        });
                      }
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: double.infinity,
                constraints: const BoxConstraints(minHeight: 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: blue, width: 2),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DragTarget<String>(
                    builder: (context, candidateData, rejectedData) {
                      return Wrap(
                        spacing: 5,
                        runSpacing: 5,
                        children: firstList,
                      );
                    },
                    onAcceptWithDetails: (details) {
                      setState(() {
                        String? data = details.data;
                        secondList.removeWhere((widget) {
                          if (widget is Draggable<String> && widget.data == data) {
                            firstList.add(widget);
                            return true;
                          }
                          return false;
                        });
                      });
                    },
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

class LevelOneHome extends StatefulWidget {
  const LevelOneHome({super.key});

  @override
  State<LevelOneHome> createState() => _LevelOneHomeState();
}

class _LevelOneHomeState extends State<LevelOneHome> {
  var stepss = [
    CustomStep(
      text: "",
      title: "",
    ),
    QuestionStep(
      title: 'Are the qualities you selected present in your current relationships?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'Somewhat', value: 'Somewhat'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Are the qualities you selected present in your work relationships?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'Somewhat', value: 'Somewhat'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Are the qualities you selected present in your family relationships?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'Somewhat', value: 'Somewhat'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Are the qualities you selected present in your friend relationships?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'Somewhat', value: 'Somewhat'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Are the qualities you selected present in your intimate or romantic relationship?',
      isOptional: false,
      buttonText: "Let's go a little deeper.",
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'Somewhat', value: 'Somewhat'),
          TextChoice(text: 'No', value: 'No'),
          TextChoice(text: 'Not applicable', value: 'Not applicable'),
        ],
      ),
    ),
    InstructionStep(
      title: 'What does respect look like to you?',
      text: '(Choose from the following examples whether they are YES Respectful or NO Not Respectful)',
      buttonText: 'Let\'s go!',
    ),
    QuestionStep(
      title: 'My partner makes my lunch every day. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'My boss gave me an advance even though I did not ask for one. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'My partner put a tracker app on my phone. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: "I'm not allowed to lock my bedroom door. Respectful?",
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: "I don't always tell the truth to those close to me. Respectful?",
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Sometimes I speak rudely to those close to me. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'If I make a mess in my relationship, I always clean it up. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'I take responsibility for my behavior. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'I expect others to know what I need without me having to say. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'My partner sometimes says no, but I keep pushing anyway. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'I thank my partner / friends for what they do for me. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'I acknowledge my partner for the great qualities they have. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'If my partner doesn’t look good today, I will tell them. Respectful?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Would you and another person agree on what respect is?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Would everyone define LOVE in the same way?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
    QuestionStep(
      title: 'Would everyone agree with you on what respect looks like?',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: <TextChoice>[
          TextChoice(text: 'Yes', value: 'Yes'),
          TextChoice(text: 'No', value: 'No'),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var task = OrderedTask(steps: stepss, id: TaskIdentifier(id: '1233'));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: orange, foregroundColor: Colors.white, toolbarHeight: 3,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            constraints: const BoxConstraints(maxWidth: 500),
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
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                          ),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height - kToolbarHeight,
                          child: SurveyKit(
                            onResult: (SurveyResult result) {
                              //Read finish reason from result (result.finishReason)
                              //and evaluate the results
                            },
                            task: task,
                            themeData: Theme.of(context).copyWith(
                              primaryColor: generateMaterialColor(color: orange),
                              appBarTheme: AppBarTheme(
                                color: Colors.white,
                                iconTheme: IconThemeData(
                                  color: blue,
                                ),
                                titleTextStyle: TextStyle(
                                  color: generateMaterialColor(color: blue),
                                ),
                              ),
                              iconTheme: IconThemeData(
                                color: blue,
                              ),
                              textSelectionTheme: TextSelectionThemeData(
                                cursorColor: blue,
                                selectionColor: generateMaterialColor(color: orange),
                                selectionHandleColor: generateMaterialColor(color: orange),
                              ),
                              outlinedButtonTheme: OutlinedButtonThemeData(
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(0, 61.0),
                                  ),
                                  side: MaterialStateProperty.resolveWith(
                                    (Set<MaterialState> state) {
                                      if (state.contains(MaterialState.disabled)) {
                                        return const BorderSide(
                                          color: Colors.grey,
                                        );
                                      }
                                      return BorderSide(
                                        color: orange,
                                      );
                                    },
                                  ),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  textStyle: MaterialStateProperty.resolveWith(
                                    (Set<MaterialState> state) {
                                      if (state.contains(MaterialState.disabled)) {
                                        return Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: Colors.grey,
                                            );
                                      }
                                      return Theme.of(context)
                                          .textTheme
                                          .labelLarge
                                          ?.copyWith(
                                            color: generateMaterialColor(color: orange),
                                          );
                                    },
                                  ),
                                ),
                              ),
                              textButtonTheme: TextButtonThemeData(
                                style: ButtonStyle(
                                  textStyle: MaterialStateProperty.all(
                                    Theme.of(context).textTheme.labelLarge?.copyWith(
                                          color: generateMaterialColor(color: orange),
                                        ),
                                  ),
                                ),
                              ),
                              textTheme: const TextTheme(
                                displayMedium: TextStyle(
                                  fontSize: 35.0,
                                  color: Colors.black,
                                ),
                                headlineSmall: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.black,
                                ),
                                bodyMedium: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.black,
                                ),
                              ),
                              inputDecorationTheme: const InputDecorationTheme(
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              colorScheme: ColorScheme.fromSwatch(
                                primarySwatch: generateMaterialColor(color: orange),
                              )
                                  .copyWith(
                                    onPrimary: Colors.white,
                                  )
                                  .copyWith(background: Colors.white),
                            ),
                            surveyProgressbarConfiguration: SurveyProgressConfiguration(
                              progressbarColor: blue,
                            ),
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
                            MaterialPageRoute(builder: (context) => const IntroPage()), );
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