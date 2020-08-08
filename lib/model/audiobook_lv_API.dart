import 'package:Listen/model/author.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'audiobook_lv_API.g.dart';

@JsonSerializable(explicitToJson: true)
class AudioBookLVAPI extends Equatable{

  final String id;

  final String title;
  final String description;

  @JsonKey(name: 'url_text_source')
  final String urlTextSource;
  
  final String language;

  @JsonKey(name: 'copyright_year')
  final String copyrightYear;

  @JsonKey(name: 'num_sections')
  final String numSections;

  @JsonKey(name: 'url_rss')
  final String urlRss;

  @JsonKey(name: 'url_zip_file')
  final String urlZipFile;

  @JsonKey(name: 'url_project')
  final String urlProject;
  
  @JsonKey(name: 'url_librivox')
  final String urlLibrivox;
  
  @JsonKey(name: 'url_other')
  final String urlOther;

  final int totaltimesecs;
  final String totaltime;

  final List<Author> authors;

  @JsonKey(ignore: true)
  String _thumbUrl;

  String get thumbUrl => this._thumbUrl;

  set thumbUrl(String thumbUrl) => this._thumbUrl = thumbUrl;

  AudioBookLVAPI(
    this.id,
    this.title,
    this.description,
    this.urlTextSource,
    this.language,
    this.copyrightYear,
    this.numSections,
    this.urlRss,
    this.urlZipFile,
    this.urlProject,
    this.urlLibrivox,    
    this.urlOther,
    this.totaltime,
    this.totaltimesecs,
    this.authors,
  );

  factory AudioBookLVAPI.fromJson(Map<String, dynamic> json) => _$AudioBookLVAPIFromJson(json);

  Map<String, dynamic> toJson() => _$AudioBookLVAPIToJson(this);

  @override
  List<Object> get props => [
    id,
    title,
    description,
    urlTextSource,
    language,
    copyrightYear,
    numSections,
    urlRss,
    urlZipFile,
    urlProject,
    urlLibrivox,    
    urlOther,
    totaltime,
    totaltimesecs,
    authors,
  ];

  @override
  String toString() {
    return "$title $id $description $urlLibrivox";
  }
}
