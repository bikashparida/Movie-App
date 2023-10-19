import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/favorite_screen/page/favorite_screen.dart';
import 'package:movieapp/features/home_screen/provider/movie_provider.dart';
import 'package:movieapp/features/home_screen/widget/movie_list_view.dart';
import 'package:provider/provider.dart';
import '../../search_screen/page/search_screen.dart';
import '../widget/pop_up_Menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MovieProvider>(context, listen: false).getMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Rated Movies'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchScreen(),
                ),
              );
            },
            child: Icon(
              Icons.search_sharp,
              size: 30.w,
            ),
          ),
          SizedBox(
            width: 3.0.w,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavoriteScreen(),
                ),
              );
            },
            child: Icon(
              Icons.favorite,
              size: 30.w,
            ),
          ),
          const PopUpMenu(),
        ],
      ),
      body: Consumer<MovieProvider>(
        builder: (context, value, child) {
          if (value.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return MovieListView(
            notifier: value,
            type: 'topRated',
          );
        },
      ),
    );
  }
}
