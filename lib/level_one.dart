import 'package:flutter/material.dart';
import 'package:survey_kit/survey_kit.dart';
import 'global_varibles.dart';

class LevelOneHome extends StatefulWidget {
  const LevelOneHome({super.key});
  @override
  State<LevelOneHome> createState() => _LevelOneHomeState();}

class _LevelOneHomeState extends State<LevelOneHome> {
  @override
  Widget build(BuildContext context) {
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
                      child: const Column(
                        //Start of widgets//
                        children: [
Text('hello')
                        ],
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