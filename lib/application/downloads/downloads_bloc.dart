import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix/domain/core/failures/main_failures.dart';
import 'package:netflix/domain/downloads/i_downloads_repo.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.inital()) {
    on<_GetDownloadsImage>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          downloadFailureOrSuccessOption: none(),
        ),
      );
      final Either<MainFailure, List<Downloads>> downloadOption =
          await _downloadsRepo.getDownloadsImage();
      emit(
        downloadOption.fold(
          (failure) => state.copyWith(
            isLoading: false,
            downloadFailureOrSuccessOption: some(
              left(failure),
            ),
          ),
          (success) => state.copyWith(
            isLoading: false,
            downloadFailureOrSuccessOption: some(
              right(success),
            ),
          ),
        ),
      );
    });
  }
}
