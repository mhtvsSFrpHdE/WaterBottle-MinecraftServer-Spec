cd /d %~dp0

@REM Basic info
set serverJar=spigot-1.15.2.jar
set minMem=8G
set maxMem=10G

@REM Network info
set proxyHost=127.0.0.1
set proxyPort=1
set nonProxyHosts="127.0.0.1"

@REM JVM startup flags

@REM Basic
@set basicArgs=-Dfile.encoding=UTF-8 -Xms%minMem% -Xmx%maxMem% -d64

@REM Network
@set networkArgs=-Dhttp.proxyHost=%proxyHost% -Dhttp.proxyPort=%proxyPort% -Dhttp.nonProxyHosts=%nonProxyHosts%

@REM Optimized JVM startup flags
@REM https://aikar.co/2018/07/02/tuning-the-jvm-g1gc-garbage-collector-flags-for-minecraft/
@set optimizedArgs=-XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true

@REM Set jar and post startup argument
set jarArgs=-jar "%serverJar%" nogui

:boot
java %basicArgs% %networkArgs% %optimizedArgs% %jarArgs%

@echo Restart server after 15 seconds.
@timeout /t 15

goto boot

exit