chcp 65001
cd /d %~dp0

call ServerSetting.bat

java %basicArgs% %networkArgs% %jarArgs% %postArgs%