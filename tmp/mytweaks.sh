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


for mod in update-prop.default;
  do

    for prop in `cat /tmp/$mod`;do
      export newprop=$(echo ${prop} | cut -d '=' -f1)
      sed -i "/${newprop}/d" /system/etc/prop.default
      echo $prop >> /system/etc/prop.default
    done
done

sed -i '/ro.build.description/d' /system/build.prop
echo "ro.build.description=star2ltexx-user 8.0.0 R16NW G965FXXU1BRF8 release-keys" >> /system/build.prop
