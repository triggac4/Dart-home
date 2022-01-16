import 'dart:ffi';

class LearnPageController {
  final String? id;
  final bool _isUnknown;
  LearnPageController.home()
      : id = null,
        _isUnknown = false;
  LearnPageController.detail({required this.id}) : _isUnknown = false;
  LearnPageController.unknown()
      : id = null,
        _isUnknown = true;

  bool get isUnknown {
    return _isUnknown;
  }

  bool get isHome {
    if (id == null) {
      if (isUnknown) {
        return false;
      } else {
        return true;
      }
    }
    return false;
  }

  bool get isDetail {
    if (id == null) {
      return false;
    }
    return true;
  }
}
