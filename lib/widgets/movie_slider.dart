import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/film/film.dart';

class MovieSlider extends StatefulWidget {
  final String? title;
  final List<FilmResponse> movies;
  final Function onNextPage;

  const MovieSlider({
    super.key,
    this.title,
    required this.movies,
    required this.onNextPage,
  });

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(widget.title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            const SizedBox(
              height: 14,
            ),
            Expanded(
              child: ListView.builder(
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movies.length,
                  itemBuilder: (_, int index) => _MoviePoster(widget.movies[index])),
            )
          ],
        ));
  }
}

class _MoviePoster extends StatelessWidget {
  final FilmResponse movie;

  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 230,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  placeholder: const AssetImage('assets/no_image.jpg'),
                  image: NetworkImage(movie.thumbnail ?? ''),
                  width: 130,
                  height: 190,
                  fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(movie.name ?? '', maxLines: 2, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
