import 'package:do_an_cuoi_ki/components/app_bar.dart';
import 'package:do_an_cuoi_ki/components/app_drawer.dart';
import 'package:do_an_cuoi_ki/components/bullet_item.dart';
import 'package:flutter/material.dart';

class SuppportPage extends StatefulWidget {
  const SuppportPage({super.key});

  @override
  State<SuppportPage> createState() => _SuppportPageState();
}

class _SuppportPageState extends State<SuppportPage> {
  @override
  Widget build(BuildContext context) {
    final List<String> names = [
      "Email: 8HlQm@example.com",
      "Số điện thoại: 0909 999 999",
      "Địa chỉ văn phòng: 123/456 Điện 1, Tp. HCM"
    ];

    return Scaffold(
      appBar: CustomAppBar(title: 'MEDICAL | Hỗ Trợ'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Hỗ trợ khách hàng',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            const Text(
              'Thông tin liên hệ:',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                BulletItem(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Email:  ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "medicalapp@example.com",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                BulletItem(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Số điện thoại:  ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "123123123",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                BulletItem(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Địa chỉ văn phòng:  ',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  "459 Tôn Đức Thắng, Hoà Khánh Nam, Liên Chiểu",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Câu hỏi trực tuyến:',
              style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            // khung để nhap cau hoi
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(40),
              ),
              child: TextField(
                controller: TextEditingController(),
                maxLines: 10,
                decoration: const InputDecoration(
                
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // nut gui cau hoi
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {},
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: const Center(
                    child: Text(
                      'Gửi',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      endDrawer: const AppDrawer(currentPage: 'SuppportPage'),
    );
  }
}
