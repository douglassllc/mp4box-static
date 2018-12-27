#!/bin/sh
set +e
cd $(dirname $0)

tar_exec=$(command -v gtar)
if [ $? -ne 0 ]; then
	tar_exec=$(command -v tar)
fi

download () {
	curl -L -# -A 'https://github.com/douglassllc/@douglassllc/mp4box-static' -o $2 $1
}

echo 'windows x64'
echo '  downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/win64/gpac-0.7.2-DEV-latest-master-x64.exe' win32-x64.exe
echo '  moving'
cp win32-x64.exe ../bin/win32/x64/MP4Box.exe

echo 'windows ia32'
echo '  downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/win32/gpac-0.7.2-DEV-latest-master-win32.exe' win32-ia32.exe
echo '  moving'
cp win32-ia32.exe ../bin/win32/ia32/MP4Box.exe

echo 'linux x64'
echo '  downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/linux64/gpac/gpac_0.7.2-DEV-latest-master_amd64.deb' linux-x64.deb
echo '  extracting'
mkdir -p tmp
cp linux-x64.deb tmp
pushd tmp
ar -x linux-x64.deb
$tar_exec -x --strip-components 1 -f data.tar.xz --wildcards '*/MP4Box'
echo '  moving'
cp usr/bin/MP4Box ../../bin/linux/x64/
popd

echo 'linux ia32'
echo '  downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/linux32/gpac/gpac_0.7.2-DEV-latest-master_i386.deb' linux-ia32.deb
echo '  extracting'
cp linux-ia32.deb tmp
pushd tmp
ar -x linux-ia32.deb
$tar_exec -x --strip-components 1 -f data.tar.xz --wildcards '*/MP4Box'
echo '  moving'
cp usr/bin/MP4Box ../../bin/linux/ia32/
popd

echo 'darwin x64'
echo '  downloading from evermeet.cx'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/macosx_64/gpac-0.7.2-DEV-latest-master.pkg' darwin-x64-mp4box.pkg
echo '  extracting'
cp darwin-x64-mp4box.pkg tmp
pushd tmp
pkgutil --expand-full darwin-x64-mp4box.pkg darwin
echo '  moving'
cp darwin/tmppkg.pkg/Payload/GPAC.app/Contents/MacOS/MP4Box ../../bin/darwin/x64/
popd

rm -rf tmp
