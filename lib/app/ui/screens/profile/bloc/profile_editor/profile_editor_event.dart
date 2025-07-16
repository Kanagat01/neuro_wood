part of 'profile_editor_bloc.dart';

@freezed
class ProfileEditorEvent with _$ProfileEditorEvent {
  const factory ProfileEditorEvent.save() = _Save;
}