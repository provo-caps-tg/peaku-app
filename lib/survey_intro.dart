import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'global_varibles.dart';
import 'level_one.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});
  @override
  State<IntroPage> createState() => _IntroPageState();}

class _IntroPageState extends State<IntroPage> with TickerProviderStateMixin {
  bool summaryVisible = false;
  late Animation<Offset> animationSlide;
  late AnimationController slideController;
  late Animation<double> animationO;            
  late AnimationController controllerO;
  @override
  void initState() {
    super.initState();
    //Code for the opactiy animation.
    controllerO = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    final Animation<double> curveO = CurvedAnimation(parent: controllerO, curve: Curves.easeInExpo);
    animationO = Tween<double>(begin: 0, end: 100).animate(curveO);
    animationO.addListener(() {
    setState(() {
      });
    });
    //Ends here, now code for slide transtion animation starts
    slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this //Reminder to myself, vsync always goes last.
    );
    CurvedAnimation curveSlide = CurvedAnimation(parent: slideController, curve: Curves.easeIn); //Not too sure on this line of code, could be trouble later
    animationSlide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero
    ).animate(curveSlide);
    animationSlide.addListener(() {
    setState(() {
      });
    });
  }

  @override            
  void dispose() {         
    controllerO.dispose();  
    slideController.dispose();  
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
        constraints: const BoxConstraints.expand(),
        color: Colors.black,
        child: Center(
          child: Container(
            constraints: const BoxConstraints(minWidth: 260, maxWidth: 500),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SlideTransition(position: animationSlide,
              child: SingleChildScrollView (
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top:35, bottom: 15, left:35, right: 35),
                        child: Column(
                          children: [
                            Text(
                              "Before we Start a Quick Summary of our Curriculum",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:15, bottom: 0, left:35, right: 35),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(orange),
                          ),
                          onPressed: () {
                            controllerO.forward(); 
                            slideController.forward();
                            setState(() {
                              summaryVisible = true;
                            });
                          },
                          child: const FittedBox(
                            fit: BoxFit.fill,
                            child: Text('Explore Summary of PeakU', style: TextStyle(fontSize: 20)),
                          ) 
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:0, bottom: 5, left:35, right: 35),
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => const LevelOneHome())); 
                          },
                          child:  const FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text('Skip Summary', style: TextStyle(fontSize: 10, color: Colors.white, decoration: TextDecoration.underline,)),
                          ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top:5, bottom: 15, left:35, right: 35),
                        child: Visibility(
                          visible: summaryVisible,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only( top: 10, bottom: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 6, color: const Color.fromARGB(255, 4, 21, 56).withOpacity(animationO.value/100) ),
                                    borderRadius: BorderRadius.circular(12)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                                    child: Column(
                                      children: [ 
                                        FittedBox(
                                          fit: BoxFit.fill,
                                          child: Text(
                                            "Level 1",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 70,
                                              color: const Color.fromARGB(255, 4, 21, 56).withOpacity(animationO.value/100),
                                              fontFamily: 'Barlow',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Mt. Timpanogos",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: const Color.fromARGB(255, 4, 21, 56).withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Level 1 we call Mount Timpanogos, after the famous 12,000-ft peak in the Wasatch Range in Utah.  Your courage is taking you up, up, up!\n",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                        Text(
                                          "In this level you will:",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                        Text(
                                          "\u2022 Begin to explore the nature of healthy relationships \n\u2022 Identify how healthy (or unhealthy) behaviors\n\u2022 Start to connect with your breath\n\u2022 Begin to form a specific vision for your future",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only( top: 10, bottom: 10),
                                child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 6, color: const Color.fromRGBO(124,66,81,255).withOpacity(animationO.value/100) ),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Padding(
                                   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                                    child: Column(
                                      children: [ 
                                        FittedBox(
                                          fit: BoxFit.fill,
                                          child: Text(
                                            "Level 2",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 70,
                                              color: const Color.fromRGBO(124,66,81,255).withOpacity(animationO.value/100),
                                              fontFamily: 'Barlow',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "Mt. Whitney",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: const Color.fromRGBO(124,66,81,255).withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Level 2 is our Mount Whitney—you’re growing to over 14,000 feet.  Congratulations!\n",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                        Text(
                                          "In this level you will:",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                        Text(
                                          "\u2022 Deepen your understanding of healthy relationships\n\u2022  Identify the qualities we look for, and bring, to relationships\n\u2022  Determine your core values\n\u2022 Start listening for the core values in others\n\u2022 Understand the significance of values\n\u2022 Practice a moving meditation\n\u2022 Continue working on your future vision\n\u2022 Practice being recognized for your core values",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only( top: 10, bottom: 10),
                                child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 6, color: const Color.fromRGBO(158,64,59,255).withOpacity(animationO.value/100) ),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Padding(
                                   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                                    child: Column(
                                      children: [ 
                                        FittedBox(
                                          fit: BoxFit.fill,
                                          child: Text(
                                            "Level 3",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 70,
                                              color: const Color.fromRGBO(158,64,59,255).withOpacity(animationO.value/100),
                                              fontFamily: 'Barlow',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "The Himalayas",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: const Color.fromRGBO(158,64,59,255).withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Level 3 is all the way to The Himalayas, where the air is thin, but your strength prevails!\n",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                        Text(
                                          "In this level you will:",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                        Text(
                                          "\u2022 Further deepen your understanding of healthy relationships\n\u2022 Explore the importance of emotions in relationships\n\u2022 Understand Emotional Regulation\n\u2022 Learn effective strategies for managing any scenario\n\u2022 Apply those strategies in real time\n\u2022 Learn valuable communication skills for nourishing all relationships\n\u2022 Practice active listening scenarios\n\u2022 Further your future vision with specific goals and steps",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only( top: 10, bottom: 10),
                                child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 6, color: orange.withOpacity(animationO.value/100) ),
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Padding(
                                   padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
                                    child: Column(
                                      children: [ 
                                        FittedBox(
                                          fit: BoxFit.fill,
                                          child: Text(
                                            "Level 4",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 70,
                                              color: orange.withOpacity(animationO.value/100),
                                              fontFamily: 'Barlow',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "PeakU",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 25,
                                            color: orange.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Level 4 is, of course, PeakU!  You are off and running, my friend.  Seriously, take a breath and appreciate yourself for taking this on, and so successfully.\n",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                        Text(
                                          "In this level you will:",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                        Text(
                                          "\u2022 See the peak signs of healthy relationships\n\u2022 Examine timing of relationship events\n\u2022 Explore flexibility and expectations in relationships\n\u2022 Experience the dance of intimacy, inside the dynamics of space and pressure\n\u2022 Chisel your future vision from dream into reality\n\u2022 Get resources for your needs\n\u2022 Live at PeakU",
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Colors.white.withOpacity(animationO.value/100),
                                            fontFamily: 'Barlow',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                               ),
                             ],
                            )
                         ),
                        ),
                      ),
                      Visibility(
                        visible: summaryVisible,
                        child: Padding(
                          padding: const EdgeInsets.only(top:0, bottom: 30, left:35, right: 35),
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
                                  MaterialPageRoute(builder: (context) => const LevelOneHome())); 
                              },
                              child: const FittedBox(
                                fit: BoxFit.fill,
                                child: Text('Continue', style: TextStyle(fontSize: 20)),
                              ),
                            ),
                         ),
                       ),
                    ),
                  ],
                )
              ),
            ),  
          ),
        ),
      ),
    );
  }
}