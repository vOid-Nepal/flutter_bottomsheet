class Contact {
  final String name;
  final int phoneNo;
  final ContactGroup group;

  Contact({this.name, this.phoneNo, this.group});
}

enum ContactGroup { FAMILY, FRIEND, OTHERS }

extension properties on ContactGroup {
  String get name {
    switch (this) {
      case ContactGroup.FAMILY:
        return "Family";
      case ContactGroup.FRIEND:
        return "Friend";
      case ContactGroup.OTHERS:
        return "Others";
    }
  }
}
