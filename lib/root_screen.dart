import 'package:flutter/material.dart';
import 'package:logic/screens/image_select.dart';
import 'package:logic/screens/single_selection.dart';
import 'package:logic/screens/toggle_selection.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  final PageController controller = PageController();
  List<Widget> screens = [
    SingleSelection(),
    ImageSelect(),
    ToggleSelection(),

  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: PageView(
        controller: controller,
        children: screens,
        onPageChanged: (value) {
          setState(() {
            selectedIndex=value;
          });
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),color: Colors.white
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60),
          child: Row(
            spacing: 5,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap:(){
                  controller.jumpToPage(selectedIndex-1);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Icon(Icons.arrow_back),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 40,
                decoration: BoxDecoration(color: Colors.black,),

                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      controller.jumpToPage(selectedIndex+1);
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        " Next page",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.arrow_forward,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
