Cannacoin integration/staging tree
================================

http://www.cannacoin.info

Copyright (c) 2009-2013 Bitcoin Developers
Copyright (c) 2014-2014 Cannacoin Developers

What is Cannacoin?
----------------

Cannacoin is a lite version of Bitcoin using scrypt as a proof-of-work algorithm.
 - 60 Second block targets
 - Subsidy halves every 525,600 Blocks (~1 years)
 - 13,140,000 total supply
 - 12.5 coins per block
 - 1 blocks to retarget difficulty
 - RPC-PORT : 7142
 - P2P-PORT : 7143
 
For more information, as well as an immediately useable, binary version of
the Cannacoin client software, see http://cannacoin.cc

Blockhain won't sync?
---------------------
Add the following information to your cannacoin.conf file

addnode=91.214.168.179

License
-------

Cannacoin is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

Development process
-------------------

Developers work in their own trees, then submit pull requests when they think
their feature or bug fix is ready.

If it is a simple/trivial/non-controversial change, then one of the Cannacoin
development team members simply pulls it.

If it is a *more complicated or potentially controversial* change, then the patch
submitter will be asked to start a discussion (if they haven't already) on
[/r/Cannacoin](http://reddit.com/r/cannacoin).

The patch will be accepted if there is broad consensus that it is a good thing.
Developers should expect to rework and resubmit patches if the code doesn't
match the project's coding conventions (see `doc/coding.txt`) or are
controversial.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/bitcoin/bitcoin/tags) are created
regularly to indicate new official, stable release versions of Cannacoin.

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test. Please be patient and help out, and
remember this is a security-critical project where any mistake might cost people
lots of money.

### Automated Testing

Developers are strongly encouraged to write unit tests for new code, and to
submit new unit tests for old code.

Unit tests for the core code are in `src/test/`. To compile and run them:

    cd src; make -f makefile.unix test

Unit tests for the GUI code are in `src/qt/test/`. To compile and run them:

    qmake BITCOIN_QT_TEST=1 -o Makefile.test cannacoin-qt.pro
    make -f Makefile.test
    ./Cannacoin-qt_test
