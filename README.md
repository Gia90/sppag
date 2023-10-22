
# SPPAG

It simply stands for "Script to Pull/Push Apks from the Google playstore".
It's also the reverse of "GAPPS" (Google Apps).

Spagg is acript to wirelessly pull apks from a device and push them to another one thorugh ADB (Android debug bridge).
It can be very useful to easily install apps only available in the Google playstore on de-googled android devices without violating google policies.
See `Example use case: Installing apps only available in the Google playstore on de-googled android devices` below for more information.

## Prerequisites

- ADB tools installed on your linux machine
- ADB enabled on both devices

## Usage 

- Connect both android devices to your linux machine using wireless ADB.
- Run `./sppag <emulator-IP> <mobile-IP>`
- Follow the on-screen instructions

## Example use case: Installing apps only available in the Google playstore on de-googled android devices

### 1. Configure an android emulator as source for your apps

- Install an android emulator on your computer (e.g. Android-x86 in Virtualbox).
- Install google services and google playstore in the emulator.
- Login with a google account and download all the apps you need (even paid ones).
- Enable wireless ADB in the emulator.
- Run `adb connect <emulator-IP>` to connect the emulated android to your (host) computer.

### 2. Connect your de-google device through ADB

- Enable wireless ADB on the de-googled device.
- Run `adb connect <degoogled-device-IP>` to connect the emulated android to your (host) computer.
  > NOTE: you might need to run `adb pair` beforehand depending on the android version.

### 3. Transfer apps from the emulator to the de-googled device

- Run `./sppag <emulator-IP> <degoogled-device-IP>`
- Select one of the apps installed in the emulator to install it on the de-googled device.
