import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main_navigation_screen.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback? onLoginSuccess;

  const LoginScreen({super.key, this.onLoginSuccess});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _handleLogin() {
    // Validate form inputs before allowing login
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      // Check if password has minimum length or criteria
      if (password.length < 4) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red[600],
            content: Text(
              'รหัสผ่านต้องมีความยาวอย่างน้อย 4 ตัวอักษร',
              style: GoogleFonts.kanit(color: Colors.white),
            ),
          ),
        );
        return;
      }

      // Success Toast Notification
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green[700],
          duration: const Duration(seconds: 1),
          content: Text(
            'เข้าสู่ระบบสำเร็จ ยินดีต้อนรับ $username',
            style: GoogleFonts.kanit(color: Colors.white),
          ),
        ),
      );

      if (widget.onLoginSuccess != null) {
        widget.onLoginSuccess!();
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MainNavigationScreen()),
        );
      }
    }
  }

  void _handleGoogleLogin() {
    // Google Login preset demo action
    setState(() {
      _usernameController.text = 'kulaphat.p@university.ac.th';
      _passwordController.text = '123456';
    });
    _handleLogin();
  }

  void _goToRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28.0, vertical: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  // App Brand Logo Icon
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E3A8A).withOpacity(0.08),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Container(
                        width: 68,
                        height: 68,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1E3A8A),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.build_rounded,
                          size: 36,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // App Title
                  Text(
                    'FixU',
                    style: GoogleFonts.kanit(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E3A8A),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Subtitle
                  Text(
                    'แอปแจ้งซ่อมในมหาวิทยาลัย',
                    style: GoogleFonts.kanit(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Demo Account Hint Card
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFBFDBFE)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline_rounded, size: 20, color: Color(0xFF1D4ED8)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'บัญชีสำหรับทดสอบ:\nรหัสนักศึกษา: 650110123 / รหัสผ่าน: 123456',
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              color: const Color(0xFF1E40AF),
                              height: 1.3,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Username / Email Label
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'อีเมล หรือ รหัสนักศึกษา',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Username Field
                  TextFormField(
                    controller: _usernameController,
                    style: GoogleFonts.kanit(fontSize: 15),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'กรุณากรอกอีเมล หรือ รหัสนักศึกษา';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: '6xxxxxxxxx หรือ user@university.ac.th',
                      hintStyle: GoogleFonts.kanit(color: Colors.grey[400], fontSize: 14),
                      prefixIcon: const Icon(Icons.person_outline, color: Color(0xFF1E3A8A)),
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Password Label
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'รหัสผ่าน',
                      style: GoogleFonts.kanit(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Password Field
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: GoogleFonts.kanit(fontSize: 15),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'กรุณากรอกรหัสผ่านก่อนเข้าสู่ระบบ';
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
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red, width: 1),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.red, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 26),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _handleLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1E3A8A),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: GoogleFonts.kanit(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),

                  // Divider "หรือ"
                  Row(
                    children: [
                      Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          'หรือ',
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      Expanded(child: Divider(color: Colors.grey[300], thickness: 1)),
                    ],
                  ),
                  const SizedBox(height: 18),

                  // Google Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: _handleGoogleLogin,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Color(0xFFEA4335),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'G',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            'เข้าสู่ระบบด้วย Google',
                            style: GoogleFonts.kanit(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ยังไม่มีบัญชี? ',
                        style: GoogleFonts.kanit(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                      GestureDetector(
                        onTap: _goToRegister,
                        child: Text(
                          'สมัครสมาชิก',
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF1E3A8A),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
