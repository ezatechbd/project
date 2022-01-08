# flutter_scheduler

Schedule local notification to a specific time with corn expression 

## Getting Started

**step 01:** After importing [android_alarm_manager_plus](https://pub.dev/packages/android_alarm_manager_plus) to your project as usual, add the following to your AndroidManifest.xml within the <manifest></manifest> tags:

```
<uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
<uses-permission android:name="android.permission.WAKE_LOCK"/>
```
**step 02:** Next, within the ```<application> </application>``` tags, add:

```
<service
    android:name="dev.fluttercommunity.plus.androidalarmmanager.AlarmService"
    android:permission="android.permission.BIND_JOB_SERVICE"
    android:exported="false"/>
<receiver
    android:name="dev.fluttercommunity.plus.androidalarmmanager.AlarmBroadcastReceiver"
    android:exported="false"/>
<receiver
    android:name="dev.fluttercommunity.plus.androidalarmmanager.RebootBroadcastReceiver"
    android:enabled="false"
    android:exported="false">
    <intent-filter>
        <action android:name="android.intent.action.BOOT_COMPLETED" />
    </intent-filter>
</receiver>
```
**step 03:** Next, within the ```<application></application>``` tags, after **android:label** add:

```
android:name="io.flutter.app.FlutterApplication"
```
## step 03 is very important. Without this your apps will works fine when it is running but in the background mode apps will be forced stopped and notification will not working.  
