Release Process
====================

###Create a GPG key

 Off course only do this if you don't have a GPG key yet

	gpg --gen-key

 If you don't know what to choose you can use the following options

	(1) RSA and RSA (default)
	2048
	0 = key does not expire
	y
	Your name
	Your email
	Optionally a comment
	o
	Enter your passphrase twice
	

###Create a Gitian build directory

 Before you start make sure the prerequisites for Gitian (vmbuilder, apt-cacher-ng, ruby) are installed

 https://github.com/devrandom/gitian-builder

 You only need to perform these steps when any of the build dependencies change.

 It's easy to create pull requests if you create your own fork of the gitian.sigs.git project, but you can also just share the signature in another form

	mkdir build
	cd build
	git clone https://github.com/reddcoin-project/reddcoin.git
	git clone https://github.com/devrandom/gitian-builder.git
	git clone https://github.com/reddcoin-project/gitian.sigs.git
	
	mkdir gitian-builder/inputs
	cd gitian-builder/inputs

 Fetch the build dependencies

	wget 'http://miniupnp.free.fr/files/download.php?file=miniupnpc-1.8.tar.gz' -O miniupnpc-1.8.tar.gz
	wget 'https://www.openssl.org/source/openssl-1.0.1g.tar.gz'
	wget 'http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz'
	wget 'http://zlib.net/zlib-1.2.8.tar.gz'
	wget 'ftp://ftp.simplesystems.org/pub/png/src/history/libpng16/libpng-1.6.8.tar.gz'
	wget 'https://fukuchi.org/works/qrencode/qrencode-3.4.3.tar.bz2'
	wget 'http://downloads.sourceforge.net/project/boost/boost/1.55.0/boost_1_55_0.tar.bz2'
	wget 'https://svn.boost.org/trac/boost/raw-attachment/ticket/7262/boost-mingw.patch' -O boost-mingw-gas-cross-compile-2013-03-03.patch
	wget 'https://download.qt-project.org/official_releases/qt/5.2/5.2.0/single/qt-everywhere-opensource-src-5.2.0.tar.gz'

 Create the VMs (and grab a coffee, or five). Make sure you have device mapper kernel module (dm-mod) loaded. If you are running a Linux distribution other than Ubuntu, you need to make sure /bin, /sbin, /usr/sbin are all in your PATH.

 The following may be run as a normal user or root:

	cd ../
	bin/make-base-vm --suite precise --arch i386
	bin/make-base-vm --suite precise --arch amd64

 Build the inputs (get some more coffee). Make sure you have KVM kernel module (kvm) loaded. If there is any error, you can check the log files (var/install.log, var/build.log).

 The following must be run as root:

	./bin/gbuild ../reddcoin/contrib/gitian-descriptors/boost-linux.yml
	mv build/out/boost-*.zip inputs/
	./bin/gbuild ../reddcoin/contrib/gitian-descriptors/deps-linux.yml
	mv build/out/bitcoin-deps-*.zip inputs/
	./bin/gbuild ../reddcoin/contrib/gitian-descriptors/boost-win.yml
	mv build/out/boost-*.zip inputs/
	./bin/gbuild ../reddcoin/contrib/gitian-descriptors/deps-win.yml
	mv build/out/bitcoin-deps-*.zip inputs/
	./bin/gbuild ../reddcoin/contrib/gitian-descriptors/qt-win.yml
	mv build/out/qt-*.zip inputs/

* * *

###Double-check there are no upstream commits we could or should use

	bitcoin
	litecoin

###Update (commit) version in sources

 With all the VMs and dependency packages ready, it's time to make any necessary change to reddcoin repository:

	cd ../reddcoin

	reddcoin-qt.pro
	doc/README*
	share/setup.nsi
	src/clientversion.h (change CLIENT_VERSION_IS_RELEASE to true)

###Write release notes. git shortlog helps a lot, for example:

	git shortlog --no-merges v0.7.2..v0.8.0

###Push the changes to Github

	git push

###Tag the release on Github

* * *

