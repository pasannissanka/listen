// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_librivox_API.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookLibrivoxAPI _$BookLibrivoxAPIFromJson(Map<String, dynamic> json) {
  return BookLibrivoxAPI(
    json['id'] as String,
    json['title'] as String,
    json['description'] as String,
    json['url_text_source'] as String,
    json['language'] as String,
    json['copyright_year'] as String,
    json['num_sections'] as String,
    json['url_rss'] as String,
    json['url_zip_file'] as String,
    json['url_project'] as String,
    json['url_librivox'] as String,
    json['url_other'] as String,
    json['totaltime'] as String,
    json['totaltimesecs'] as int,
    (json['authors'] as List)
        ?.map((e) =>
            e == null ? null : Author.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BookLibrivoxAPIToJson(BookLibrivoxAPI instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'url_text_source': instance.urlTextSource,
      'language': instance.language,
      'copyright_year': instance.copyrightYear,
      'num_sections': instance.numSections,
      'url_rss': instance.urlRss,
      'url_zip_file': instance.urlZipFile,
      'url_project': instance.urlProject,
      'url_librivox': instance.urlLibrivox,
      'url_other': instance.urlOther,
      'totaltimesecs': instance.totaltimesecs,
      'totaltime': instance.totaltime,
      'authors': instance.authors?.map((e) => e?.toJson())?.toList(),
    };
