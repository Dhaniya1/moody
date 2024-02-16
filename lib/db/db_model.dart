import 'package:intl/intl.dart';
import 'package:objectbox/objectbox.dart';

// ignore_for_file: public_member_api_docs

@Entity()
class Mood {
  Mood(
      {this.id = 0,
      required this.moodTitle,
      required this.comment,
      required this.date,
      required this.selectedOpt}) {}
  @Id()
  late int id;

  late String moodTitle;
  String? comment;
  @Property(type: PropertyType.date)
  late DateTime date;
  late String selectedOpt;

  String get dateFormat => DateFormat('dd.MM.yyyy hh:mm:ss').format(date);
}
