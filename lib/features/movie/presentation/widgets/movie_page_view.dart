import 'package:flutter/material.dart';
import '../../data/models/movie_model.dart';

class MoviePageView extends StatelessWidget {
  final PageController controller;
  final List<MovieModel> movies;
  final Function(int) onPageChanged;
  final Widget Function(BuildContext, int) itemBuilder;
  final bool enableInfiniteScroll;

  const MoviePageView({
    super.key,
    required this.controller,
    required this.movies,
    required this.onPageChanged,
    required this.itemBuilder,
    this.enableInfiniteScroll = true,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      scrollDirection: Axis.vertical,
      itemCount: enableInfiniteScroll ? movies.length + 1 : movies.length,
      physics: const BouncingScrollPhysics(),
      clipBehavior: Clip.antiAlias,
      onPageChanged: onPageChanged,
      itemBuilder: itemBuilder,
    );
  }
} 