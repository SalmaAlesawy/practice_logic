import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadMultiImages extends StatefulWidget {
  const UploadMultiImages({super.key});

  @override
  State<UploadMultiImages> createState() => _UploadMultiImagesState();
}

class _UploadMultiImagesState extends State<UploadMultiImages> {
  List<XFile?> selectedImages=[null,null,null];
  Future<void> _uploadImages()async{
    final pickedImages=await ImagePicker().pickMultiImage(limit: 3);
    for(XFile image in pickedImages){
      selectedImages.add(image);
      setState(() {

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade900,
      body: Center(
        child: Column(
          spacing: 50,
          children: [
            SizedBox(height: 100),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 10,
                children: List.generate(selectedImages.length, (index){
                  return
                  Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                  ),
                    child:
                    selectedImages[index]==null?null:
                    ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(File(selectedImages[index]!.path,),fit: BoxFit.fill,)),
                  );
                }),
              ),
            ),
            GestureDetector(
              onTap: _uploadImages,
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Upload Image" ,
                    style: TextStyle(color: Colors.green, fontSize: 18),
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
