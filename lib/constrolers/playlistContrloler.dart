import 'package:on_audio_query/on_audio_query.dart';

class playListcontroller{

  Future<List<SongModel>> getSongsInPlaylist({required int playlistId}) async {
  final songsFromPlaylist = await OnAudioQuery().queryAudiosFrom(AudiosFromType.PLAYLIST,playlistId);
  return songsFromPlaylist;
}

}