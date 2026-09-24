import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/repair_item.dart';
import 'status_detail_screen.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  int _selectedFilterIndex = 0; // 0: ทั้งหมด, 1: รอดำเนินการ, 2: เสร็จสิ้น

  final List<String> _filters = ['ทั้งหมด', 'รอดำเนินการ', 'เสร็จสิ้น'];

  List<RepairItem> get _filteredItems {
    if (_selectedFilterIndex == 1) {
      // รอดำเนินการ
      return RepairItem.sampleData.where((item) => item.status == 'กำลังซ่อม' || item.status == 'รอช่างติดต่อกลับ').toList();
    } else if (_selectedFilterIndex == 2) {
      // เสร็จสิ้น
      return RepairItem.sampleData.where((item) => item.status == 'ซ่อมเสร็จ').toList();
    }
    return RepairItem.sampleData;
  }

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
          'ประวัติการแจ้ง',
          style: GoogleFonts.kanit(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF0F172A),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            // Filter Tabs
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: List.generate(_filters.length, (index) {
                  final bool isSelected = _selectedFilterIndex == index;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedFilterIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 4,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : [],
                        ),
                        child: Text(
                          _filters[index],
                          textAlign: TextAlign.center,
                          style: GoogleFonts.kanit(
                            fontSize: 14,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? const Color(0xFF1E3A8A) : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 16),

            // Repair Items List
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: _filteredItems.length,
                separatorBuilder: (context, index) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final item = _filteredItems[index];
                  return _buildHistoryCard(context, item);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, RepairItem item) {
    Color statusBgColor;
    Color statusTextColor;

    switch (item.status) {
      case 'ซ่อมเสร็จ':
        statusBgColor = const Color(0xFFD1FAE5);
        statusTextColor = const Color(0xFF059669);
        break;
      case 'กำลังซ่อม':
      case 'รอช่างติดต่อกลับ':
        statusBgColor = const Color(0xFFFEF3C7);
        statusTextColor = const Color(0xFFD97706);
        break;
      case 'ยกเลิก':
      default:
        statusBgColor = const Color(0xFFF1F5F9);
        statusTextColor = const Color(0xFF64748B);
        break;
    }

    IconData categoryIcon;
    switch (item.category) {
      case 'เครื่องปรับอากาศ':
        categoryIcon = Icons.ac_unit_rounded;
        break;
      case 'ไฟฟ้า':
        categoryIcon = Icons.bolt_rounded;
        break;
      case 'ประปา':
        categoryIcon = Icons.water_drop_rounded;
        break;
      case 'โต๊ะ/เก้าอี้':
      default:
        categoryIcon = Icons.chair_rounded;
        break;
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StatusDetailScreen(item: item),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
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
        child: Row(
          children: [
            // Icon Category
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xFFEFF6FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                categoryIcon,
                color: const Color(0xFF2563EB),
                size: 24,
              ),
            ),
            const SizedBox(width: 14),

            // Information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.id,
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1E3A8A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.category,
                    style: GoogleFonts.kanit(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    item.location,
                    style: GoogleFonts.kanit(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            // Status Badge & Date
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusBgColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    item.status,
                    style: GoogleFonts.kanit(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: statusTextColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  item.date,
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
    );
  }
}