###Perform gitian builds

 From the build directory created above
  
	export SIGNER=(your PGP key used for gitian)
	export VERSION=1.1.3.1
	cd ../gitian-builder

 Build reddcoind and reddcoin-qt on Linux32, Linux64:
  
	./bin/gbuild --commit reddcoin=v${VERSION} ../reddcoin/contrib/gitian-descriptors/gitian-linux.yml
	./bin/gsign --signer "$SIGNER" --release ${VERSION} --destination ../gitian.sigs/ ../reddcoin/contrib/gitian-descriptors/gitian-linux.yml
	pushd build/out
	zip -r reddcoin-${VERSION}-linux-gitian.zip *
	mv reddcoin-${VERSION}-linux-gitian.zip ../../
	popd

 Build reddcoind and reddcoin-qt on Win32:

	./bin/gbuild --commit reddcoin=v${VERSION} ../reddcoin/contrib/gitian-descriptors/gitian-win.yml
	./bin/gsign --signer "$SIGNER" --release ${VERSION}-win --destination ../gitian.sigs/ ../reddcoin/contrib/gitian-descriptors/gitian-win.yml
	pushd build/out
	zip -r reddcoin-${VERSION}-win-gitian.zip *
	mv reddcoin-${VERSION}-win-gitian.zip ../../
	popd

 Build output expected:

  1. linux 32-bit and 64-bit binaries + source (reddcoin-${VERSION}-linux-gitian.zip)
  2. windows 32-bit binaries, installer + source (reddcoin-${VERSION}-win-gitian.zip)
  3. Gitian signatures (in gitian.sigs/${VERSION}[-win]/(your gitian key)/

 Commit your signature to gitian.sigs:

	cd ../gitian.sigs
	git add ${VERSION}/${SIGNER}
	git add ${VERSION}-win/${SIGNER}
	git commit -a
	git push  # Assuming you can push to the gitian.sigs tree, otherwise create a pull request

* * *

### After 3 or more people have gitian-built, repackage gitian-signed zips:

 From the gitian-builder directory created above

	export VERSION=1.1.3.1
	mkdir reddcoin-${VERSION}-linux-gitian
	pushd reddcoin-${VERSION}-linux-gitian
	unzip ../reddcoin-${VERSION}-linux-gitian.zip
	mkdir gitian
	cp ../reddcoin/contrib/gitian-downloader/*.pgp ./gitian/
	for signer in $(ls ../gitian.sigs/${VERSION}/); do
	 cp ../gitian.sigs/${VERSION}/${signer}/reddcoin-build.assert ./gitian/${signer}-build.assert
	 cp ../gitian.sigs/${VERSION}/${signer}/reddcoin-build.assert.sig ./gitian/${signer}-build.assert.sig
	done
	zip -r reddcoin-${VERSION}-linux-gitian.zip *
	cp reddcoin-${VERSION}-linux-gitian.zip ../
	popd
	mkdir reddcoin-${VERSION}-win-gitian
	pushd reddcoin-${VERSION}-win-gitian
	unzip ../reddcoin-${VERSION}-win-gitian.zip
	mkdir gitian
	cp ../reddcoin/contrib/gitian-downloader/*.pgp ./gitian/
	for signer in $(ls ../gitian.sigs/${VERSION}-win32/); do
	 cp ../gitian.sigs/${VERSION}-win/${signer}/reddcoin-build.assert ./gitian/${signer}-build.assert
	 cp ../gitian.sigs/${VERSION}-win/${signer}/reddcoin-build.assert.sig ./gitian/${signer}-build.assert.sig
	done
	zip -r reddcoin-${VERSION}-win-gitian.zip *
	cp reddcoin-${VERSION}-win-gitian.zip ../
	popd

repackage gitian builds for release as stand-alone zip/tar/installer exe

**Linux .tar.gz:**

	unzip reddcoin-${VERSION}-linux-gitian.zip -d reddcoin-${VERSION}-linux
	tar czvf reddcoin-${VERSION}-linux.tar.gz reddcoin-${VERSION}-linux
	rm -rf reddcoin-${VERSION}-linux

**Windows .zip and setup.exe:**

	unzip reddcoin-${VERSION}-win-gitian.zip -d reddcoin-${VERSION}-win
	mv reddcoin-${VERSION}-win/reddcoin-*-setup.exe .
	zip -r reddcoin-${VERSION}-win.zip reddcoin-${VERSION}-win
	rm -rf reddcoin-${VERSION}-win

###Next steps:

* Code-sign Windows -setup.exe (in a Windows virtual machine) and
  OSX Bitcoin-Qt.app (Note: only Gavin has the code-signing keys currently)

* upload builds to SourceForge

* create SHA256SUMS for builds, and PGP-sign it

* update reddcoin.com version
  make sure all OS download links go to the right versions

* update forum version

* update reddit download links

-------------------------------------------------------------------------

- Celebrate 

**Perform Mac build:**

  OSX binaries are created by Gavin Andresen on a 32-bit, OSX 10.6 machine.

	qmake RELEASE=1 USE_UPNP=1 USE_QRCODE=1 reddcoin-qt.pro
	make
	export QTDIR=/opt/local/share/qt4  # needed to find translations/qt_*.qm files
	T=$(contrib/qt_translations.py $QTDIR/translations src/qt/locale)
	python2.7 share/qt/clean_mac_info_plist.py
	python2.7 contrib/macdeploy/macdeployqtplus Bitcoin-Qt.app -add-qt-tr $T -dmg -fancy contrib/macdeploy/fancy.plist

 Build output expected: Bitcoin-Qt.dmg

