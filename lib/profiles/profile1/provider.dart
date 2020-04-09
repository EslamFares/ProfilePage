import 'User.dart';

class Profile1Provider {
  static Profile getProfile() {
    return Profile(
        user: User(name: 'Eslam Fares', address: 'Mansoura, Egypt', about:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper ligula arcu, vel maximus nisl lacinia at. Donec tellus erat, fermentum ut mattis a, interdum non erat."),
        // Nunc pulvinar, est eget placerat lobortis, massa leo efficitur sem, ut vulputate ante lorem ut massa.
        followers: 3218,
        following: 364,
        friends: 175);
  }
}
