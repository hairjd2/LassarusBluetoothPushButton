# LassarusBluetoothPushButton
## Reports
### Wednesday, December 14, 2022
- Connected all of the hardware and started testing the components
- Got a baseline of the code to work so that the module sends data to my phone. 
- Need to debounce the button and work on a flutter app.
### Thursday, December 15, 2022
- After some struggles with the flutter dependencies, I got a working dev environment for flutter
- I have started to relearn how to use the language dart, as well as the platform
- Created a baseline, bottom navigation design to the app
### Saturday, December 17, 2022
- Added more to the profile page so that it globally stores the name of the patient.
- Setup a list so that I can list out the devices so the patient can determine what device to connect to
- Might just have it so that they have to connect manually to the device and I can just read from it
- Struggled a bit with figuring out how to list the scanned devices as well as trying out example versions as they are not up to date
- Plan to start working on firebase implementation after bluetooth is being read from.
### Monday, January 16, 2022
- Took a (far too) long break from the project and have started to get back into it to get as much done as possible
- Took another crack at the problem that I was having with the flutter blue library
    - Example code didn't work
    - Spent some time with a friend of mine trying to get my code to work, which it did not
    - Ended up being that the library was no longer supported and I needed to use a new one called "flutter_blue_plus"
- I was able to use their code from their example, and put it into mine
- The app now as 2 pages, one for scanning and connecting to the device and one for putting in profile information
#### Goals for tomorrow
- I plan to switch gears now to getting firebase working
- I plan to also look into a package called "hive" for local storage of personal information
## How to set up
1. Get the app
    a. For now, will either need to build the app with flutter or download the apk (I need to include this)
2. Connect to device on the scan page