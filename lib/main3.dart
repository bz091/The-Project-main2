import 'package:flutter/material.dart';
import 'Drawer2.dart';
import 'b.dart';

void main() {
  runApp(MyApp2());
}

class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> departments = [
    'علوم الحاسوب',
    'نظم المعلومات',
    'الأمن السيبراني',
    'الأنظمة الطبية',
  ];

  List<Color> colors = [
    Color(0xff2196F3),
    Color(0xff81C784),
    Color(0xffFF9800),
    Color(0xffEF5350),
  ];

  List<IconData> icons = [
    Icons.computer,
    Icons.info,
    Icons.security,
    Icons.health_and_safety,
  ];

  List<bool> _expandedDepartments = List.filled(4, false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                  'الصفحة الرئيسية',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Color(0xff2196F3),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              drawer: MyDrawer(),
              body: SafeArea(
                child: ListView.builder(
                  itemCount: departments.length,
                  itemBuilder: (context, index) {
                    return _buildDepartmentCard(
                      departments[index],
                      colors[index],
                      icons[index],
                      departments[index],
                      index,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentCard(String department, Color color, IconData icon,
      String departments, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          for (int i = 0; i < _expandedDepartments.length; i++) {
            _expandedDepartments[i] =
                (i == index) ? !_expandedDepartments[i] : false;
          }
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        margin: EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 30),
                SizedBox(width: 10),
                Text(
                  department,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
           if (_expandedDepartments[index]) ...[
              B(
                departments: departments,
                text1: 'الجدول',
                text2: 'الأوائل',
                text3: 'مشاريع التخرج',
                stage1: 'المرحلة الأولى',
                stage2: 'المرحلة الثانية',
                stage3: 'المرحلة الثالثة',
                stage4: 'المرحلة الرابعة',
              ),
            ]
          ],
        ),
      ),
    );
  }
}
