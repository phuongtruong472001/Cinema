import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/widgets/button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final FilmResponse movie = ModalRoute.of(context)!.settings.arguments as FilmResponse;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(movie),

            const SizedBox(height: 15),

            // CastingCards(movie.id)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: BaseButton(
                text: 'Đặt vé',
                onPressed: () {
                  Navigator.pushNamed(context, 'book', arguments: movie);
                },
              ),
            )
          ]),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final FilmResponse movie;

  const _CustomAppBar(this.movie);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.25,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
        ),
        background: FadeInImage(placeholder: const AssetImage('assets/loading.gif'), image: NetworkImage(movie.thumbnail ?? ''), fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final FilmResponse movie;

  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  height: 150,
                  placeholder: const AssetImage('assets/no_image.jpg'),
                  image: NetworkImage(movie.thumbnail ?? ''),
                  fit: BoxFit.cover,
                )),
            const SizedBox(width: 20),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: size.width - 190),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.name ?? '', style: textTheme.titleLarge, overflow: TextOverflow.ellipsis, maxLines: 2),
                    const SizedBox(height: 8),
                    Text('Thời lượng: ${movie.duration} phút', style: textTheme.titleMedium, overflow: TextOverflow.ellipsis, maxLines: 2),
                    const SizedBox(height: 8),
                    Text('Mô tả: ${movie.description}', textAlign: TextAlign.justify, style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
