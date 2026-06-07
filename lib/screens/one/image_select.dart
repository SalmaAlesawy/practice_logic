import 'package:flutter/material.dart';

class ImageSelect extends StatefulWidget {
  const ImageSelect({super.key});

  @override
  State<ImageSelect> createState() => _ImageSelectState();
}

class _ImageSelectState extends State<ImageSelect> {
  List<String> laptops = [
    "assets/laptop/labtop1.png",
    "assets/laptop/labtop2.png",
    "assets/laptop/labtop3.png",
    "assets/laptop/labtop4.png",
  ];
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdee00),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: Image.asset(laptops[selectedImage], fit: BoxFit.cover),
          ),
          SizedBox(height: 25),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(laptops.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedImage = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: selectedImage == index
                            ? Colors.blue
                            : Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: 100,
                    height: 100,
                    child: Image.asset(laptops[index], fit: BoxFit.cover),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
