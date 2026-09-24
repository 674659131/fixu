class RepairItem {
  final String id;
  final String category;
  final String location;
  final String description;
  final String urgency;
  final String status;
  final String date;
  final String? time;
  final String? technicianName;
  final String? technicianRole;

  RepairItem({
    required this.id,
    required this.category,
    required this.location,
    required this.description,
    required this.urgency,
    required this.status,
    required this.date,
    this.time,
    this.technicianName,
    this.technicianRole,
  });

  static List<RepairItem> sampleData = [
    RepairItem(
      id: '#20240806001',
      category: 'เครื่องปรับอากาศ',
      location: 'อาคารเรียนรวม ห้อง 305',
      description: 'แอร์ไม่เย็น เปิดแล้วไม่ค่อยมีลม',
      urgency: 'ปกติ',
      status: 'กำลังซ่อม',
      date: '6 ส.ค. 2567',
      time: '10:30 น.',
      technicianName: 'นายสมชาย ใจดี',
      technicianRole: 'ช่างเทคนิค',
    ),
    RepairItem(
      id: '#20240728003',
      category: 'ไฟฟ้า',
      location: 'อาคารเรียนรวม ชั้น 2',
      description: 'ไฟทางเดินดับ 2 ดอก',
      urgency: 'ปกติ',
      status: 'ซ่อมเสร็จ',
      date: '28 ก.ค. 2567',
      time: '14:15 น.',
      technicianName: 'นายวิชัย สายฟ้า',
      technicianRole: 'ช่างไฟฟ้า',
    ),
    RepairItem(
      id: '#20240715002',
      category: 'ประปา',
      location: 'อาคารเรียนรวม ชั้น 1',
      description: 'ก๊อกน้ำห้องน้ำชายซึม',
      urgency: 'ด่วน',
      status: 'ซ่อมเสร็จ',
      date: '15 ก.ค. 2567',
      time: '09:00 น.',
      technicianName: 'นายประเสริฐ ท่อน้ำ',
      technicianRole: 'ช่างประปา',
    ),
    RepairItem(
      id: '#20240701004',
      category: 'โต๊ะ/เก้าอี้',
      location: 'อาคารเรียนรวม ห้อง 101',
      description: 'ขาเก้าอี้หัก 1 ตัว',
      urgency: 'ปกติ',
      status: 'ยกเลิก',
      date: '1 ก.ค. 2567',
      time: '11:20 น.',
    ),
  ];
}
