class Movie{

  int id;
  num vote_average;
  String title;
  String overview;
  String poster_path;

  Movie(
      {required this.id,
      required this.vote_average,
      required this.title,
      required this.overview,
      required this.poster_path
      });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'vote_average': this.vote_average,
      'title': this.title,
      'overview': this.overview,
      'poster_path': this.poster_path,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] as int,
      vote_average: map['vote_average'] as num,
      title: map['title'] as String,
      overview: map['overview'] as String,
      poster_path: map['poster_path'] as String,
    );
  }
}