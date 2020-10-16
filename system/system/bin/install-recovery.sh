#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:56968492:ec790a31fe36dd1fb34507bbda7d728dd2ad3730; then
  applypatch --bonus /system/etc/recovery-resource.dat \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:50738472:65c1b5fad2d960239cc3a94aadb5269df51f583c \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:56968492:ec790a31fe36dd1fb34507bbda7d728dd2ad3730 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
