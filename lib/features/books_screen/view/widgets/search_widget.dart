import 'package:book_store/features/books_screen/view_model/cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/cubit/books_states.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder<BooksCubit, BooksStates>(
        builder: (context, state) {
          var cubit = BooksCubit.get(context);
          return SearchBar(
            controller: cubit.searchController,
            onChanged: (value) {
              cubit.getBooksBySearch(value);
            },
            padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 10.w)),
            leading: const Icon(Icons.search),
            hintText: 'Search',
            elevation: const MaterialStatePropertyAll(1),
          );
        },
      );
  }
}
