import 'package:network_info_plus/network_info_plus.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

Function log = () {};

void main(List<String> args, Function callback) async {
  log = callback;

  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);

  var server = await shelf_io.serve(handler, '0.0.0.0', 8080);

  server.autoCompress = true;

  var ip = await NetworkInfo().getWifiIP();
  log(ip.toString());
  log('Serving at http://${server.address.host}:${server.port}');
}

Response _echoRequest(Request request) {
  String requestUrl = request.url.toString();
  String responseText = 'Request for "$requestUrl"';

  if (requestUrl.split('/')[0] == 'audio') {
    responseText += ' (It was for audio)';
  } else if (requestUrl.split('/')[0] == 'media') {
    responseText += ' (It was for media)';
  }

  log(responseText);
  return Response.ok(responseText,
      headers: {'content-type': 'application/json'});
}
