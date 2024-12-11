import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  String userEmail = '';
  String fullName = 'Nguyễn Văn A'; // Giá trị const
  String gender = 'Nam'; // Giá trị const
  String phoneNumber = '0123456789'; // Giá trị const
  String city = 'Hà Nội'; // Giá trị const

  @override
  void initState() {
    super.initState();
    _loadUserEmail();
  }

  // Truy xuất email từ SharedPreferences
  Future<void> _loadUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('userEmail') ?? 'Email not found';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Account'),
        centerTitle: true,
        backgroundColor: const Color(0xFF73AEF5),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ảnh đại diện
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/profile_pic.png'),
              ),
              const SizedBox(height: 20),

              // Hiển thị thông tin tài khoản
              UserInfo(title: 'Email', value: userEmail),
              UserInfo(title: 'Họ Tên', value: fullName),
              UserInfo(title: 'Giới Tính', value: gender),
              UserInfo(title: 'Số Điện Thoại', value: phoneNumber),
              UserInfo(title: 'Thành Phố', value: city),

              const SizedBox(height: 20),

              // Nút quay lại
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF73AEF5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Quay Lại',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget con để hiển thị từng dòng thông tin
class UserInfo extends StatelessWidget {
  final String title;
  final String value;

  const UserInfo({required this.title, required this.value, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}