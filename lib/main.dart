import 'package:flutter/material.dart';  // Thư viện Flutter để xây dựng giao diện

void main() {
  runApp(MyApp()); // Chạy ứng dụng Flutter, bắt đầu từ MyApp
}

class MyApp extends StatelessWidget {
  // Đây là class chính của ứng dụng, kế thừa từ StatelessWidget (ứng dụng không thay đổi trạng thái)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bài Tập 1',  // Tiêu đề ứng dụng
      theme: ThemeData(
        primarySwatch: Colors.blue,  // Màu chủ đạo của ứng dụng
      ),
      home: MyHomePage(),  // Giao diện chính của ứng dụng, hiển thị MyHomePage
    );
  }
}

class MyHomePage extends StatefulWidget {
  // MyHomePage kế thừa từ StatefulWidget, có thể thay đổi trạng thái (state).
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // State của MyHomePage. Đây là nơi lưu trữ dữ liệu thay đổi trong ứng dụng.

  // Các controller để quản lý giá trị nhập vào từ TextField
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();

  // Biến _result lưu trữ kết quả giải phương trình
  String _result = '';

  @override
  Widget build(BuildContext context) {
    // Hàm build() dùng để tạo giao diện người dùng (UI)
    return Scaffold(
      appBar: AppBar(
        title: Text('Giải Phương trình bậc 1'), // Tiêu đề trên AppBar
        backgroundColor: Colors.blue,
        centerTitle: true, // Canh giữa tiêu đề
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),  // Padding tạo khoảng cách bên trong
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,  // Canh giữa theo chiều ngang
          children: [
            // Nhập a (TextField để nhập hệ số a)
            TextField(
              controller: _aController,  // Liên kết với controller _aController
              keyboardType: TextInputType.number,  // Chỉ cho phép nhập số
              decoration: InputDecoration(
                labelText: 'Nhập số a',  // Nhãn hướng dẫn
                border: OutlineInputBorder(),  // Đường viền của TextField
              ),
            ),
            SizedBox(height: 10),  // Khoảng cách giữa các widget
            // Nhập b (TextField để nhập hệ số b)
            TextField(
              controller: _bController,  // Liên kết với controller _bController
              keyboardType: TextInputType.number,  // Chỉ cho phép nhập số
              decoration: InputDecoration(
                labelText: 'Nhập số b',  // Nhãn hướng dẫn
                border: OutlineInputBorder(),  // Đường viền của TextField
              ),
            ),
            SizedBox(height: 20),  // Khoảng cách giữa các widget
            // Nút bấm để giải phương trình
            ElevatedButton(
              onPressed: _solveEquation,  // Khi nhấn nút, gọi hàm _solveEquation
              child: Text('Giải phương trình'),
            ),
            SizedBox(height: 20),  // Khoảng cách giữa các widget
            // Hiển thị kết quả
            Text(
              _result,  // Kết quả được tính toán và hiển thị tại đây
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),  // Style cho text
            ),
          ],
        ),
      ),
    );
  }

  // Hàm giải phương trình bậc 1
  void _solveEquation() {
    // Lấy giá trị nhập từ người dùng
    double a = double.tryParse(_aController.text) ?? 0;  // Nếu không phải số thì mặc định là 0
    double b = double.tryParse(_bController.text) ?? 0;  // Nếu không phải số thì mặc định là 0

    setState(() {
      // setState() được gọi để cập nhật giao diện sau khi tính toán xong
      if (a == 0 && b == 0) {
        // Nếu a == 0 và b == 0, phương trình có vô số nghiệm
        _result = 'Vô số nghiệm';
      } else if (a == 0) {
        // Nếu a == 0 và b != 0, phương trình vô nghiệm
        _result = 'Vô nghiệm';
      } else {
        // Nếu a != 0, tính giá trị của x
        double x = -b / a;  // Công thức giải phương trình bậc 1
        _result = 'Kết quả: x = $x';  // Hiển thị kết quả
      }
    });
  }
}
