import 'package:equatable/equatable.dart';
import 'package:flutter_base_template/product/core/application.dart';
import 'package:flutter_base_template/product/enum/language_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum LanguageCubitStatus { initial, loading, success, failure }

class LanguageState with EquatableMixin {
  final LanguageCubitStatus status;
  final Languages language;

  LanguageState({
    this.status = LanguageCubitStatus.initial,
    this.language = Application.language,
  });

  LanguageState copyWith({
    LanguageCubitStatus? status,
    Languages? language,
  }) =>
      LanguageState(
        status: status ?? this.status,
        language: language ?? this.language,
      );

  @override
  List<Object?> get props => [status, language];
}

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState());

  Future<void> changeLanguage(Languages language) async =>
      emit(state.copyWith(language: language));
}
