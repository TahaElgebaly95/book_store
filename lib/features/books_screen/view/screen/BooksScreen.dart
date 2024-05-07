import 'package:book_store/features/books_screen/view/widgets/list_of_books.dart';
import 'package:book_store/features/books_screen/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BooksScreen extends StatelessWidget {
  const BooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              const SearchWidget(),
              SizedBox(height: 15.h),
              Expanded(
                child: ListView(
                  children: const [ListOfBooks()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
