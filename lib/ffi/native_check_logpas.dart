import 'dart:ffi'; // Для FFI
import 'dart:io'; // Для определения платформы

import 'package:ffi/ffi.dart'; // Для работы с указателями и строками

// Определение типа функции для FFI
typedef CheckCredentialsNative = Int32 Function(Pointer<Utf8>, Pointer<Utf8>);
typedef CheckCredentials = int Function(Pointer<Utf8>, Pointer<Utf8>);

final DynamicLibrary nativeLib = Platform.isAndroid
    ? DynamicLibrary.open('libnative_check_logpas.so') // Для Android
    : DynamicLibrary.process(); // Для iOS/Windows

// Поиск функции в библиотеке
final CheckCredentials checkCredentials = nativeLib
    .lookup<NativeFunction<CheckCredentialsNative>>('check_credentials')
    .asFunction<CheckCredentials>();
