Reddcoin integration/staging tree
================================

http://www.reddcoin.com

Copyright (c) 2009-2014 Bitcoin Developers
Copyright (c) 2011-2014 Litecoin Developers
Copyright (c) 2014 Reddcoin Developers

What is Reddcoin?
----------------

On 2nd August 2014 at block 260,800 Reddcoin transitioned to its own original Proof-of-Stake-Velocity (PoSV)
algorithm which replaced Proof-of-Work (PoW).
 - 1 minute block target
 - just under 27 billion mined in PoW phase
 - 5% annual interest in PoSV phase
 - difficulty retarget: every block using Kimoto's gravity well
 - white paper: http://www.reddcoin.com/papers/PoSV.pdf
 - FAQs paper: http://www.reddcoin.com/papers/PoSV_FAQ.pdf

Reddcoin first started in January 2014 as a variant of Litecoin using Scrypt as
the Proof-of-Work (PoW) hash algorithm.
 - 1 minute block target
 - 100,000 coins per block
 - subsidy halves every 500,000 blocks
 - subsidy halves every 50,000 blocks starting at block 140,000
 - difficulty retarget: every block using Kimoto's gravity well

For more information, as well as an immediately useable, binary version of
the Reddcoin wallet client, please visit http://www.reddcoin.com.

License
-------

Reddcoin is released under the terms of the MIT license. See `COPYING` for more
information or see http://opensource.org/licenses/MIT.

Development process
-------------------

Developers work in their own trees, then submit pull requests when they think
their feature or bug fix is ready.

If it is a simple/trivial/non-controversial change, then one of the Reddcoin
development team members simply pulls it.

If it is a *more complicated or potentially controversial* change, then the patch
submitter will be asked to start a discussion (if they haven't already) on the
appropriate channels.

The patch will be accepted if there is broad consensus that it is a good thing.
Developers should expect to rework and resubmit patches if the code doesn't
match the project's coding conventions (see `doc/coding.txt`) or are
controversial.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/reddcoin-project/reddcoin/tags) are created
regularly to indicate new official, stable release versions of Reddcoin.

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

    qmake BITCOIN_QT_TEST=1 -o Makefile.test bitcoin-qt.pro
    make -f Makefile.test
    ./reddcoin-qt_test
