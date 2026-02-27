// class ITSModel {
//   final int totalRecords;
//   final int totalPages;
//   final int currentPage;
//   final bool next;
//   final bool previous;
//   final dynamic nextId;
//   final dynamic previousId;
//   final List<DeviceData> data;

//   ITSModel({
//     required this.totalRecords,
//     required this.totalPages,
//     required this.currentPage,
//     required this.next,
//     required this.previous,
//     required this.nextId,
//     required this.previousId,
//     required this.data,
//   });

//   factory ITSModel.fromJson(Map<String, dynamic> json) {
//     return ITSModel(
//       totalRecords: json["total_records"],
//       totalPages: json["total_pages"],
//       currentPage: json["current_page"],
//       next: json["next"],
//       previous: json["previous"],
//       nextId: json["next_id"],
//       previousId: json["previous_id"],
//       data: (json["data"] as List).map((e) => DeviceData.fromJson(e)).toList(),
//     );
//   }
// }

// class DeviceData {
//   final String? serialNumber;
//   final String? imei;
//   final String? lastSimcard;
//   final String? soni;
//   final String? model;
//   final String? zavod;
//   final String? rangi;
//   final String? tegishlilik;
//   final String? xususiyatlari;
//   final int? ishlabChiqarilganYili;
//   final String? deviceRasmmi;
//   final String? xujatRaqami;
//   final String? tashkilot;
//   final String? xudud;
//   final String? organ;
//   final String? modda;
//   final String? qism;
//   final String? band;
//   final DeviceCategory? gruhgaOid;
//   final DeviceCategory? nomlanishi;
//   final DeviceCategory? rusumi;
//   final DeviceCategory? sababi;
//   final DeviceCategory? xisobTuri;
//   final Author author;

//   DeviceData({
//     this.serialNumber,
//     this.imei,
//     this.lastSimcard,
//     this.soni,
//     this.model,
//     this.zavod,
//     this.rangi,
//     this.tegishlilik,
//     this.xususiyatlari,
//     this.ishlabChiqarilganYili,
//     this.deviceRasmmi,
//     this.xujatRaqami,
//     this.tashkilot,
//     this.xudud,
//     this.organ,
//     this.modda,
//     this.qism,
//     this.band,
//     this.gruhgaOid,
//     this.nomlanishi,
//     this.rusumi,
//     this.sababi,
//     this.xisobTuri,
//     required this.author,
//   });

//   factory DeviceData.fromJson(Map<String, dynamic> json) {
//     return DeviceData(
//       serialNumber: json["serial_number"],
//       imei: json["imei"],
//       lastSimcard: json["last_simcard"],
//       soni: json["soni"],
//       model: json["model"],
//       zavod: json["zavod"],
//       rangi: json["rangi"],
//       tegishlilik: json["tegishlilik"],
//       xususiyatlari: json["xususiyatlari"],
//       ishlabChiqarilganYili: json["ishlab_chiqarilgan_yili"],
//       deviceRasmmi: json["device_rasmmi"],
//       xujatRaqami: json["xujat_raqami"],
//       tashkilot: json["tashkilot"],
//       xudud: json["xudud"],
//       organ: json["organ"],
//       modda: json["modda"],
//       qism: json["qism"],
//       band: json["band"],
//       gruhgaOid: json["gruhga_oid"] != null ? DeviceCategory.fromJson(json["gruhga_oid"]) : null,
//       nomlanishi: json["nomlanishi"] != null ? DeviceCategory.fromJson(json["nomlanishi"]) : null,
//       rusumi: json["rusumi"] != null ? DeviceCategory.fromJson(json["rusumi"]) : null,
//       sababi: json["sababi"] != null ? DeviceCategory.fromJson(json["sababi"]) : null,
//       xisobTuri: json["xisob_turi"] != null ? DeviceCategory.fromJson(json["xisob_turi"]) : null,
//       author: Author.fromJson(json["author"]),
//     );
//   }
// }

// class DeviceCategory {
//   final int id;
//   final String createdAt;
//   final String updatedAt;
//   final bool isDeleted;
//   final String? deviceType;
//   final String? name;
//   final int author;

//   DeviceCategory({
//     required this.id,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.isDeleted,
//     this.deviceType,
//     this.name,
//     required this.author,
//   });

//   factory DeviceCategory.fromJson(Map<String, dynamic> json) {
//     return DeviceCategory(
//       id: json["id"],
//       createdAt: json["created_at"],
//       updatedAt: json["updated_at"],
//       isDeleted: json["is_deleted"],
//       deviceType: json["device_type"],
//       name: json["name"] ?? json["namen"] ?? json["sabab_name"] ?? json["tur_nomi"],
//       author: json["author"],
//     );
//   }
// }

// class Author {
//   final int id;
//   final String username;

//   Author({
//     required this.id,
//     required this.username,
//   });

//   factory Author.fromJson(Map<String, dynamic> json) {
//     return Author(
//       id: json["id"],
//       username: json["username"],
//     );
//   }
// }
