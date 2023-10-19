import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constant.dart';
import '../../../data/model/movie_model.dart';
import '../../home_screen/widget/text_widget.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel selectedMovie;
  const DetailsScreen({Key? key, required this.selectedMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.35,
            child: Stack(
              children: [
                Positioned(
                  child: SizedBox(
                    height: height * 0.35,
                    width: width,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w500${selectedMovie.backdropPath!}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: TextWidget(
                    text: selectedMovie.title!,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextWidget(
                  text: ' ⭐ Average Rating - ${selectedMovie.voteAverage!}',
                  fontSize: 13.sp,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.3,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500${selectedMovie.posterPath!}',
                        ),
                      )),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: TextWidget(
                        text: selectedMovie.overview!,
                        fontSize: 11.sp,
                        maxLines: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
