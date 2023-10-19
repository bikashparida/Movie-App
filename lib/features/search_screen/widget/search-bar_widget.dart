import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/home_screen/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

final searchText = TextEditingController();

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    var notifier = Provider.of<MovieProvider>(context, listen: false);

    return TextField(
      controller: searchText,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white38),
          borderRadius: BorderRadius.circular(12.0.r),
        ),
        hintText: 'Search movie',
        hintStyle: TextStyle(
          fontSize: 15.0.sp,
          color: Colors.white38,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            if (searchText.text.isEmpty) {
              return;
            }
            notifier.getSearchMovie(searchText.text);
          },
          icon: const Icon(
            Icons.search,
            color: Colors.white38,
          ),
        ),
      ),
    );
  }
}
