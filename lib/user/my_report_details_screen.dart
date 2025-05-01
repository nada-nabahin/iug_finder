// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';

class MyReportDetailsScreen extends StatefulWidget {
  @override
  _MyReportDetailsScreenState createState() => _MyReportDetailsScreenState();
}

class _MyReportDetailsScreenState extends State<MyReportDetailsScreen> {
  bool isEditing = false;

  String reportNumber = 'L/00001';
  String reportStatus = 'فاقد';
  String itemType = 'جهاز';
  String category = 'لابتوب';
  String color = 'أسود';
  String location = 'مبنى المكتبة - الطابق الأول';
  String dateTime = '10/03/2025 - 14:30';
  String description =
      'تم فقدان محفظة جلدية سوداء اللون في حالة جيدة تحتوي على العلامات المميزة مثل التطريز';
  String studentName = 'غيداء أبو شعر';
  String studentId = '220204050';
  String studentEmail = 'gadaa@gmail.com';

  TextEditingController locationController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    locationController.text = location;
    dateTimeController.text = dateTime;
    descriptionController.text = description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Transform.flip(
                flipX: true,
                child: Icon(Icons.west, size: 24, color: Colors.white),
              ),
            ),
            SizedBox(width: 2),
            Transform.translate(
              offset: Offset(0, -2),
              child: Text(
                'تفاصيل بلاغي',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.4,
                  letterSpacing: -0.01,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            if (!isEditing)
              TextButton(
                onPressed: () {
                  setState(() {
                    isEditing = true;
                  });
                },
                child: Text(
                  'تعديل',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
        automaticallyImplyLeading: false,
        toolbarHeight: 94,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2567E8), Color(0xFF1CE6DA)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildImageContainer(),

              buildDetailsContainer(),

              SizedBox(height: 20),

              buildDescriptionContainer(),

              SizedBox(height: 20),

              buildStudentInfoContainer(),

              if (isEditing) buildSaveDeleteButtons(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: myBottomNavigationBar(),
    );
  }

  Widget myBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Color(0xFF32ADE6),
      unselectedItemColor: Color(0xFF32ADE6),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 40, color: Color(0xFF32ADE6)),
            label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "/home");
            break;
          case 1:
            Navigator.pushNamed(context, "/notifications");
            break;
          case 2:
            Navigator.pushNamed(context, "/add_report");
            break;
          case 3:
            Navigator.pushNamed(context, "/calls");
            break;
          case 4:
            Navigator.pushNamed(context, "/profile");
            break;
        }
      },
    );
  }

  Widget buildImageContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFD2F1F9), width: 1),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'صورة البلاغ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2298E3),
              ),
            ),
          ),
          SizedBox(height: 4),
          Divider(color: Color(0xFFD2F1F9), thickness: 1),
          SizedBox(height: 12),
          Center(
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: AssetImage('assets/laptopBlack.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDetailsContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFD2F1F9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'تفاصيل البلاغ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2298E3),
            ),
          ),
          SizedBox(height: 4),
          Divider(color: Color(0xFFD2F1F9), thickness: 1),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: buildInfoField('رقم البلاغ', reportNumber)),
              SizedBox(width: 16), // بس فاصل صغير
              Expanded(child: buildInfoField('حالة البلاغ', reportStatus)),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(child: buildInfoField('نوع الغرض', itemType)),
              SizedBox(width: 16), // بس فاصل صغير
              Expanded(child: buildInfoField('التصنيف', category)),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: buildEditableField('المكان والموقع', locationController),
              ),
              SizedBox(width: 16),
              Expanded(
                child: buildInfoField('اللون', color),
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: buildEditableField('التاريخ والوقت', dateTimeController),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDescriptionContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFD2F1F9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'الوصف',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2298E3),
            ),
          ),
          SizedBox(height: 4),
          Divider(color: Color(0xFFD2F1F9), thickness: 1),
          SizedBox(height: 12),
          Center(
            child: Container(
              width: double.infinity,
              child: isEditing
                  ? TextField(
                      controller: descriptionController,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 12, color: Color(0xFF2298E3)),
                      textAlign: TextAlign.right,
                    )
                  : Text(
                      descriptionController.text,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF2298E3),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildStudentInfoContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xFFD2F1F9), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'بيانات الطالب',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2298E3),
            ),
          ),
          SizedBox(height: 4),
          Divider(color: Color(0xFFD2F1F9), thickness: 1),
          SizedBox(height: 20),
          Row(
            children: [
              buildInfoField('اسم الطالب', studentName),
              SizedBox(width: 70),
              buildInfoField('الرقم الجامعي', studentId),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              buildInfoField('البريد الإلكتروني', studentEmail),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSaveDeleteButtons() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                location = locationController.text;
                dateTime = dateTimeController.text;
                description = descriptionController.text;
                isEditing = false;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF1D61E7),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('حفظ',
                style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('تأكيد الحذف'),
                    content: Text('هل أنت متأكد أنك تريد حذف هذا البلاغ؟'),
                    actions: [
                      TextButton(
                        child:
                            Text('إلغاء', style: TextStyle(color: Colors.grey)),
                        onPressed: () {
                          Navigator.of(context).pop();  
                        },
                      ),
                      TextButton(
                        child: Text('حذف', style: TextStyle(color: Colors.red)),
                        onPressed: () {

                          Navigator.of(context).pop(); 
                          Navigator.pushReplacementNamed(context,
                              "/my_reports"); 
                        },
                      ),
                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 219, 5, 37),
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('حذف',
                style: TextStyle(color: Colors.white, fontSize: 14)),
          ),
        ],
      ),
    );
  }

  Widget buildInfoField(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        SizedBox(height: 2),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          child: Text(
            value,
            style: TextStyle(fontSize: 12, color: Color(0xFF2298E3)),
          ),
        ),
      ],
    );
  }

  Widget buildEditableField(String title, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54),
        ),
        SizedBox(height: 2),
        isEditing
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                style: TextStyle(fontSize: 12, color: Color(0xFF2298E3)),
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Text(
                  controller.text,
                  style: TextStyle(fontSize: 12, color: Color(0xFF2298E3)),
                ),
              ),
      ],
    );
  }
}
