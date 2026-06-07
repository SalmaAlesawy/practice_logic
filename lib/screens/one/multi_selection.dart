import 'package:flutter/material.dart';

class MultiSelection extends StatefulWidget {
  const MultiSelection({super.key});

  @override
  State<MultiSelection> createState() => _MultiSelectionState();
}

class _MultiSelectionState extends State<MultiSelection> {
  List<String> categories = [
    "News",
    "Sports",
    "Entertainment",
    "Business &\n Finance",
    "Technology",
    "Politics",
    "Fashion &\nBeauty",
    "Gaming",
    "LifStyle",
    "Movies& TV",
    "Music",
    "Travel",
    "Food",
    "Comedy",
    "Health &\nFitness",
  ];
  Set<String> emptySet = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "What do you want to see on X?",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 600,
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 30 / 22,
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final category = categories[index];
                  final isSelected = emptySet.contains(category);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (!isSelected) {
                          emptySet.add(category);
                        } else {
                          emptySet.remove(category);
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          padding: EdgeInsets.only(top: 60, left: 10),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue : Colors.black,
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 15,
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        isSelected
                            ? Positioned(
                                right: 10,
                                top: 10,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 12,
                                  child: Icon(Icons.done, color: Colors.blue),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "${emptySet.length} selected of ${categories.length}",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
