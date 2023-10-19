import 'package:flutter/material.dart';
import 'package:movieapp/data/model/movie_model.dart';
import 'package:movieapp/features/home_screen/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import '../../../constant.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

class _PopUpMenuState extends State<PopUpMenu> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (context, notifier, child) {
      return PopupMenuButton(
        color: Colors.white,
        itemBuilder: (context) => [
          PopupMenuItem(
            onTap: () {
              notifier.getSortedByYear();
            },
            child: const Text(
              'Sort by year',
              style: kPopUpTextStyle,
            ),
          ),
          PopupMenuItem(
            onTap: () {
              notifier.getSortedByPopularity();
            },
            child: const Text(
              'Sort by popularity',
              style: kPopUpTextStyle,
            ),
          ),
          PopupMenuItem(
            onTap: () {
              notifier.getSortedByRating();
            },
            child: const Text(
              'sort by IMDB rating',
              style: kPopUpTextStyle,
            ),
          ),
        ],
      );
    });
  }
}
