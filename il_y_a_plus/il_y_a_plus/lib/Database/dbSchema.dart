import 'package:meta/meta.dart';

class UserFirebase{
  final String firstName;
  final String familyName;
  final String nickName;
  final String dateOfBirth;
  final String gender;
  final String grade;
  final String school;
  final List<String> interests;
  final String favouriteSubject;
  final String projectStatus;
  final List<String> mostWantedSubjets;

  UserFirebase({
    @required this.firstName,
    @required this.familyName,
    @required this.nickName,
    @required this.dateOfBirth,
    @required this.gender,
    @required this.grade,
    @required this.school,
    @required this.interests,
    this.favouriteSubject,
    this.projectStatus,
    this.mostWantedSubjets,
});
}