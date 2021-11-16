#!/bin/sh
goCacheRootDir="/opt/hostedtoolcache/go"
goVersions="/opt/goVersions.txt"
:> $goVersions
chmod 777 $goVersions
dir=$(ls -l "$goCacheRootDir" | sed '{1!G;h;$!d}' | awk '/^d/ {print $NF}')
for i in $dir
do
echo $i
echo $i >> $goVersions
done
new_ver=`sed -n '1p' $goVersions`
old_ver=`sed -n '2p' $goVersions`
echo "rm -rf $goCacheRootDir/go/1.15.15"
rm -rf $goCacheRootDir/go/1.15.15
echo "cp -rf $goCacheRootDir/$new_ver $goCacheRootDir/go/1.15.15"
cp -rf $goCacheRootDir/$new_ver $goCacheRootDir/go/1.15.15
