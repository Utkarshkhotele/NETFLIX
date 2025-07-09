import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<Movie> searchResults = [];
  bool isLoading = false;

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) return;

    setState(() => isLoading = true);

    final url =
        'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apikey}&query=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body)['results'] as List;
      setState(() {
        searchResults = data.map((json) => Movie.fromJson(json)).toList();
        isLoading = false;
      });
    } else {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: TextField(
          controller: _controller,
          onSubmitted: searchMovies,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search Movies...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : searchResults.isEmpty
          ? const Center(
        child: Text(
          "No results found.",
          style: TextStyle(color: Colors.white70),
        ),
      )
          : ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final movie = searchResults[index];

          // fallback if posterPath is empty
          final imageUrl = (movie.posterPath != null &&
              movie.posterPath.isNotEmpty)
              ? '${Constants.imagePath}${movie.posterPath}'
              : 'https://via.placeholder.com/100x150?text=No+Image';

          return ListTile(
            leading: Image.network(
              imageUrl,
              width: 50,
              fit: BoxFit.cover,
            ),
            title: Text(movie.title,
                style: const TextStyle(color: Colors.white)),
            subtitle: Text(
              movie.releaseDate.isNotEmpty
                  ? movie.releaseDate
                  : 'No release date',
              style: const TextStyle(color: Colors.white70),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsScreen(movie: movie),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
