import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepairFormScreen extends StatefulWidget {
  const RepairFormScreen({super.key});

  @override
  State<RepairFormScreen> createState() => _RepairFormScreenState();
}

class _RepairFormScreenState extends State<RepairFormScreen> {
  final _formKey = GlobalKey<FormState>();
  
  String _selectedLocation = 'อาคารเรียนรวม ห้อง 305';
  String _selectedCategory = 'เครื่องปรับอากาศ';
  final TextEditingController _detailController = TextEditingController(
    text: 'แอร์ไม่เย็น เปิดแล้วไม่ค่อยมีลม',
  );
  String _selectedUrgency = 'ปกติ';

  final List<String> _locations = [
    'อาคารเรียนรวม ห้อง 305',
    'อาคารเรียนรวม ชั้น 1',
    'อาคารเรียนรวม ชั้น 2',
    'อาคารเรียนรวม ห้อง 101',
    'หอพักนักศึกษา อาคาร A',
    'อาคารอำนวยการ',
  ];

  final List<String> _categories = [
    'เครื่องปรับอากาศ',
    'ไฟฟ้า',
    'ประปา',
    'โต๊ะ/เก้าอี้',
    'อุปกรณ์คอมพิวเตอร์',
    'อื่นๆ',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Color(0xFF0F172A), size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'แจ้งซ่อม',
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
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section 1: รูปภาพประกอบ
                Text(
                  'รูปภาพประกอบ',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Color(0xFFEFF6FF),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add_a_photo_rounded,
                          size: 32,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('เลือกรูปภาพจากคลังรูปภาพ', style: GoogleFonts.kanit()),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add, size: 18),
                        label: Text(
                          'เพิ่มรูป',
                          style: GoogleFonts.kanit(fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF2563EB),
                          side: const BorderSide(color: Color(0xFF2563EB)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 22),

                // Section 2: สถานที่
                Text(
                  'สถานที่',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedLocation,
                  style: GoogleFonts.kanit(fontSize: 15, color: const Color(0xFF0F172A)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_on_outlined, color: Color(0xFF2563EB)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  items: _locations.map((loc) {
                    return DropdownMenuItem(
                      value: loc,
                      child: Text(loc),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedLocation = val;
                      });
                    }
                  },
                ),
                const SizedBox(height: 22),

                // Section 3: ประเภทปัญหา
                Text(
                  'ประเภทปัญหา',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  style: GoogleFonts.kanit(fontSize: 15, color: const Color(0xFF0F172A)),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.category_outlined, color: Color(0xFF2563EB)),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                  ),
                  items: _categories.map((cat) {
                    return DropdownMenuItem(
                      value: cat,
                      child: Text(cat),
                    );
                  }).toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        _selectedCategory = val;
                      });
                    }
                  },
                ),
                const SizedBox(height: 22),

                // Section 4: รายละเอียดปัญหา
                Text(
                  'รายละเอียดปัญหา',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _detailController,
                  maxLines: 4,
                  maxLength: 300,
                  style: GoogleFonts.kanit(fontSize: 15),
                  onChanged: (text) => setState(() {}),
                  decoration: InputDecoration(
                    hintText: 'อธิบายรายละเอียดปัญหาที่พบ...',
                    hintStyle: GoogleFonts.kanit(color: Colors.grey[400]),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.all(16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    counterStyle: GoogleFonts.kanit(
                      color: Colors.grey[500],
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Section 5: ความเร่งด่วน
                Text(
                  'ความเร่งด่วน',
                  style: GoogleFonts.kanit(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildUrgencyChip('ปกติ', Colors.blue[700]!),
                    const SizedBox(width: 12),
                    _buildUrgencyChip('ด่วน', Colors.red[600]!),
                  ],
                ),
                const SizedBox(height: 36),

                // Primary Submit Button
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    onPressed: () {
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
                              Text('ส่งแจ้งซ่อมสำเร็จ', style: GoogleFonts.kanit(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          content: Text(
                            'รายการแจ้งซ่อมของคุณถูกส่งไปยังเจ้าหน้าที่เรียบร้อยแล้ว',
                            style: GoogleFonts.kanit(fontSize: 14),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // close dialog
                                Navigator.pop(context); // back to home
                              },
                              child: Text('ตกลง', style: GoogleFonts.kanit(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.send_rounded, size: 20, color: Colors.white),
                    label: Text(
                      'ส่งแจ้งซ่อม',
                      style: GoogleFonts.kanit(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUrgencyChip(String label, Color activeColor) {
    final bool isSelected = _selectedUrgency == label;
    return ChoiceChip(
      label: Text(
        label,
        style: GoogleFonts.kanit(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedColor: activeColor,
      backgroundColor: Colors.grey[200],
      onSelected: (selected) {
        if (selected) {
          setState(() {
            _selectedUrgency = label;
          });
        }
      },
    );
  }
}
