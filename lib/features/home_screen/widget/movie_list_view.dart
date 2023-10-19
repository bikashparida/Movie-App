import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/data/model/movie_model.dart';
import 'package:movieapp/features/details_screen/page/details_screen.dart';
import 'package:movieapp/features/home_screen/widget/text_widget.dart';
import '../../../constant.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key, required this.notifier, required this.type});

  final dynamic notifier;
  final String type;
  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  @override
  Widget build(BuildContext context) {
    List<MovieModel> dataList = [];
    if (widget.type == 'favorites') {
      dataList = widget.notifier.favorite;
    } else if (widget.type == 'search') {
      dataList = widget.notifier.searchedMovies;
    } else {
      dataList = widget.notifier.topRated;
    }
    return SingleChildScrollView(
      child: ListView.builder(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        itemCount: dataList.length,
        itemBuilder: (context, index) {
          final data = dataList[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(selectedMovie: data),
                ),
              );
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: 10.w, right: 5.w, top: 5.h, bottom: 5.h),
                  height: height * 0.130.h,
                  width: width * 1.w,
                  child: Row(
                    children: [
                      Container(
                        width: width * 0.30.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: data.backdropPath != null
                                ? NetworkImage(
                                    'https://image.tmdb.org/t/p/w500${data.posterPath!}')
                                : const NetworkImage(
                                    'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.setra.com%2Fblog%2Fwhat-is-crc-error&psig=AOvVaw39n6zqkgXd5dAbQXMa6Xfr&ust=1694951546408000&source=images&cd=vfe&opi=89978449&ved=0CBAQjRxqFwoTCLjXityIr4EDFQAAAAAdAAAAABAE'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: width * 0.50,
                              child: TextWidget(
                                text: data.title ?? '',
                                fontSize: 15.sp,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWidget(
                                  text: '⭐ ${data.voteAverage ?? 0}',
                                  fontSize: 11.sp,
                                ),
                                SizedBox(
                                  width: width * 0.55,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextWidget(
                                        text:
                                            'Release-${data.releaseDate.toString()}',
                                        fontSize: 11.sp,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (data.isChecked ?? false) {
                                            widget.notifier
                                                .removeMovie(data, index);
                                          } else {
                                            widget.notifier
                                                .addMovie(data, index);
                                          }
                                        },
                                        child: Icon(
                                          data.isChecked ?? false
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width,
                  color: Colors.white,
                  height: 0.20.h,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
