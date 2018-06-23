#!/bin/bash
echo "**-_ Extract apks from emulated android x86 with GAPPS and install them into your Google free mobile through adb _-**"
echo

# TODO: what if mobile is connected through usb?
eip=$1
mip=$2

echo "Emulator IP: $1"
echo "Your mobile IP: $2"

# Connect to devices through adb
adb connect $eip
adb connect $mip

# Create working dir
wdir="/tmp/sppag/"
mkdir -p $wdir
cd $wdir

# Extract trasport ids
etid=$(adb devices -l | grep $eip | rev | cut -d: -f1 | rev )
mtid=$(adb devices -l | grep $mip | rev | cut -d: -f1 | rev )

while : ; do
    psparray=($(adb -t $etid shell pm list packages -3 | sed 's/package://g'))
    echo
    echo "Choose the app to extract and install on your mobile:"
    for i in "${!psparray[@]}"
    do
        echo "$i: ${psparray[i]}"
    done
    read pi
    
    app=${psparray[pi]}
    apk=$(adb -t $etid shell pm path $app | sed 's/package://g')
    
    echo "Pulling $app apk..."
    adb -t $etid pull $apk ${app}.apk
    
    echo "Installing on mobile"
    adb -t $mtid install -r ${app}.apk

done

# TODO: add cleaning trap
rm -rf $wdir
