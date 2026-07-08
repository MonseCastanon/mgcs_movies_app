import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mgcs_movies_app/domain/domain.dart';

class MovieMasonry extends StatefulWidget {

  final List<Movie> movies;
  final VoidCallback? loadNextPage;
  
  MovieMasonry({
    super.key,
    required this.movies,
    this.loadNextPage
  });

  @override
  State<MovieMasonry> createState() => _MovieMasonryState();
}

class _MovieMasonryState extends State<MovieMasonry> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    
    scrollController.addListener(() {
      if(widget.loadNextPage == null) return;

      if(scrollController.position.pixels + 100 >= scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.movies.length,
        itemBuilder: (context, index) {
          
          if(index == 1) {
            return Column(
              children: [
                const SizedBox(height: 20),
                SizedBox(height: 180, child: Placeholder(),)
              ],
            );
          }

          return SizedBox(
            height: 180, child: Placeholder(),
          );
          // TODO: Agregar la imagen y agregar el título debajo de cada póster de la película. Igual aocmodar el tamaño. No colocarlo aqui, separar el elemento para posteriormente reutilizarlo.
        }
      ),
    );
  }
}