import 'package:hive/hive.dart';
part 'note_model.g.dart';

//typeId 0 был использован
@HiveType(typeId: 1)
class NoteModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  String? timeEdit;

  @HiveField(3)
  int id;

  @HiveField(4)
  bool isLock = false;

  NoteModel(this.title, this.subtitle, this.id) {
    timeEdit = DateTime.now().toString().split(".")[0];
    timeEdit = timeEdit.toString().split(" ")[0];
  }
}
