import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/utils/theme/formatters/formatters.dart';

class UserModel {
  final String id;
  String firstName;
  String lastNome;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastNome,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  String get fullName => '$firstName $lastNome';

  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  static List<String> nameParts(fullName) => fullName.split("");

  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastNome = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastNome";
    String usernameWithPrefix = "cwt_$camelCaseUsername";
    return usernameWithPrefix;
  }

  static UserModel empty() => UserModel(
      id: '',
      firstName: '',
      lastNome: '',
      username: '',
      email: '',
      phoneNumber: '',
      profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastNome,
      'UserName': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          id: document.id,
          firstName: data['FirstName'] ?? '',
          lastNome: data['LastName'] ?? '',
          username: data['UserName'] ?? '',
          email: data['email'] ?? '',
          phoneNumber: data['PhoneNumber'] ?? '',
          profilePicture: data['ProfilePicture'] ?? '');
    }
    throw Exception('Document data is null.');
  }
}
