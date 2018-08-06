#!/sbin/sh

bp="/system/build.prop"

busybox mount /system
busybox mount /data

for mod in update-build.prop;
  do

    for prop in `cat /tmp/$mod`;do
      export newprop=$(echo ${prop} | cut -d '=' -f1)
      sed -i "/${newprop}/d" /system/build.prop
      echo $prop >> /system/build.prop
    done
done

