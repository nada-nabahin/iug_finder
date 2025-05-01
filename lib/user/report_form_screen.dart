// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'my_report_details_screen.dart';

class ReportFormScreen extends StatefulWidget {
  @override
  _ReportFormScreenState createState() => _ReportFormScreenState();
}

class _ReportFormScreenState extends State<ReportFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedColor;
  String? description;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final List<String> buildings = ["المبنى A", "المبنى B", "المبنى C"];

  String? selectedBuilding;
  String? selectedPlace;
  String reportType = "فاقد";

  final List<String> categories = ["إلكترونيات", "ملابس", "كتب", "غير ذلك"];
  final List<String> subCategories = ["إلكترونيات", "ملابس", "كتب", "غير ذلك"];
  final List<String> colors = ["أحمر", "أخضر", "أبيض"];

  bool showCustomCategory = false;
  bool showCustomSubCategory = false;

  TextEditingController customCategoryController = TextEditingController();
  TextEditingController customSubCategoryController = TextEditingController();

  // Image handling variables
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyReportDetailsScreen()),
                );
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
                "إضافة بلاغ جديد",
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.4,
                  letterSpacing: -0.01,
                  color: Colors.white,
                ),
              ),
            )
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                width: 291,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          reportType = "فاقد";
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Radio(
                              value: "فاقد",
                              groupValue: reportType,
                              onChanged: (value) {
                                setState(() {
                                  reportType = value.toString();
                                });
                              },
                              activeColor: Color(0xFF30B0C7),
                              visualDensity: VisualDensity.compact,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "بلاغ فاقد",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: reportType == "فاقد"
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          reportType = "موجود";
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25),
                        child: Row(
                          children: [
                            Radio(
                              value: "موجود",
                              groupValue: reportType,
                              onChanged: (value) {
                                setState(() {
                                  reportType = value.toString();
                                });
                              },
                              activeColor: Color(0xFF30B0C7),
                              visualDensity: VisualDensity.compact,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "بلاغ موجود",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: reportType == "موجود"
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildDropdownField(
                "النوع",
                categories,
                selectedCategory,
                (value) => setState(() {
                  selectedCategory = value;
                  showCustomCategory = value == "غير ذلك";
                }),
                18,
                showCustomField: showCustomCategory,
                customController: customCategoryController,
              ),
              SizedBox(height: 10),
              _buildDropdownField(
                "التصنيف",
                subCategories,
                selectedSubCategory,
                (value) => setState(() {
                  selectedSubCategory = value;
                  showCustomSubCategory = value == "غير ذلك";
                }),
                18,
                showCustomField: showCustomSubCategory,
                customController: customSubCategoryController,
              ),
              SizedBox(height: 10),
              _buildDropdownField("اللون", colors, selectedColor,
                  (value) => setState(() => selectedColor = value), 18),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 0),
                    child: Padding(
                      padding: EdgeInsets.only(right: 18),
                      child: RichText(
                        text: TextSpan(
                          text: "التاريخ والوقت ",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "*",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            hintText: "اختر التاريخ",
                            filled: true,
                            fillColor: Color(0xFFD2F1F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(fontSize: 12),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2030),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                            }
                          },
                          controller: TextEditingController(
                            text: selectedDate == null
                                ? ""
                                : DateFormat('yyyy-MM-dd')
                                    .format(selectedDate!),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            hintText: "اختر الوقت",
                            filled: true,
                            fillColor: Color(0xFFD2F1F9),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(fontSize: 12),
                          onTap: () async {
                            TimeOfDay? pickedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (pickedTime != null) {
                              setState(() {
                                selectedTime = pickedTime;
                              });
                            }
                          },
                          controller: TextEditingController(
                            text: selectedTime == null
                                ? ""
                                : selectedTime!.format(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(right: 18),
                child: RichText(
                  text: TextSpan(
                    text: "المبنى والمكان ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "*",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      child: DropdownButtonFormField<String>(
                        value: selectedBuilding,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Color(0xFFD2F1F9),
                        ),
                        items: buildings.map((building) {
                          return DropdownMenuItem(
                            value: building,
                            child:
                                Text(building, style: TextStyle(fontSize: 12)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedBuilding = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 60,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 16),
                          filled: true,
                          fillColor: Color(0xFFD2F1F9),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: TextStyle(fontSize: 12),
                        onChanged: (value) =>
                            setState(() => selectedPlace = value),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildDescriptionTextField(),
              SizedBox(height: 20),
              Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 270, height: 53),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم إرسال البلاغ!')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1D61E7),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "إرسال",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
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

  Widget _buildDropdownField(String label, List<String> items, String? value,
      Function(String?) onChanged, double paddingValue,
      {bool showCustomField = false, TextEditingController? customController}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: paddingValue),
          child: RichText(
            text: TextSpan(
              text: "$label ",
              style: TextStyle(color: Colors.black, fontSize: 16),
              children: [
                TextSpan(
                  text: "*",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 5),
        DropdownButtonFormField(
          isExpanded: true,
          value: value,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: InputBorder.none,
            filled: true,
            fillColor: Color(0xFFD2F1F9),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.transparent),
            ),
          ),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: TextStyle(fontSize: 14)),
            );
          }).toList(),
          onChanged: (newValue) {
            onChanged(newValue);
          },
        ),
        if (showCustomField) ...[
          const SizedBox(height: 10),
          TextFormField(
            controller: customController,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              filled: false,
              fillColor: Color(0xFFD2F1F9),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFD2F1F9)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Color(0xFFD2F1F9), width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.red, width: 2),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildDescriptionTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // وصف البلاغ مع النجمة (*)
        Padding(
          padding: EdgeInsets.only(right: 18),
          child: RichText(
            text: TextSpan(
              text: "وصف البلاغ ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: "*",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
          decoration: BoxDecoration(
            color: Color(0xFFD2F1F9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "أدخل وصف البلاغ",
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
            ),
            maxLines: 3,
            onChanged: (value) => setState(() => description = value),
          ),
        ),

        SizedBox(height: 15),
        Padding(
          padding: EdgeInsets.only(right: 18),
          child: RichText(
              text: TextSpan(
            text: "إضافة صورة",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )),
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFD2F1F9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: _selectedImage == null
                  ? Center(
                      child:
                          Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        _selectedImage!,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
        ),

        if (_selectedImage != null)
          TextButton(
            onPressed: () {
              setState(() {
                _selectedImage = null;
              });
            },
            child: Text(
              "إزالة الصورة",
              style: TextStyle(color: Colors.red),
            ),
          ),
      ],
    );
  }

  Widget _buildDescriptionField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "أدخل وصف البلاغ",
        filled: true,
        fillColor: Color(0xFFD2F1F9),
      ),
      maxLines: 3,
      onChanged: (value) => setState(() => description = value),
    );
  }
}
