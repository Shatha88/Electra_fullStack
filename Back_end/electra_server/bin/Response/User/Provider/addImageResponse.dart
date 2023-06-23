// ignore_for_file: file_names

import 'dart:io';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:shelf/shelf.dart';

import '../../../Services/Supabase/supabaseEnv.dart';

addImageResponse(Request req) async {
  final byte = await req.read().expand((element) => element).toList();
  final userInfo = JWT.decode(req.headers["authorization"]!);
  final image = await createImage(byte: byte, id: userInfo.payload["sub"]);
  final hasImage = await checkImageProfile(idAuth: userInfo.payload["sub"]);
  final provID = await getIDUser(idAuth: userInfo.payload["sub"]);
  final url = await uploadImage(
      file: image, found: hasImage, id: userInfo.payload["sub"]);
  await image.delete();
  await sendURL(provID: provID, url: url);

  return Response.ok("upload done");
}

//create image inside project directory then return file
Future<File> createImage({required List<int> byte, required String id}) async {
  // Create a new directory, recursively creating non-existent directories.
  // Directory.fromRawPath("bin/image/$id.png" as Uint8List)
  //     .createSync(recursive: true);
  File("bin/images/$id.png").createSync(recursive: true);
  final file = File("bin/images/$id.png");
  await file.writeAsBytes(byte);

  return file;
}

//check if user has image in supabase storage then return boolean
checkImageProfile({required String idAuth}) async {
  final listImage = await SupabaseEnv()
      .supabase
      .storage
      .from("Image_stations")
      .list(path: "images");
  for (var element in listImage) {
    print(element.name);
    if (element.name.contains(idAuth)) {
      print("-----checkImageProfile---");

      return true;
    }
  }
  print("-----checkImageProfile---");
  return false;
}

//create function for upload image to supabase then return url

uploadImage({
  required bool found,
  required File file,
  required String id,
}) async {
  final supabase = SupabaseEnv().supabase.storage.from("Image_stations");
  if (found) {
    await supabase.update('images/$id.png', file);
  } else {
    await supabase.upload('images/$id.png', file);
  }
  final url = supabase.getPublicUrl('images/$id.png');
  print("-----uploadImage---");

  return url;
}

//get user id from table users by id auth  then return user id
getIDUser({required String idAuth}) async {
  final supabase = SupabaseEnv().supabase;

  final userID = (await supabase
      .from("providers")
      .select("id")
      .eq("id_auth", idAuth))[0]["id"];
  print("-----getIDUser---");

  return userID;
}

//send url to table image in database
sendURL({required int provID, required String url}) async {
  final supabase = SupabaseEnv().supabase.from("stations");

  final result = await supabase
      .upsert({"id_prov": provID, "image_url": url}).eq('id_prov', provID);
  print("-----sendURL---");

  return result;
}

// for delete image fromn server

deleteImageProfile({required String imageName}) async {
  await SupabaseEnv()
      .supabase
      .storage
      .from("Image_stations")
      .remove(["images/$imageName"]);

  return false;
}
