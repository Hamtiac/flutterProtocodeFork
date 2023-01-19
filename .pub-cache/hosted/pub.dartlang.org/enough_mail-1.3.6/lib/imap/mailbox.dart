import 'package:collection/collection.dart' show IterableExtension;
import 'package:enough_mail/codecs/modified_utf7_codec.dart';

/// Contains common flags for mailboxes
enum MailboxFlag {
  marked,
  unMarked,
  hasChildren,
  hasNoChildren,
  noSelect,
  select,
  noInferior,
  subscribed,
  remote,
  nonExistent,
  all,
  inbox,
  sent,
  drafts,
  junk,
  trash,
  archive,
  flagged
}

/// Stores meta data about a folder aka Mailbox
class Mailbox {
  static const ModifiedUtf7Codec _modifiedUtf7Codec = ModifiedUtf7Codec();

  late String pathSeparator;
  String get encodedName => _modifiedUtf7Codec.encodeText(_name);
  late String _name;
  String get name => _name;
  set name(String value) => _name = _modifiedUtf7Codec.decodeText(value);

  String get encodedPath => _encodedPath;
  late String _encodedPath;
  late String _path;
  String get path => _path;
  set path(String value) {
    _path = _modifiedUtf7Codec.decodeText(value);
    _encodedPath = value;
  }

  bool isMarked = false;
  bool hasChildren = false;
  bool isSelected = false;
  bool isUnselectable = false;
  int? messagesRecent;
  int messagesExists = 0;

  /// The number of unseen messages - only reported through STATUS calls
  int? messagesUnseen;
  int? firstUnseenMessageSequenceId;
  int? uidValidity;
  int? uidNext;
  bool isReadWrite = false;

  /// The last modification sequence in case the server supports the CONDSTORE or QRESYNC capability. Useful for message synchronization.
  int? highestModSequence;
  List<MailboxFlag> flags = <MailboxFlag>[];
  List<String>? messageFlags;
  List<String>? permanentMessageFlags;

  /// Map of extended results
  Map<String, List<String>> extendedData = {};

  /// This is set to false in case the server supports CONDSTORE but no mod sequence for this mailbox
  bool? hasModSequence;

  bool get isInbox => hasFlag(MailboxFlag.inbox);
  bool get isDrafts => hasFlag(MailboxFlag.drafts);
  bool get isSent => hasFlag(MailboxFlag.sent);
  bool get isJunk => hasFlag(MailboxFlag.junk);
  bool get isTrash => hasFlag(MailboxFlag.trash);
  bool get isArchive => hasFlag(MailboxFlag.archive);

  bool get isSpecialUse =>
      isInbox || isDrafts || isSent || isJunk || isTrash || isArchive;

  /// Creates a new uninitialized Mailbox
  Mailbox();

  /// Creates a new mailbox with the specified [name], [path] and [flags].
  ///
  /// Optionally specify the path separator with [pathSeparator]
  Mailbox.setup(String name, String path, this.flags, {String? pathSeparator}) {
    this.name = name;
    this.path = path;
    if (pathSeparator != null) {
      this.pathSeparator = pathSeparator;
    }
    if (name.toUpperCase() == 'INBOX' && !isInbox) {
      flags.add(MailboxFlag.inbox);
    }
    isMarked = hasFlag(MailboxFlag.marked);
    hasChildren = hasFlag(MailboxFlag.hasChildren);
    isSelected = hasFlag(MailboxFlag.select);
    isUnselectable = hasFlag(MailboxFlag.noSelect);
  }

  /// Checks of the mailbox has the given flag
  bool hasFlag(MailboxFlag flag) {
    return flags.contains(flag);
  }

  /// Tries to determine the parent mailbox from the given [knownMailboxes] and [separator].
  ///
  /// Set [create] to `false` in case the parent should only be determined from the known mailboxes (defaults to `true`).
  /// Set [createIntermediate] to `false` and  [create] to `true` to return the first known existing parent, when the direct parent is not known
  Mailbox? getParent(List<Mailbox> knownMailboxes, String separator,
      {bool create = true, bool createIntermediate = true}) {
    var lastSplitIndex = path.lastIndexOf(separator);
    if (lastSplitIndex == -1) {
      // this is a root mailbox, eg 'Inbox'
      return null;
    }
    var parentPath = path.substring(0, lastSplitIndex);
    var parent =
        knownMailboxes.firstWhereOrNull((box) => box.path == parentPath);
    if (parent == null && create) {
      lastSplitIndex = parentPath.lastIndexOf(separator);
      var parentName = (lastSplitIndex == -1)
          ? parentPath
          : parentPath.substring(lastSplitIndex + 1);
      parent = Mailbox.setup(parentName, parentPath, [MailboxFlag.noSelect]);
      if ((lastSplitIndex != -1) && (!createIntermediate)) {
        parent = parent.getParent(knownMailboxes, separator,
            create: true, createIntermediate: false);
      }
    }
    return parent;
  }

  @override
  String toString() {
    var buffer = StringBuffer()..write('"')..write(path)..write('"');
    buffer
      ..write(' exists: ')
      ..write(messagesExists)
      ..write(', highestModeSequence: ')
      ..write(highestModSequence);
    return buffer.toString();
  }

  /// Helper method to encode the specified [path] in Modified UTF7 encoding.
  static String encode(String path) {
    return _modifiedUtf7Codec.encodeText(path);
  }

  /// Sets the name from the original path
  ///
  /// This can be useful when the mailbox name was localized for viewing purposes.
  void setNameFromPath() {
    final splitIndex = _encodedPath.lastIndexOf(pathSeparator);
    if (splitIndex == -1 || splitIndex == _encodedPath.length - 1) {
      name = _encodedPath;
    } else {
      name = _encodedPath.substring(splitIndex);
    }
  }
}
