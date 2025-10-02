import 'package:flutter/material.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({Key? key}) : super(key: key);

  @override
  _TeacherDashboardScreenState createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  static const teacherInfo = {
    'name': 'John Doe',
    'id': 'T123456',
  };

  static const days = [
    "Time",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday"
  ];

  static const timetable = [
    ["8:00 - 9:00", "DAA (B-019)", "", "CN (B-207)", "SE (A-216)", ""],
    [
      "9:00 - 10:00",
      "SE (B-019)",
      "CN Lab (B-102L)",
      "DAA (B-207)",
      "DAA Lab (A-204L)",
      "SE (B-101)"
    ],
    [
      "10:00 - 11:00",
      "EE (B-019)",
      "CN Lab (B-102L)",
      "EE (B-207)",
      "DAA Lab (A-204L)",
      "CN (B-101)"
    ],
    ["11:00 - 12:00", "DOS (A-201)", "EE (B-310)", "", "", "DMDW (A-106)"],
    ["12:00 - 1:00", "DMDW (A-106)", "CN (B-310)", "DOS (A-201)", "", ""],
    ["1:00 - 2:00", "", "", "DMDW (A-106)", "DOS (A-201)", ""],
    ["2:00 - 3:00", "", "", "", "", ""],
    ["3:15 - 4:15", "", "DAA (A-308)", "", "", ""],
    ["4:15 - 5:15", "", "SE (A-308)", "", "", ""],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF6FF),
      body: Row(
        children: [
          // Sidebar
          Container(
            width: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x263B82F6),
                    blurRadius: 18,
                    offset: Offset(4, 0)),
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Teacher Dashboard',
                    style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 30),
                SidebarLink(
                    icon: Icons.event_note,
                    label: 'Daily Attendance',
                    onTap: () {}),
                SidebarLink(
                    icon: Icons.assignment, label: 'Assignments', onTap: () {}),
                SidebarLink(
                    icon: Icons.upload_file,
                    label: 'Upload Marks',
                    onTap: () {}),
                SidebarLink(
                    icon: Icons.person,
                    label: 'Substitute Teacher',
                    onTap: () {}),
                SidebarLink(
                    icon: Icons.group, label: 'Class Roster', onTap: () {}),
                SidebarLink(
                    icon: Icons.announcement,
                    label: 'Announcements',
                    onTap: () {}),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Teacher Info
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(
                              top: 48, left: 80, right: 24, bottom: 24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x15003B82F6),
                                  blurRadius: 16,
                                  offset: Offset(0, 6))
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Teacher Information',
                                  style: TextStyle(
                                      color: Color(0xFF2563EB),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600)),
                              const SizedBox(height: 12),
                              Text('Name: ${teacherInfo['name']}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black)),
                              Text('ID: ${teacherInfo['id']}',
                                  style: const TextStyle(
                                      fontSize: 16, color: Colors.black)),
                            ],
                          ),
                        ),
                        Positioned(
                          top: -32,
                          left: 24,
                          child: Icon(Icons.account_circle,
                              size: 64,
                              color: const Color(0xFF3B82F6).withOpacity(0.9)),
                        )
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Timetable
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              color: Color(0x15003B82F6),
                              blurRadius: 16,
                              offset: Offset(0, 6))
                        ],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Weekly Routine',
                              style: TextStyle(
                                  color: Color(0xFF2563EB),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 12),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: days.length +
                                timetable.length * timetable[0].length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2,
                              childAspectRatio: 3,
                            ),
                            itemBuilder: (context, index) {
                              if (index < days.length) {
                                // Header Cells
                                return Container(
                                  alignment: Alignment.center,
                                  color: const Color(0xFF3B82F6),
                                  child: Text(days[index],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                );
                              } else {
                                int pos = index - days.length;
                                int row = pos ~/ 6;
                                int col = pos % 6;
                                bool isTimeCell = col == 0;
                                String text = timetable[row][col].isEmpty
                                    ? "X"
                                    : timetable[row][col];
                                return Container(
                                  alignment: Alignment.center,
                                  color: isTimeCell
                                      ? const Color(0xFFE0E7FF)
                                      : Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Text(
                                    text,
                                    style: TextStyle(
                                      color: isTimeCell
                                          ? const Color(0xFF2563EB)
                                          : const Color(0xFF2563EB),
                                      fontWeight: isTimeCell
                                          ? FontWeight.w600
                                          : FontWeight.normal,
                                    ),
                                  ),
                                );
                              }
                            },
                          )
                        ],
                      ),
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
}

class SidebarLink extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SidebarLink(
      {Key? key, required this.icon, required this.label, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xFF60A5FA), Color(0xFF3B82F6)]),
          boxShadow: [
            BoxShadow(
                color: const Color(0x1A3B82F6), blurRadius: 8, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 12),
            Text(label,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
