import 'package:avatar_better_pro/avatar_better_pro.dart';
import 'package:flutter/material.dart';

class CustomBottomSheetExample extends StatelessWidget {
  const CustomBottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Bottom Sheet Example'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tap the avatar to see custom bottom sheet',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Avatar.profile(
              text: 'John Doe',
              radius: 50.0,
              // استفاده از UI سفارشی
              customBottomSheetBuilder: (context, pickGallery, pickCamera) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Handle bar
                      Container(
                        width: 40,
                        height: 5,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey[600],
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),

                      // Title
                      const Text(
                        'انتخاب تصویر',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Gallery button
                      ElevatedButton.icon(
                        onPressed: pickGallery,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.photo_library),
                        label: const Text('گالری تصاویر'),
                      ),

                      const SizedBox(height: 16),

                      // Divider with text
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey[700])),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'یا',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey[700])),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Camera button
                      OutlinedButton.icon(
                        onPressed: pickCamera,
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue),
                          foregroundColor: Colors.blue,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        icon: const Icon(Icons.camera_alt),
                        label: const Text('دوربین'),
                      ),

                      const SizedBox(height: 16),

                      // Cancel button
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'انصراف',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onPickerChange: (file, bytes) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('تصویر انتخاب شد: ${file.path}')),
                );
              },
            ),

            const SizedBox(height: 30),

            const Text(
              'ویژگی‌های این قابلیت:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '• طراحی UI کاملاً سفارشی\n'
                '• دسترسی به callbacks برای گالری و دوربین\n'
                '• امکان استفاده از تم‌ها و استایل‌های دلخواه\n'
                '• پشتیبانی از زبان فارسی و RTL\n'
                '• کنترل کامل بر روی ظاهر و رفتار',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
