import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/repair_item.dart';

class StatusDetailScreen extends StatelessWidget {
  final RepairItem item;

  const StatusDetailScreen({super.key, required this.item});

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
          'ติดตามสถานะ',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Summary Info Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'รายการแจ้งซ่อม',
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFEF3C7),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            item.status,
                            style: GoogleFonts.kanit(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFD97706),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.id,
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(Icons.location_on_rounded, size: 18, color: Color(0xFF2563EB)),
                        const SizedBox(width: 8),
                        Text(
                          item.location,
                          style: GoogleFonts.kanit(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF1E293B),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.category_rounded, size: 18, color: Color(0xFF2563EB)),
                        const SizedBox(width: 8),
                        Text(
                          item.category,
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    Row(
                      children: [
                        Icon(Icons.access_time_rounded, size: 16, color: Colors.grey[500]),
                        const SizedBox(width: 6),
                        Text(
                          'วันที่แจ้ง : ${item.date} ${item.time ?? ''}',
                          style: GoogleFonts.kanit(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Section: สถานะปัจจุบัน Timeline
              Text(
                'สถานะปัจจุบัน',
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 16),

              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
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
                child: Column(
                  children: [
                    _buildTimelineStep(
                      title: 'รอช่างติดต่อกลับ',
                      time: '6 ส.ค. 2567 10:35 น.',
                      isCompleted: true,
                      isCurrent: false,
                      isLast: false,
                    ),
                    _buildTimelineStep(
                      title: 'กำลังซ่อม',
                      time: '6 ส.ค. 2567 13:20 น.',
                      isCompleted: true,
                      isCurrent: true,
                      isLast: false,
                    ),
                    _buildTimelineStep(
                      title: 'ซ่อมเสร็จ',
                      time: 'รอดำเนินการ',
                      isCompleted: false,
                      isCurrent: false,
                      isLast: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Section: ผู้รับผิดชอบ (Assigned Technician Card)
              Text(
                'ผู้รับผิดชอบ',
                style: GoogleFonts.kanit(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 14),

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
                    const CircleAvatar(
                      radius: 26,
                      backgroundColor: Color(0xFFDBEAFE),
                      child: Icon(
                        Icons.engineering_rounded,
                        size: 30,
                        color: Color(0xFF1E3A8A),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.technicianName ?? 'นายสมชาย ใจดี',
                            style: GoogleFonts.kanit(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF0F172A),
                            ),
                          ),
                          Text(
                            item.technicianRole ?? 'ช่างเทคนิค',
                            style: GoogleFonts.kanit(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('กำลังโทรหา ${item.technicianName ?? "ช่างเทคนิค"}...', style: GoogleFonts.kanit()),
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.phone_rounded, size: 16),
                      label: Text(
                        'ติดต่อช่าง',
                        style: GoogleFonts.kanit(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF2563EB),
                        side: const BorderSide(color: Color(0xFF2563EB)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Bottom Button: ติดต่อเจ้าหน้าที่
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('ติดต่อเจ้าหน้าที่ประจำศูนย์แจ้งซ่อม', style: GoogleFonts.kanit()),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: const Icon(Icons.headset_mic_rounded, size: 20, color: Color(0xFF1E3A8A)),
                  label: Text(
                    'ติดต่อเจ้าหน้าที่',
                    style: GoogleFonts.kanit(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF1E3A8A), width: 1.5),
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

  Widget _buildTimelineStep({
    required String title,
    required String time,
    required bool isCompleted,
    required bool isCurrent,
    required bool isLast,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCurrent
                    ? const Color(0xFF2563EB)
                    : (isCompleted ? const Color(0xFF10B981) : Colors.grey[300]),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isCompleted ? Icons.check_rounded : Icons.circle_rounded,
                size: 14,
                color: Colors.white,
              ),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 48,
                color: isCompleted ? const Color(0xFF10B981) : Colors.grey[300],
              ),
          ],
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.kanit(
                        fontSize: 15,
                        fontWeight: isCurrent || isCompleted ? FontWeight.bold : FontWeight.normal,
                        color: isCurrent
                            ? const Color(0xFF2563EB)
                            : (isCompleted ? const Color(0xFF0F172A) : Colors.grey[500]),
                      ),
                    ),
                    if (isCurrent) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFDBEAFE),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'ปัจจุบัน',
                          style: GoogleFonts.kanit(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2563EB),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: GoogleFonts.kanit(
                    fontSize: 12,
                    color: Colors.grey[500],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
