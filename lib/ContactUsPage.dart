import 'package:flutter/material.dart';
import 'main3.dart';

class ContactUsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactUsPage(),
    );
  }
}

class ContactUsPage extends StatefulWidget {
  @override
  _ContactUsPageState createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  String? successMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية بالصورة
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('image/image2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // التدرج فوق الصورة
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(224, 33, 149, 243),
                  Color.fromARGB(188, 255, 255, 255)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(
                  'مراسلتنا',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Icon(Icons.arrow_forward), // السهم إلى اليمين
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp2()),
                      ); // العودة إلى الصفحة السابقة
                    },
                  ),
                ],
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.end, // محاذاة الحقول لليمين
                  children: [
                    _buildTextField(
                      controller: nameController,
                      labelText: "اسمك",
                      hintText: "أدخل اسمك هنا",
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: emailController,
                      labelText: "بريدك الإلكتروني",
                      hintText: "example@email.com",
                    ),
                    SizedBox(height: 16),
                    _buildTextField(
                      controller: messageController,
                      labelText: "رسالتك",
                      hintText: "أدخل رسالتك هنا",
                      maxLines: 5,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: _submitForm,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "إرسال",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    if (successMessage != null)
                      Text(
                        successMessage!,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.right,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // وظيفة لبناء الحقول
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    String? hintText,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      textAlign: TextAlign.right, // النصوص المدخلة تبدأ من اليمين
      textDirection: TextDirection.rtl, // اتجاه النص بالكامل
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.white.withOpacity(0.9),
      ),
    );
  }

  // وظيفة الإرسال
  void _submitForm() {
    final name = nameController.text;
    final email = emailController.text;
    final message = messageController.text;

    if (name.isEmpty || email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "يرجى تعبئة جميع الحقول",
            textAlign: TextAlign.right,
          ),
          backgroundColor: Colors.blue,
        ),
      );
      return;
    }

    setState(() {
      successMessage = "تم الإرسال! شكرًا لك $name، سيتم الرد عليك قريبًا.";
      // تفريغ الحقول بعد الإرسال
      nameController.clear();
      emailController.clear();
      messageController.clear();
    });
  }
}
