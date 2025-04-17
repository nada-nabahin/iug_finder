import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'بلاغات',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Cairo'),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, String>> allReports = [
    {
      'status': 'مفقود',
      'reportNumber': 'سارة محمد',
      'date': '13 يناير 2023',
      'time': '3:33 مساءً',
      'itemDescription': 'لابتوب',
      'station': 'مبنى IT',
      'imageUrl':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSc0fMjOVJf0_sIIIWfeEnaidbibryNOhOGVQ&s',
    },
    {
      'status': 'موجود',
      'reportNumber': 'زياد عمر',
      'date': '14 يناير 2023',
      'time': '4:44 مساءً',
      'itemDescription': 'شاحن لابتوب',
      'station': 'مبنى اللحيدان',
      'imageUrl': 'https://cdn-icons-png.flaticon.com/512/145/145974.png',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      if (_tabController.index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ReportsScreen()),
        );
        _tabController.index = 1;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                    top: 18, right: 20, left: 20, bottom: 5),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff1569c7), Colors.cyanAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'الرئيسية',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 22),
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Colors.white,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelStyle: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                      tabs: const [
                        Tab(text: 'بلاغاتي'),
                        Tab(text: 'كل البلاغات'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            child: Row(
              children: [
                Container(
                  height: 48,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: const Color(0xffC7EDF7),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.tune, color: Color(0xff999999)),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: TextField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: '...ابحث عما تريد',
                        hintStyle: const TextStyle(
                            fontSize: 15, color: Color(0xff6C7278)),
                        prefixIcon: const Icon(Icons.search,
                            color: Color(0xff6C7278), size: 30),
                        filled: true,
                        fillColor: const Color(0xffC7EDF7),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Container(),
                ListView.builder(
                  itemCount: allReports.length,
                  itemBuilder: (context, index) {
                    return buildReportCard(allReports[index]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,
                size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone, size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
        ],
        selectedItemColor: const Color(0xff30B0C7),
        unselectedItemColor: const Color(0xff30B0C7).withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  Widget buildReportCard(Map<String, String> report) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 2),
                        decoration: BoxDecoration(
                          color: report['status'] == 'مفقود'
                              ? Colors.red
                              : Colors.green,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(10)),
                        ),
                        child: Text(
                          report['status']!,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 11),
                        ),
                      ),
                      Text(
                        report['reportNumber']!,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.calendar_month_outlined,
                              size: 16, color: Color(0xff30B0C7)),
                          const SizedBox(width: 4),
                          Text(report['date']!,
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.category_outlined,
                              size: 16, color: Color(0xff30B0C7)),
                          const SizedBox(width: 20),
                          Text(report['itemDescription']!,
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              size: 16, color: Color(0xff30B0C7)),
                          const SizedBox(width: 4),
                          Text(report['time']!,
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined,
                              size: 16, color: Color(0xff30B0C7)),
                          const SizedBox(width: 4),
                          Text(report['station']!,
                              style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                report['imageUrl']!,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReportsScreen extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {
      'status': 'مفقود',
      'type': 'محفظة',
      'date': '20/10/2024',
      'location': 'مبنى الحيدان',
      'desc':
          'تم فقدان محفظة جلدية سوداء اللون في حالة جيدة تحتوي على العلامات المميزة مثل التطريز'
    },
    {
      'status': 'موجود',
      'type': 'حقيبة',
      'date': '6/10/2024',
      'location': 'مبنى المكتبة',
      'desc':
          'تم فقدان حقيبة يد قماشية باللون الازرق الداكن تحتوي على جيب امامي صغير وسحاب رئيسي'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff1569c7), Colors.cyanAccent]),
            ),
            child: const Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 40, bottom: 15),
                child: Text('بلاغاتي',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return ReportCard(
            status: report['status']!,
            type: report['type']!,
            date: report['date']!,
            location: report['location']!,
            desc: report['desc']!,
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications,
                size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle,
                size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone, size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30, color: const Color(0xff30B0C7)),
            label: '',
          ),
        ],
        selectedItemColor: const Color(0xff30B0C7),
        unselectedItemColor: const Color(0xff30B0C7).withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String status, type, date, location, desc;

  const ReportCard({
    required this.status,
    required this.type,
    required this.date,
    required this.location,
    required this.desc,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Color(0xff30B0C7), width: 1)),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 42, vertical: 10),
                      decoration: BoxDecoration(
                          color: Color(0xff00C7BE),
                          borderRadius: BorderRadius.circular(9)),
                      child: Text(type,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 70),
                        child: Text(desc,
                            style: TextStyle(
                                fontSize: 15, color: Color(0xff30B0C7)),
                            textAlign: TextAlign.end),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15, bottom: 15),
                      child: Column(
                        children: [
                          Text(date,
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff30B0C7))),
                          Text(location,
                              style: TextStyle(
                                  fontSize: 16, color: Color(0xff30B0C7))),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
                color: status == 'مفقود' ? Colors.red : Color(0xff00C7BE),
              ),
              child: Text(status,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
