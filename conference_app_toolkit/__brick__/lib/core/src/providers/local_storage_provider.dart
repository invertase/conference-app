import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/local_storage_service.dart';

final localStorage =
    Provider<LocalStorageService>((_) => LocalStorageService());
