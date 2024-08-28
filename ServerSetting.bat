@REM Basic info
set serverJar=spigot-1.21.1.jar
set minMem=1G
set maxMem=4G

@REM Network info, prevent minecraft access network other than download skins
@REM Auto updates brings trouble more than useful
set proxyHost=127.0.0.1
set proxyPort=1
set nonProxyHosts="localhost|127.0.0.1

@REM JVM startup flags

@REM Basic
@set basicArgs=-Xms%minMem% -Xmx%maxMem%

@REM Network
@set networkArgs=-Dhttp.proxyHost=%proxyHost% -Dhttp.proxyPort=%proxyPort% -Dhttps.proxyHost=%proxyHost% -Dhttps.proxyPort=%proxyPort% -Dhttp.nonProxyHosts=%nonProxyHosts%

@REM Set jar
@set jarArgs=-jar "%serverJar%"

@REM Set post startup argument(spigot argument)
@set postArgs=nogui
