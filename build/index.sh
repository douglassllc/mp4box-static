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

echo 'Windows x64'
echo '-> downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/win64/gpac-0.7.2-DEV-latest-master-x64.exe' win32-x64.exe
echo '-> extracting'
mkdir -p win32-x64-unpacked
cp win32-x64.exe win32-x64-unpacked/setup.exe
pushd win32-x64-unpacked
7z x setup.exe
echo '-> moving'
cp mp4box.exe ../../bin/win32/x64/MP4Box.exe
cp js.dll ../../bin/win32/x64/
cp libcryptoMD.dll ../../bin/win32/x64/
cp libsslMD.dll ../../bin/win32/x64/
popd
rm -rf win32-x64-unpacked

echo 'Windows ia32'
echo '-> downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/win32/gpac-0.7.2-DEV-latest-master-win32.exe' win32-ia32.exe
echo '-> extracting'
mkdir -p win32-ia32-unpacked
cp win32-ia32.exe win32-ia32-unpacked/setup.exe
pushd win32-ia32-unpacked
7z x setup.exe
echo '-> moving'
cp mp4box.exe ../../bin/win32/ia32/MP4Box.exe
cp js.dll ../../bin/win32/ia32/
cp libcryptoMD.dll ../../bin/win32/ia32/
cp libsslMD.dll ../../bin/win32/ia32/
popd
rm -rf win32-ia32-unpacked

echo 'Linux ia32'
echo '-> downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/linux32/gpac/gpac_0.7.2-DEV-latest-master_i386.deb' linux-ia32.deb
echo '-> extracting'
mkdir -p linux-ia32-unpacked
cp linux-ia32.deb linux-ia32-unpacked
pushd linux-ia32-unpacked
ar -x linux-ia32.deb
$tar_exec -x --strip-components 1 -f data.tar.xz --wildcards '*/MP4Box'
echo '-> moving'
cp usr/bin/MP4Box ../../bin/linux/ia32/
popd
rm -rf linux-ia32-unpacked

echo 'Linux x64'
echo '-> downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/linux64/gpac/gpac_0.7.2-DEV-latest-master_amd64.deb' linux-x64.deb
echo '-> extracting'
mkdir -p linux-x64-unpacked
cp linux-x64.deb linux-x64-unpacked
pushd linux-x64-unpacked
ar -x linux-x64.deb
$tar_exec -x --strip-components 1 -f data.tar.xz --wildcards '*/MP4Box'
echo '-> moving'
cp usr/bin/MP4Box ../../bin/linux/x64/
popd
rm -rf linux-x64-unpacked

echo 'Darwin x64'
echo '-> downloading from download.tsi.telecom-paristech.fr'
download 'https://download.tsi.telecom-paristech.fr/gpac/new_builds/macosx_64/gpac-0.7.2-DEV-latest-master.pkg' darwin-x64-mp4box.pkg
echo '-> extracting'
mkdir -p darwin-x64-unpacked
cp darwin-x64-mp4box.pkg darwin-x64-unpacked
pushd darwin-x64-unpacked
pkgutil --expand-full darwin-x64-mp4box.pkg darwin
echo '-> moving'
cp darwin/tmppkg.pkg/Payload/GPAC.app/Contents/MacOS/MP4Box ../../bin/darwin/x64/
cp -rp darwin/tmppkg.pkg/Payload/GPAC.app/Contents/MacOS/lib ../../bin/darwin/x64/
popd
rm -rf darwin-x64-unpacked
