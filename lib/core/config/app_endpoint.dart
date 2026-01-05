
class AppEndPoint{
  const AppEndPoint._();

  static const auth = Auth();
  static const content = Content ();
  static const qrScan = QrCode();

}

class Auth{
  const Auth();

  final String login = '/login';
  final String logout = '/logout';
  final String register = '/register';
  final String profile = '/profile';

}

class Content {
  const Content ();
  static const  subjects = Subjects();
  static const videos = Videos() ;
  static const summaries = Summaries();
  static const favoriteQuestions = FavoriteQuestions();
  static const library = Library();


}

class Subjects {
  const Subjects();
  final String all = '/subjects';

  final String topicsSubject = '/subjects/2/topics';

  final String topicsShow = '/topics/1';

}

class Videos {

  const   Videos ();
  final String videosByTopic = '/topics/1/videos';
  final String showVideos = '/videos/1';
  final String uploadVideo = '/videos/update';


}
class Summaries {

  const Summaries ();
  final String getSummaries = '/summaries';
  final summariesByTopic = '/topics/1/summaries';
}

class Questions
{
  const  Questions();
  final String questionsByTopic = '/topics/1/questions';
}
class FavoriteQuestions {

  const FavoriteQuestions ();
  final String addFavoriteQuestions = '/favorites/questions/id';

  final String getFavoriteQuestions = '/favorites/questions';
}



class Library {
  const  Library();

  final String getLibrary = '/library';
}

class QrCode {
  const   QrCode();

  final String scan = '/qr/scan';
}