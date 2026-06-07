import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  XFile? selectedVideo;
  VideoPlayerController? _videoPlayerController;
  Future<void> _uploadVideo() async {
    final pickedVideo = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedVideo != null) {
      _videoPlayerController = VideoPlayerController.file(
        File(pickedVideo.path),
      );
      await _videoPlayerController?.initialize();
    }
    setState(() {
      selectedVideo = pickedVideo;
    });
    _videoPlayerController!.play();
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          spacing: 50,
          children: [
            SizedBox(height: 100),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 250,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    _videoPlayerController != null &&
                        _videoPlayerController!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController!.value.aspectRatio,
                        child: ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(10),
                            child: VideoPlayer(_videoPlayerController!,),),
                      )
                    : null,
              ),
            ),
            GestureDetector(
              onTap: _uploadVideo,
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Upload Video",
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
