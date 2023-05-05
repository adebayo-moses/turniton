if not (Bluetooth is on) then
```
Instead of this:
```
if not Bluetooth is on then
```

Here's the updated script:

```
tell application "System Events"
 --activate Bluetooth if it's disabled
 if not (Bluetooth is on) then
  turn on Bluetooth
 end if
 
 --connect to the Bluetooth device
 set deviceName to "Moses's Beats Pill+"
 set deviceFound to false
 repeat with theDevice in every Bluetooth device
  if name of theDevice is deviceName then
   set deviceFound to true
   if connected of theDevice is false then
    connect theDevice
   end if
  end if
 end repeat
 
 if not deviceFound then
  display alert "Could not find your Bluetooth device!"
 end if
end tell

tell application "System Preferences"
 reveal anchor "keyboard" of pane "com.apple.preference.keyboard"
end tell
