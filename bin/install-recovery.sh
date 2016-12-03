#!/system/bin/sh
if [ -f /system/etc/recovery-transform.sh ]; then
  exec sh /system/etc/recovery-transform.sh 11423744 a0d614fd68528f4b163b72e64adb5cd4633070d6 8142848 c112a22287b171472003e04d8189fec4b22d1abe
fi

if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery:11423744:a0d614fd68528f4b163b72e64adb5cd4633070d6; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/by-name/boot:8142848:c112a22287b171472003e04d8189fec4b22d1abe EMMC:/dev/block/platform/mtk-msdc.0/by-name/recovery a0d614fd68528f4b163b72e64adb5cd4633070d6 11423744 c112a22287b171472003e04d8189fec4b22d1abe:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
