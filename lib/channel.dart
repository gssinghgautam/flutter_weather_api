import 'package:flutter_weather/application_configuration.dart';
import 'package:flutter_weather/cities/city_controller.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'flutter_weather.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class FlutterWeatherChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  
  Db db;
  //ApplicationConfiguration app;
  DbCollection peopleCollection;
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
    //app = ApplicationConfiguration("app/config.yaml");
    //print(app.database);
      db = Db("mongodb://flutter_weather:Kunwar1993@ds259596.mlab.com:59596/heroku_lpb6gczj");
      await db.open();
      print("Database is open");
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/cities")
    .link(() => CityController(db : db));
    return router;
  }

  @override
  Future close() {
    return super.close();
  }
}
