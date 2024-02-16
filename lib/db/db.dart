import 'package:moodtracker/db/db_model.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../objectbox.g.dart';

// created by `flutter pub run build_runner build`

/// Provides access to the ObjectBox Store throughout the app.
///
/// Create this in the apps main function.
class ObjectBox {
  /// The Store of this app.
  late final Store _store;

  /// A Box of notes.
  late final Box<Mood> _noteBox;

  ObjectBox._create(this._store) {
    _noteBox = Box<Mood>(_store);

    // Add some demo data if the box is empty.
    if (_noteBox.isEmpty()) {
      _putDemoData();
    }
  }

  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    // Note: setting a unique directory is recommended if running on desktop
    // platforms. If none is specified, the default directory is created in the
    // users documents directory, which will not be unique between apps.
    // On mobile this is typically fine, as each app has its own directory
    // structure.

    // Note: set macosApplicationGroup for sandboxed macOS applications, see the
    // info boxes at https://docs.objectbox.io/getting-started for details.

    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(
        directory:
            p.join((await getApplicationDocumentsDirectory()).path, "obx-demo"),
        macosApplicationGroup: "objectbox.demo");
    return ObjectBox._create(store);
  }

  void _putDemoData() {
    final demoNotes = [
      Mood(
          comment: "this is commnet",
          date: DateTime.now(),
          moodTitle: "good",
          selectedOpt: "good, bad"),
    ];
    print("oen datapoint added");
    _noteBox.putManyAsync(demoNotes);
  }

  Stream<List<Mood>> getNotes() {
    // Query for all notes, sorted by their date.
    // https://docs.objectbox.io/queries
    final builder = _noteBox.query().order(Mood_.date, flags: Order.descending);
    // Build and watch the query,
    // set triggerImmediately to emit the query immediately on listen.
    return builder
        .watch(triggerImmediately: true)
        // Map it to a list of notes to be used by a StreamBuilder.
        .map((query) => query.find());
  }

//   /// Add a note.
//   ///
//   /// To avoid frame drops, run ObjectBox operations that take longer than a
//   /// few milliseconds, e.g. putting many objects, asynchronously.
//   /// For this example only a single object is put which would also be fine if
//   /// done using [Box.put].
//   Future<void> addNote(String text) => _noteBox.putAsync(Note(text));

//   Future<void> removeNote(int id) => _noteBox.removeAsync(id);
}
