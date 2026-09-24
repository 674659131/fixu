import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'โปรไฟล์',
          style: GoogleFonts.kanit(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0F172A),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              // Avatar
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: const Color(0xFF1E3A8A).withOpacity(0.1),
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2563EB),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_rounded,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'นางสาวกุลภัสส์ เปี้ยวน้อย',
                style: GoogleFonts.kanit(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),
              Text(
                'รหัสนักศึกษา: 650110123',
                style: GoogleFonts.kanit(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),

              // Profile Details Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _buildInfoRow(
                      icon: Icons.school_rounded,
                      label: 'คณะ',
                      value: 'เทคโนโลยีสารสนเทศ',
                    ),
                    const Divider(height: 24),
                    _buildInfoRow(
                      icon: Icons.email_rounded,
                      label: 'อีเมล',
                      value: 'kulaphat.p@university.ac.th',
                    ),
                    const Divider(height: 24),
                    _buildInfoRow(
                      icon: Icons.phone_rounded,
                      label: 'เบอร์โทรศัพท์',
                      value: '081-234-5678',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Action Buttons
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: const Icon(Icons.edit_rounded, color: Color(0xFF2563EB)),
                title: Text(
                  'แก้ไขข้อมูลส่วนตัว',
                  style: GoogleFonts.kanit(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                onTap: () {},
              ),
              const SizedBox(height: 12),
              ListTile(
                tileColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: const Icon(Icons.lock_rounded, color: Color(0xFF2563EB)),
                title: Text(
                  'เปลี่ยนรหัสผ่าน',
                  style: GoogleFonts.kanit(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right_rounded, color: Colors.grey),
                onTap: () {},
              ),
              const SizedBox(height: 28),

              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  icon: const Icon(Icons.logout_rounded, size: 20, color: Colors.red),
                  label: Text(
                    'ออกจากระบบ',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFEE2E2),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 22, color: const Color(0xFF2563EB)),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.kanit(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              Text(
                value,
                style: GoogleFonts.kanit(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
