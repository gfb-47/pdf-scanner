// Generated file.
<<<<<<< HEAD
//
// If you wish to remove Flutter's multidex support, delete this entire file.
//
// Modifications to this file should be done in a copy under a different name
// as this file may be regenerated.

package io.flutter.app;

import android.app.Application;
=======
// If you wish to remove Flutter's multidex support, delete this entire file.

package io.flutter.app;

>>>>>>> e429c54bad9194a222b7ade443c68985f576271a
import android.content.Context;
import androidx.annotation.CallSuper;
import androidx.multidex.MultiDex;

/**
<<<<<<< HEAD
 * Extension of {@link android.app.Application}, adding multidex support.
 */
public class FlutterMultiDexApplication extends Application {
=======
 * Extension of {@link io.flutter.app.FlutterApplication}, adding multidex support.
 */
public class FlutterMultiDexApplication extends FlutterApplication {
>>>>>>> e429c54bad9194a222b7ade443c68985f576271a
  @Override
  @CallSuper
  protected void attachBaseContext(Context base) {
    super.attachBaseContext(base);
    MultiDex.install(this);
  }
}
