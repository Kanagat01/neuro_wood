part of 'profile_editor_bloc.dart';

@freezed
class ProfileEditorState with _$ProfileEditorState {
  const factory ProfileEditorState.initial() = ProfileEditorInitial;
  const factory ProfileEditorState.sending() = ProfileEditorSending;
  const factory ProfileEditorState.error({required String e}) =
      ProfileEditorError;
  const factory ProfileEditorState.sucess() = ProfileEditorSuccess;
}
