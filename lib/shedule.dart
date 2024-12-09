import 'package:flutter/material.dart';

final Map<String, Map<String, String>> departmentStageTables = {
  'علوم الحاسوب': {
    'المرحلة الأولى': 'image/computer_science_first.png',
    'المرحلة الثانية': 'image/computer_science_second.png',
    'المرحلة الثالثة': 'image/computer_science_third.png',
    'المرحلة الرابعة': 'image/computer_science_fourth.png',
  },
  'نظم المعلومات': {
    'المرحلة الأولى': 'image/information_systems_first.png',
    'المرحلة الثانية': 'image/information_systems_second.png',
    'المرحلة الثالثة': 'image/information_systems_third.png',
    'المرحلة الرابعة': 'image/information_systems_fourth.png',
  },
  'الأمن السيبراني': {
    'المرحلة الأولى': 'image/cybersecurity_first.png',
    'المرحلة الثانية': 'image/cybersecurity_second.png',
  },
  'الأنظمة الطبية': {
    'المرحلة الأولى': 'image/medical_systems_first.png',
    'المرحلة الثانية': 'image/medical_systems_second.png',
  },
};

class ImageViewer extends StatelessWidget {
  final String stage;
  final String department;

  ImageViewer({required this.stage, required this.department});

  @override
  Widget build(BuildContext context) {
    String? imagePath = departmentStageTables[department]?[stage];

    return Scaffold(
      appBar: AppBar(
        title: Text('$stage - $department'),
      ),
      body: Center(
        child: imagePath != null
            ? GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FullScreenImage(imagePath: imagePath),
                  ),
                ),
                child: Image.asset(imagePath),
              )
            : Text('لم يتم العثور على الصورة لهذا الجدول'),
      ),
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imagePath;

  FullScreenImage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, 
      body: Center(
        child: GestureDetector(
          onTap: () =>
              Navigator.pop(context), 
          child: InteractiveViewer(
            panEnabled: true, 
            scaleEnabled: true, 
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, 
            ),
          ),
        ),
      ),
    );
  }
}
