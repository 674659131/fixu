import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'repair_form_screen.dart';
import 'status_detail_screen.dart';
import '../models/repair_item.dart';

class HomeScreen extends StatelessWidget {
  final Function(int)? onNavigateToTab;

  const HomeScreen({super.key, this.onNavigateToTab});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: const Color(0xFF1E3A8A).withOpacity(0.1),
                    child: const Icon(
                      Icons.person,
                      size: 34,
                      color: Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'สวัสดี',
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'นางสาวกุลภัสส์ เปี้ยวน้อย',
                          style: GoogleFonts.kanit(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        Text(
                          'ยินดีต้อนรับสู่ FixU',
                          style: GoogleFonts.kanit(
                            fontSize: 13,
                            color: const Color(0xFF1E3A8A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Notification icon badge
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('คุณมี 2 การแจ้งเตือนใหม่', style: GoogleFonts.kanit()),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: const Icon(Icons.notifications_outlined, size: 28, color: Color(0xFF1E3A8A)),
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: const Text(
                            '2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Notification Banner Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFBFDBFE)),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications_active_rounded,
                      color: Color(0xFF1D4ED8),
                      size: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'มีเรื่องแจ้งเตือน 2 รายการ',
                        style: GoogleFonts.kanit(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF1E40AF),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: Color(0xFF1D4ED8),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Main Menu Section
              Text(
                'เมนูหลัก',
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 14),

              // Grid of 6 Main Menu Items
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 14,
                childAspectRatio: 0.95,
                children: [
                  _buildMenuItem(
                    context: context,
                    title: 'แจ้งซ่อม',
                    icon: Icons.build_rounded,
                    color: const Color(0xFF2563EB),
                    bgColor: const Color(0xFFDBEAFE),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const RepairFormScreen(),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context: context,
                    title: 'ติดตามสถานะ',
                    icon: Icons.track_changes_rounded,
                    color: const Color(0xFF0D9488),
                    bgColor: const Color(0xFFCCFBF1),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StatusDetailScreen(
                            item: RepairItem.sampleData[0],
                          ),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context: context,
                    title: 'ประวัติการแจ้ง',
                    icon: Icons.history_rounded,
                    color: const Color(0xFFD97706),
                    bgColor: const Color(0xFFFEF3C7),
                    onTap: () {
                      if (onNavigateToTab != null) {
                        onNavigateToTab!(2); // History Tab
                      }
                    },
                  ),
                  _buildMenuItem(
                    context: context,
                    title: 'ข่าวสาร',
                    icon: Icons.newspaper_rounded,
                    color: const Color(0xFF7C3AED),
                    bgColor: const Color(0xFFEDE9FE),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('หน้าข่าวสารและประกาศ', style: GoogleFonts.kanit()),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  _buildMenuItem(
                    context: context,
                    title: 'ข้อมูลส่วนตัว',
                    icon: Icons.person_rounded,
                    color: const Color(0xFF4F46E5),
                    bgColor: const Color(0xFFE0E7FF),
                    onTap: () {
                      if (onNavigateToTab != null) {
                        onNavigateToTab!(3); // Profile Tab
                      }
                    },
                  ),
                  _buildMenuItem(
                    context: context,
                    title: 'ตั้งค่า',
                    icon: Icons.settings_rounded,
                    color: const Color(0xFF475569),
                    bgColor: const Color(0xFFF1F5F9),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('ตั้งค่าระบบ', style: GoogleFonts.kanit()),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // Announcements Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ประกาศล่าสุด',
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'ดูทั้งหมด >',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF2563EB),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),

              // Announcement Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF3C7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.bolt_rounded,
                        color: Color(0xFFD97706),
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'แจ้งปรับปรุงระบบไฟฟ้า',
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'อาคารเรียนรวม ชั้น 2',
                            style: GoogleFonts.kanit(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.calendar_today_rounded, size: 13, color: Colors.grey[500]),
                              const SizedBox(width: 4),
                              Text(
                                '1-5 มิ.ย. 2567',
                                style: GoogleFonts.kanit(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color color,
    required Color bgColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 26,
                color: color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.kanit(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF1E293B),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
