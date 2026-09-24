import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  
  final _fullNameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _register() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              const Icon(Icons.check_circle_rounded, color: Colors.green, size: 28),
              const SizedBox(width: 10),
              Text('สมัครสมาชิกสำเร็จ', style: GoogleFonts.kanit(fontWeight: FontWeight.bold)),
            ],
          ),
          content: Text(
            'บัญชีผู้ใช้ของคุณถูกสร้างเรียบร้อยแล้ว กรุณาเข้าสู่ระบบ',
            style: GoogleFonts.kanit(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // close dialog
                Navigator.pop(context); // back to login
              },
              child: Text('ตกลง', style: GoogleFonts.kanit(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF0F172A), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'สมัครสมาชิก',
          style: GoogleFonts.kanit(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0F172A),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Subtitle Header
                Text(
                  'สร้างบัญชีใหม่สำหรับ FixU',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 24),

                // Field 1: ชื่อ-นามสกุล
                Text(
                  'ชื่อ - นามสกุล',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _fullNameController,
                  style: GoogleFonts.kanit(fontSize: 15),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกชื่อ-นามสกุล';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'นาย/นางสาว ชื่อ นามสกุล',
                    hintStyle: GoogleFonts.kanit(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: const Icon(Icons.badge_outlined, color: Color(0xFF1E3A8A)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field 2: รหัสนักศึกษา / บุคลากร
                Text(
                  'รหัสนักศึกษา / รหัสบุคลากร',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _studentIdController,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.kanit(fontSize: 15),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรหัสนักศึกษา';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: '6xxxxxxxxx',
                    hintStyle: GoogleFonts.kanit(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: const Icon(Icons.tag_rounded, color: Color(0xFF1E3A8A)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field 3: อีเมลสถาบัน
                Text(
                  'อีเมลสถาบัน',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.kanit(fontSize: 15),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกอีเมล';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'user@university.ac.th',
                    hintStyle: GoogleFonts.kanit(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF1E3A8A)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field 4: เบอร์โทรศัพท์
                Text(
                  'เบอร์โทรศัพท์',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.kanit(fontSize: 15),
                  decoration: InputDecoration(
                    hintText: '08X-XXX-XXXX',
                    hintStyle: GoogleFonts.kanit(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: const Icon(Icons.phone_outlined, color: Color(0xFF1E3A8A)),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field 5: รหัสผ่าน
                Text(
                  'รหัสผ่าน',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: GoogleFonts.kanit(fontSize: 15),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'กรุณากรอกรหัสผ่าน';
                    }
                    if (value.length < 6) {
                      return 'รหัสผ่านต้องมีความยาวอย่างน้อย 6 ตัวอักษร';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: GoogleFonts.kanit(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF1E3A8A)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Field 6: ยืนยันรหัสผ่าน
                Text(
                  'ยืนยันรหัสผ่าน',
                  style: GoogleFonts.kanit(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  style: GoogleFonts.kanit(fontSize: 15),
                  validator: (value) {
                    if (value != _passwordController.text) {
                      return 'รหัสผ่านไม่ตรงกัน';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: '••••••••',
                    hintStyle: GoogleFonts.kanit(color: Colors.grey[400], fontSize: 14),
                    prefixIcon: const Icon(Icons.lock_reset_rounded, color: Color(0xFF1E3A8A)),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: Colors.grey[600],
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Register Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'สมัครสมาชิก',
                      style: GoogleFonts.kanit(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Login Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'มีบัญชีผู้ใช้แล้ว? ',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: GoogleFonts.kanit(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF1E3A8A),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
