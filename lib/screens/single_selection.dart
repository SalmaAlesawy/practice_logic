import 'package:flutter/material.dart';

class SingleSelection extends StatefulWidget {
  const SingleSelection({super.key});

  @override
  State<SingleSelection> createState() => _SingleSelectionState();
}

class _SingleSelectionState extends State<SingleSelection> {
  List<Map> animals = [
    {"image": "assets/animals/cow.png", "name": "cow"},
    {"image": "assets/animals/deer.png", "name": "deer"},
    {"image": "assets/animals/giraffe.png", "name": "giraffe"},
    {"image": "assets/animals/lion.png", "name": "lion"},
    {"image": "assets/animals/pingeon.png", "name": "pingeon"},
    {"image": "assets/animals/rat.png", "name": "rat"},
    {"image": "assets/animals/tiger.png", "name": "tiger"},
    {"image": "assets/animals/white-tiger.png", "name": "white-tiger"},
  ];
  int? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: Colors.black87,
          child: GridView.builder(
            itemCount: animals.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.95,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedItem=index;
                    });
                  },
                  child: Stack(
                    children: [
                     selectedItem==index? Container(
                       margin: EdgeInsets.only(top: 50),
                        decoration: BoxDecoration(gradient: LinearGradient(colors: [
                          Colors.black12,
                          Colors.black26
                        ]),
                        borderRadius: BorderRadius.circular(4)),
                      ):SizedBox.shrink(),
                      Column(
                        children: [
                          Image.asset(
                            width:selectedItem==index? 110:100,
                            height:selectedItem==index? 110:100,
                            animals[index]["image"],
                          ),
                          Text(
                           selectedItem==index?"": animals[index]["name"].toUpperCase(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                     selectedItem==index? Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(3)
                          ),
                          child: Center(child: Text("Send")),
                        ),
                      ):SizedBox.shrink()
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
