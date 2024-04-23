import 'global_varibles.dart';
import 'survey_intro.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:survey_kit/survey_kit.dart';
import 'package:material_color_generator/material_color_generator.dart';
 
class ContentResult extends QuestionResult<String> {
  ContentResult({
    required super.id,
    required super.startDate,
    required super.endDate,
    required String super.valueIdentifier,
    required String super.result,
  });
  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
class CycleOfAbuseStep extends Step {
  final String title;
  final String text;
  CycleOfAbuseStep({
    bool isOptional = false,
    String buttonText = 'Next',
    required this.title,
    required this.text,
  });

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  Widget createView({required QuestionResult? questionResult}) {
    return CycleOfAbuseStepState(
      title: title,
      text: text,
    );
  }
}

class CycleOfAbuseStepState extends StatefulWidget {
  final String title;
  final String text;
  const CycleOfAbuseStepState({
    super.key,
    required this.title,
    required this.text,
  });
  @override
  State<CycleOfAbuseStepState> createState() => _CycleOfAbuseStepState();
}

class _CycleOfAbuseStepState extends State<CycleOfAbuseStepState> with SingleTickerProviderStateMixin{
  int sequence = 1;
  late Animation<double> opacity1;
  late Animation<double> opacity2;
  late Animation<double> opacity3;
  late Animation<double> opacity4;
  late AnimationController visibilityController;

