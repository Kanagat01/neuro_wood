part of 'profile_editor_bloc.dart';

@freezed
class ProfileEditorState with _$ProfileEditorState {
  const factory ProfileEditorState.initial() = _Initial;
  const factory ProfileEditorState.sending() = _Sending;
  const factory ProfileEditorState.error({required String e}) = _Error;
  const factory ProfileEditorState.sucess() = _Success;
}
