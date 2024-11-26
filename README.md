# flutter_clean_sample


---
Execution failed for task ':shared_preferences_android:compileDebugJavaWithJavac'.
> Could not resolve all files for configuration ':shared_preferences_android:androidJdkImage'.
> Failed to transform core-for-system-modules.jar to match attributes {artifactType=_internal_android_jdk_image, org.gradle.libraryelements=jar, org.gradle.usage=java-runtime}.
> Execution failed for JdkImageTransform: /Users/convo/Library/Android/sdk/platforms/android-34/core-for-system-modules.jar.
> Error while executing process /Applications/Android Studio.app/Contents/jbr/Contents/Home/bin/jlink with arguments {--module-path /Users/convo/.gradle/caches/transforms-3/32aa594f3ac2d11643425d7cad579bd5/transformed/output/temp/jmod --add-modules java.base --output /Users/convo/.gradle/caches/transforms-3/32aa594f3ac2d11643425d7cad579bd5/transformed/output/jdkImage --disable-plugin system-modules}
## Steps to Resolve above error

### 1. Upgrade the Android Gradle Plugin
Update the `android/build.gradle` file:

**Before:**
```gradle
id "com.android.application" version "7.3.0" apply false
```
**After:**
```gradle
id "com.android.application" version "8.3.2" apply false
```

there maybe other error related to jdk
first in gradle-wrapper android
distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-bin.zip
upgrade to this 
use below command in terminal
cd android
./gradlew wrapper --gradle-version=8.4

and run flutter doctor --verbose