  @override
  void initState() {
    super.initState();
    //WOAH I WROTE THIS WITH A BOUNCY BALL
    visibilityController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this
    );
    CurvedAnimation visibilityCurve = CurvedAnimation(parent: visibilityController, curve: Curves.linear);
    opacity1 = Tween<double>(begin: 0, end: 400).animate(visibilityCurve);
    opacity2 = Tween<double>(begin: 0, end: 400).animate(visibilityCurve);
    opacity3 = Tween<double>(begin: 0, end: 400).animate(visibilityCurve);
    opacity4 = Tween<double>(begin: 0, end: 400).animate(visibilityCurve);
    opacity1.addListener(() {
      setState(() { });
    });
    opacity2.addListener(() {
      setState(() { });
    });
    opacity3.addListener(() {
      setState(() { });
    });
    opacity4.addListener(() {
      setState(() { });
    });
    visibilityController.forward();
  } 
  double visibility() {
    if (opacity1.value<=100) {
      return opacity1.value/100;
    } else if (opacity1.value>=100) {
      return 1;
    } else {
      return 0;
    }
  }
   double visibility2() {
    if (opacity2.value>=100 && opacity2.value<=200) {
      return (opacity2.value/100)-1;
    } else if (opacity2.value>=200) {
      return 1;
    } else {
      return 0;
    }
   }
   double visibility4() {
    if (opacity4.value>=200 && opacity4.value<=300) {
      return (opacity4.value/100)-2;
    } else if (opacity4.value>=300) {
      return 1;
    } else {
      return 0;
    }
   }
   double visibility3() {
    if (opacity3.value>=300) {
      return (opacity3.value/100)-3;
    } else {
     return 0;
    }
   }
  

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: QuestionStep(answerFormat: const BooleanAnswerFormat(positiveAnswer: "wa", negativeAnswer: "we")),
      title: const Text(''), 
      resultFunction: () => ContentResult(
        id: Identifier(id: "124912"), 
        startDate: DateTime.now(), 
        endDate: DateTime.now(), 
        valueIdentifier: 'custom',//Identification for NavigableTask
        result: 'custom_result',
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Cycle of Abuse", 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              color: blue,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 300,
            child: Row(
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    RotatedBox(quarterTurns: 3,
                      child: Opacity(
                        opacity: visibility(),
                        child: const Image(
                          image: AssetImage('assets/images/Arrow.png'),
                          width: 150,
                          height: 150,
                          color: Color.fromARGB(255, 255, 218, 54),
                        ),
                      ),
                    ),
                    Positioned(
                      width: 75,
                      height: 50,
                      top: 45,
                      left:5,
                      child: Opacity(
                        opacity: visibility(),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: const Color.fromARGB(255, 255, 218, 54), borderRadius: BorderRadius.circular(12)),
                          child: const Center(child: Text("Tension\nBuilding", style: TextStyle(fontSize: 16, color: Colors.white),))
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  fit: StackFit.loose,
                  children: [
                    RotatedBox(quarterTurns: 0,
                      child: Opacity(
                        opacity: visibility2(),
                        child: const Image(
                          image: AssetImage('assets/images/Arrow.png'),
                          width: 150,
                          height: 150,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Positioned(
                      width: 75,
                      height: 25,
                      top: 35,
                      left: 45,
                      child: Opacity(
                        opacity: visibility2(),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(12)),
                          child: const Center(child: Text("Explosion", style: TextStyle(fontSize: 16, color: Colors.white),))
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            child: Row(
              children: [
                Stack(
                  fit: StackFit.loose,
                  children: [
                    RotatedBox(quarterTurns: 2,
                      child: Opacity(
                        opacity: visibility3(),
                        child: const Image(
                          image: AssetImage('assets/images/Arrow.png'),
                          width: 150,
                          height: 150,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Positioned(
                      width: 60,
                      height: 50,
                      top: 75,
                      left: 35,
                      child: Opacity(
                        opacity: visibility3(),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                          child: const Center(child: Text("Calm\nPhase", style: TextStyle(fontSize: 16, color: Colors.white),))
                        ),
                      ),
                    ),
                  ],
                ),
                Stack(
                  fit: StackFit.loose,
                  children: [
                    RotatedBox(quarterTurns: 1,
                      child: Opacity(
                        opacity: visibility4(),
                        child: const Image(
                          image: AssetImage('assets/images/Arrow.png'),
                          width: 150,
                          height: 150,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Positioned(
                      width: 120,
                      height: 25,
                      top: 55,
                      left: 35,
                      child: Opacity(
                        opacity: visibility4(),
                        child: DecoratedBox(
                          decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(12)),
                          child: const Center(child: Text('Reconciliation', style: TextStyle(fontSize: 16, color: Colors.white),))
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 6, color: const Color.fromARGB(255, 255, 218, 54) ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Column(
                  children: [ 
                    const FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Tension Building",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Color.fromARGB(255, 255, 218, 54),
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "In this stage, we might see more fighting and more stress. The biggest clue though, is the feeling of walking on eggshells.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: blue,
                        fontFamily: 'Barlow',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 6, color: Colors.red ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Column(
                  children: [ 
                    const FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Explosion",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.red,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Tension has built and ultimately bursts out like an explosion. If physical abuse is part of the relationship, this is often when it is most likely to occur. It's a big, intense moment. Sometimes this explosion is blamed on the other person. They might say, “If you hadn’t done that, I wouldn’t have gotten mad.” ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: blue,
                        fontFamily: 'Barlow',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 6, color: Colors.blue ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Column(
                  children: [ 
                    const FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Reconciliation",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.blue,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "The person who did the hurting might say sorry and try to make things right. They promise not to do it again. They might also use minimization or denial to justify their actions. They may even shower their partner with gifts to try to prove that they’ve changed. This is typically the shortest part of the cycle.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: blue,
                        fontFamily: 'Barlow',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 6, color: Colors.green ),
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
                child: Column(
                  children: [ 
                    const FittedBox(
                      fit: BoxFit.fill,
                      child: Text(
                        "Calm Phase",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.green,
                          fontFamily: 'Barlow',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "Things seem peaceful, and the tension goes away. People in the relationship feel like things are okay again. But, this calm doesn't stick around. It goes back to the first part, and the cycle starts over.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        color: blue,
                        fontFamily: 'Barlow',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Text(
            "Reminder", 
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: blue,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text.rich(
              textAlign: TextAlign.center,
                TextSpan(
                  style: TextStyle(
                  fontSize: 17,
                  color: blue,
                  fontFamily: 'Barlow',
                ),
                text: 'This is an example of what ', 
                children: const <TextSpan>[
                  TextSpan(text: "can", style: TextStyle(decoration: TextDecoration.underline)),
                  TextSpan(text: " happen in a relationship. It does not always look like this, but it is important to recognize this cycle when present. \n\nSome relationships exhibit this cycle, others are quite random.  It is important to recognize signs of abuse in relationships, and understand that when they are random, or unpredictable.\n\n We sometimes have a tendency to dismiss them as a phase, or tell ourselves it will get better. Or we tell ourselves that the good outweighs the bad."),
                  TextSpan(text: "\n\nNo amount of abuse in a relationship is acceptable.", style: TextStyle(fontSize: 20, decoration: TextDecoration.underline))
                ]
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Don't Forget!", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                color: blue,
                fontFamily: 'Barlow',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Healthy relationships leave you trusting yourself more, not less.", 
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: blue,
                fontFamily: 'Barlow',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override            
  void dispose() {          
    visibilityController.dispose();  
    super.dispose();         
  }
}

class HealthyRelationshipStep extends Step {
  final String title;
  final String text;
  HealthyRelationshipStep({
    bool isOptional = false,
    String buttonText = 'Next',
    required this.title,
    required this.text,
  });

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);

  @override
  Widget createView({required QuestionResult? questionResult}) {
    return HealthyRelationshipStepState(
      title: title,
      text: text,
    );
  }
}

class HealthyRelationshipStepState extends StatefulWidget {
  final String title;
  final String text;
  const HealthyRelationshipStepState({
    super.key,
    required this.title,
    required this.text,
  });
  @override
  State<HealthyRelationshipStepState> createState() => _HealthyRelationshipStepState();
}

class _HealthyRelationshipStepState extends State<HealthyRelationshipStepState> with SingleTickerProviderStateMixin{
  Color textColorYes = orange;
  Color bgColorYes = Colors.white;
  Color textColorNo = orange;
  Color bgColorNo = Colors.white;
  
  void filledYes(){
    setState(() {
      bgColorYes = orange;
      textColorYes = Colors.white;
      textColorNo = orange;
      bgColorNo = Colors.white;
    });
  }
  void filledNo(){
    setState(() {
      bgColorNo = orange;
      textColorNo = Colors.white;
      textColorYes = orange;
      bgColorYes = Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StepView(
      step: QuestionStep(answerFormat: const BooleanAnswerFormat(positiveAnswer: "wa", negativeAnswer: "we")),
      title: const Text(''), 
      resultFunction: () => ContentResult(
        id: Identifier(id: "124913"), 
        startDate: DateTime.now(), 
        endDate: DateTime.now(), 
        valueIdentifier: 'custom',//Identification for NavigableTask
        result: 'custom_result',
      ),
      child: //Copied thomas code here.
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Text(
                "Healthy Relationships", 
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  color: blue,
                  fontFamily: 'Barlow',
                  fontWeight: FontWeight.bold,
                ),
             ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [   
                    Text(
                      "In your current relationship, \ndo you trust yourself more?", 
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: blue,
                        fontFamily: 'Barlow',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: OutlinedButton(
                        onPressed:() {
                          filledYes();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                          ),
                          foregroundColor: MaterialStateProperty.all(textColorYes), // Change text color
                          backgroundColor: MaterialStateProperty.all(bgColorYes), // Change background color
                        ),
                        child: const Text('Yes'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: OutlinedButton(
                        onPressed:() {
                          filledNo();
                        },
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                          ),
                          foregroundColor: MaterialStateProperty.all(textColorNo), // Change text color
                          backgroundColor: MaterialStateProperty.all(bgColorNo), // Change background color
                        ),
                        child: const Text('No'),
                      ),
                    ), 
                  ],
                ),
            ),
          ],
        ),
      )
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
    bool isOptional = false,
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
        ]
      );
    }
  }

  List<Widget> _generateDraggables(List<String> texts) {
    return texts.map((text) {
      return Draggable<String>(
        data: text,
        feedback: Container(
                height: 50,
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
                    fontFamily: 'Barlow',
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
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'Barlow',
                  ),
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

class ReflectionResult extends QuestionResult<String> {
  ReflectionResult({
    required super.id,
    required super.startDate,
    required super.endDate,
    required String super.valueIdentifier,
    required String super.result,
  });
  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];
}

class ReflectionStep extends Step {
  final String title;
  final String text;
  ReflectionStep({
    required this.title,
    required this.text,
  });
  @override
  Widget createView({required QuestionResult? questionResult}) {
    return ReflectionStepState(
      title: title,
      text: text,
    );
  }
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ReflectionStepState extends StatefulWidget {
  final String title;
  final String text;
  const ReflectionStepState({
    super.key,
    required this.title,
    required this.text,
  });
  @override
  State<ReflectionStepState> createState() => _ReflectionStepState();
  
}
List<String> relationships = [
  'Present in your\ncurrent relationships?',
  'Present in your\nwork relationships?',
  'Present in your\nfamily relationships?',
  'Present in your\nfriend relationships?',
  'Present in your\nintimate or romantic relationship?',
];
List<String> answerResultRelationships = [
  ' ',
  ' ',
  ' ',
  ' ',
  ' ',
];
String reflectionStringResult = '';
Color textColorYes = orange;
Color bgColorYes = Colors.white;
Color textColorNo = orange;
Color bgColorNo = Colors.white;
int increment = 0;
bool reflectionVisibility = false;
bool buttonVisibility = true;
class _ReflectionStepState extends State<ReflectionStepState> {
  String questionText = relationships[increment];

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }

  void filledYes(){
    bgColorYes = orange;
    textColorYes = Colors.white;
    textColorNo = orange;
    bgColorNo = Colors.white;
  }
  void filledNo(){
    bgColorNo = orange;
    textColorNo = Colors.white;
    textColorYes = orange;
    bgColorYes = Colors.white;
  }
  void filledEmpty(){
    textColorYes = orange;
    bgColorYes = Colors.white;
    textColorNo = orange;
    bgColorNo = Colors.white;
  }

  void incrementUp(){
    setState(() {
      if(increment<4){
        if(answerResultRelationships[increment+1]=='Yes'){
          reflectionStringResult = 'Yes';
          filledYes();
        }
        else if(answerResultRelationships[increment+1]=='No'){
          reflectionStringResult = 'No';
          filledNo();
        }
        else{
          reflectionStringResult = '';
          filledEmpty();
        }
        increment+=1;
        questionText = relationships[increment];
      }
      else{
        if(answerResultRelationships[increment]=='Yes'){
          reflectionStringResult = 'Yes';
          filledYes();
        }
        else if(answerResultRelationships[increment]=='No'){
          reflectionStringResult = 'No';
          filledNo();
        }
        else{
          reflectionStringResult = '';
          filledEmpty();
        }
      }
    });
  }
  void incrementDown(){
    setState(() {
      if(increment>0){
        if(answerResultRelationships[increment-1]=='Yes'){
          reflectionStringResult = 'Yes';
          filledYes();
        }
        else if(answerResultRelationships[increment-1]=='No'){
          reflectionStringResult = 'No';
          filledNo();
        }
        else{
          reflectionStringResult = '';
          filledEmpty();
        }
        increment-=1;
        questionText = relationships[increment];
      }
      else{
        if(answerResultRelationships[increment]=='Yes'){
          reflectionStringResult = 'Yes';
          filledYes();
        }
        else if(answerResultRelationships[increment]=='No'){
          reflectionStringResult = 'No';
          filledNo();
        }
        else{
          reflectionStringResult = '';
          filledEmpty();
        }
      }
    });
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
                  "Reflection", 
                  textAlign: TextAlign.center,
                  style: TextStyle( 
                    //fontWeight: FontWeight.w700,, 
                    fontSize: 60, 
                  ),
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 2,
              indent: 20,
              endIndent: 20,
              color: Colors.black,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  "These healthy relationship \nqualities you selected, are they:", 
                  textAlign: TextAlign.center,
                  style: TextStyle( 
                    //fontWeight: FontWeight.w700,, 
                    fontSize: 30, 
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  questionText, 
                  textAlign: TextAlign.center,
                  style: const TextStyle( 
                    //fontWeight: FontWeight.w700,, 
                    fontSize: 30, 
                  ),
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Visibility(
                    visible: buttonVisibility,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:const EdgeInsets.only(right: 10),
                          child: Visibility(
                            visible: true,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: orange),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconTheme(
                                  data: IconThemeData(
                                  color: orange),
                                  child: IconButton(
                                    onPressed:() {
                                      answerResultRelationships[increment] = reflectionStringResult;
                                      reflectionStringResult = '';
                                      incrementDown();
                                    },
                                    icon: const Icon(Icons.arrow_back)
                                  ),
                                ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            child: OutlinedButton(
                              onPressed:() {
                                setState(() {
                                  reflectionStringResult = 'Yes';
                                  filledYes();
                                });
                                //incrementUp();
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                                ),
                                foregroundColor: MaterialStateProperty.all(textColorYes), // Change text color
                                backgroundColor: MaterialStateProperty.all(bgColorYes), // Change background color
                              ),
                              child: const Text('Yes'),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                            child: OutlinedButton(
                              onPressed:() {
                                setState(() {
                                  reflectionStringResult = 'No';
                                  filledNo();
                                });
                                //incrementUp();
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0))
                                ),
                                foregroundColor: MaterialStateProperty.all(textColorNo), // Change text color
                                backgroundColor: MaterialStateProperty.all(bgColorNo), // Change background color
                              ),
                              child: const Text('No'),
                            ),
                          ),
                        ),
                        Padding(
                          padding:const EdgeInsets.only(left: 10),
                          child: Visibility(
                            visible: true,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: orange),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: IconTheme(
                                  data: IconThemeData(
                                  color: orange),
                                  child: IconButton(
                                    onPressed:() {
                                      answerResultRelationships[increment] = reflectionStringResult;
                                      reflectionStringResult = '';
                                      incrementUp();
                                    },
                                    icon: const Icon(Icons.arrow_forward)
                                  ),
                                ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScenariosResult extends QuestionResult<String> {
  ScenariosResult({
    required super.id,
    required super.startDate,
    required super.endDate,
    required String super.valueIdentifier,
    required String super.result,
  });
  @override
  List<Object?> get props => [id, startDate, endDate, valueIdentifier, result];
}

class Scenarios extends Step {
  final String title;
  final String text;
  Scenarios({
    required this.title,
    required this.text,
  });
  @override
  Widget createView({required QuestionResult? questionResult}) {
    return ScenariosState(
      title: title,
      text: text,
    );
  }
  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ScenariosState extends StatefulWidget {
  final String title;
  final String text;
  const ScenariosState({
    super.key,
    required this.title,
    required this.text,
    bool isOptional = false,
  });
  @override
  State<ScenariosState> createState() => _ScenariosState();
}
int scenariosIncrement = 0;
List<String> scenarios = [
  'My partner makes my lunch every day.',
  'My boss gave me an advance even though I did not ask for one.',
  'My partner put a tracker app on my phone.',
  "I'm not allowed to lock my bedroom door.",
  "I don't always tell the truth to those close to me.",
  "Sometimes I speak rudely to those close to me.",
  "If I make a mess in my relationship, I always clean it up.",
  "I take responsibility for my behavior.",
  "I expect others to know what I need without me having to say.",
  "My partner sometimes says no, but I keep pushing anyway.",
  "I thank my partner / friends for what they do for me.",
  "I acknowledge my partner for the great qualities they have.",
  "If my partner doesn't look good today, I will tell them.",
];
String currentScenario = scenarios[scenariosIncrement];

class _ScenariosState extends State<ScenariosState> {
  @override
  void initState() {
    super.initState();
    if(firstScenarioGenerate==true){
      firstScenarioGenerate = false;
      firstScenarioList = _generateDraggables([
          scenarios[scenariosIncrement]
        ]
      );
    }
  }

  void _addDraggables(String text) {
    setState(() {
      firstScenarioList.add(Draggable<String>(
        data: text,
        feedback: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(125, 0, 0, 0), width: 1),
            color: const Color.fromARGB(175, 236, 236, 236),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Text(
              text,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(125, 0, 0, 0),
                fontSize: 16,
                decoration: TextDecoration.none,
                fontFamily: 'Barlow',
              ),
            ),
          ),
        ),
        childWhenDragging: SizedBox(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: orange, width: 1),
              color: const Color.fromARGB(255, 236, 236, 236),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: Text(
                text,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: 'Barlow',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
                color: const Color.fromARGB(255, 236, 236, 236),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Text(
                  text,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'Barlow',
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      )
    );
    });
  }


  List<Widget> _generateDraggables(List<String> texts) {
    return texts.map((text) {
      return Draggable<String>(
        data: text,
        feedback: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(125, 0, 0, 0), width: 1),
            color: const Color.fromARGB(175, 236, 236, 236),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Text(
              text,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(125, 0, 0, 0),
                fontSize: 20,
                decoration: TextDecoration.none,
                fontFamily: 'Barlow',
              ),
            ),
          ),
        ),
        childWhenDragging: SizedBox(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: orange, width: 1),
              color: const Color.fromARGB(255, 236, 236, 236),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
              child: Text(
                text,
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                  fontFamily: 'Barlow',
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: SizedBox(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1),
                color: const Color.fromARGB(255, 236, 236, 236),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Text(
                  text,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    decoration: TextDecoration.none,
                    fontFamily: 'Barlow',
                    fontSize: 16,
                  ),
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
                  "What does respect \nlook like to you?", 
                  textAlign: TextAlign.center,
                  style: TextStyle( 
                    //fontWeight: FontWeight.w700,, 
                    fontSize: 60, 
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: "Drag & sort the following examples based on \nif they are", 
                    style: TextStyle(fontSize: 30, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(text: ' NO', style: TextStyle(color: Colors.red, fontSize: 30)),
                      TextSpan(text: ' Not Respectful or', style: TextStyle(fontSize: 30, color: Colors.black)),
                      TextSpan(text: ' YES', style: TextStyle(color: Colors.green, fontSize: 30)),
                      TextSpan(text: ' Respectful', style: TextStyle(fontSize: 30, color: Colors.black)),
                    ]
                  )
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
                  child: Center(
                    child:  DragTarget<String>(
                        builder: (context, candidateData, rejectedData) {
                          return Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: firstScenarioList,
                          );
                        },
                      ),
                  ),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "No", 
                      textAlign: TextAlign.center,
                      style: TextStyle( 
                        //fontWeight: FontWeight.w700,, 
                        fontSize: 60, 
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right:15),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Yes", 
                        textAlign: TextAlign.center,
                        style: TextStyle( 
                          //fontWeight: FontWeight.w700,, 
                          fontSize: 60, 
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SafeArea(
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right:5),
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 60,),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(50, 244, 67, 54),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DragTarget<String>(
                              builder: (context, candidateData, rejectedData) {
                                return Wrap(
                                  spacing: 5,
                                  runSpacing: 5,
                                  children: secondScenarioList,
                                );
                              },
                              onAcceptWithDetails: (details) {
                                  bool found = false;
                                  setState(() {
                                    String? data = details.data;
                                    firstScenarioList.removeWhere((widget) {
                                      if (widget is Draggable<String> && widget.data == data) {
                                        secondScenarioList.add(widget);
                                        found = true;
                                        return true;
                                      }
                                      return false;
                                    });
                                    if (found==true){
                                      if(scenariosIncrement<scenarios.length-1){
                                        scenariosIncrement+=1;
                                        _addDraggables(scenarios[scenariosIncrement]);
                                      }
                                      found = false;
                                    }
                                    thirdScenarioList.removeWhere((widget) {
                                      if (widget is Draggable<String> && widget.data == data) {
                                        secondScenarioList.add(widget);
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
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10, left:5),
                        child: Container(
                          constraints: const BoxConstraints(minHeight: 60),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(50, 76, 175, 79),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DragTarget<String>(
                            builder: (context, candidateData, rejectedData) {
                              return Wrap(
                                spacing: 5,
                                runSpacing: 5,
                                children: thirdScenarioList,
                              );
                            },
                              onAcceptWithDetails: (details) {
                                  bool found = false;
                                  setState(() {
                                    String? data = details.data;
                                    firstScenarioList.removeWhere((widget) {
                                      if (widget is Draggable<String> && widget.data == data) {
                                        secondScenarioList.add(widget);
                                        found = true;
                                        return true;
                                      }
                                      return false;
                                    });
                                    if (found==true){
                                      if(scenariosIncrement<scenarios.length-1){
                                        scenariosIncrement+=1;
                                        _addDraggables(scenarios[scenariosIncrement]);
                                      }
                                      found = false;
                                    }
                                    secondScenarioList.removeWhere((widget) {
                                      if (widget is Draggable<String> && widget.data == data) {
                                        thirdScenarioList.add(widget);
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
    ReflectionStep(
      text: "",
      title: "",
    ),
    Scenarios(
      text: "",
      title: "",
    ),
    /*
    InstructionStep(
      title: 'What does respect look like to you?',
      text: '(Choose from the following examples whether they are YES Respectful or NO Not Respectful)',
      buttonText: 'Let\'s go!',
    ),
    */
    CycleOfAbuseStep(
      text: "",
      title: "",
    ),
    HealthyRelationshipStep(
      title: "",
      text: ""
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