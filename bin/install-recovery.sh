#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11462656 165a714d5fc77769ee8924b5721f1c1a342dae25 8181760 d00f374ab8af97edc07ce09961b216c6569a320a
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery:11462656:165a714d5fc77769ee8924b5721f1c1a342dae25; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/by-name/boot:8181760:d00f374ab8af97edc07ce09961b216c6569a320a EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery 165a714d5fc77769ee8924b5721f1c1a342dae25 11462656 d00f374ab8af97edc07ce09961b216c6569a320a:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
