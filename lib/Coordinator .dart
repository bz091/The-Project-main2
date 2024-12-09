import 'package:flutter/material.dart';
import 'notifications.dart';
import 'Post_schedule.dart';
import 'drawer3.dart';

void main() {
  runApp(Coordinator());
}

class Coordinator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image/image2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(180, 33, 149, 243),
                Color.fromARGB(188, 255, 255, 255)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
              child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                'الصفحة الرئيسية',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Color(0xff2196F3),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            body: Container(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    information(),
                    SizedBox(
                      height: 20,
                    ),
                    _buildCard('إضافة تبليغ', Color.fromARGB(255, 234, 178, 87),
                        Icons.notifications, 1),
                    _buildCard('الجداول', Color.fromARGB(210, 146, 206, 249),
                        Icons.calendar_today, 2),
                    _buildCard('المشاريع', Color.fromARGB(200, 13, 194, 131),
                        Icons.assignment, 3),
                    _buildCard('الأوائل', Color.fromARGB(180, 248, 150, 204),
                        Icons.star, 4),
                  ],
                ),
              ),
            ),
            drawer: MyDrawer(),
          ))),
    ]));
  }

  Widget information() {
    return Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(5, 6),
            )
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Color(0xFF0D47A1),
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '  مقرر القسم',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    ' الاسم  ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]));
  }

  Widget _buildCard(String text, color, IconData icon, int index) {
    return InkWell(
        onTap: () {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotificationPage(),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyApp6(),
              ),
            );
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color,
                color,
              ],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(5, 6),
              )
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 30),
              SizedBox(width: 15),
              Text(
                text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ));
  }
}
