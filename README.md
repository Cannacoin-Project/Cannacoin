Cannacoin integration/staging tree
================================
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/Cannacoin-Project/Cannacoin?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

http://www.cannacoin.com

Copyright (c) 2009-2014 Bitcoin 

Copyright (c) 2011-2014 Litecoin Developers

Copyright (c) 2014 Reddcoin Developers

Copyright (c) 2014 Cannacoin Developers


What is Cannacoin?
----------------

At block 370,000 Cannacoin will transition to its own Proof-of-Stake-Velocity (PoSV) 
algorithm which replaced Proof-of-Work (PoW).
 - 1 minute block target
 - Roughly 4,625,000 CCN will be mined in PoW phase
 - 2% annual interest in PoSV phase
 - Difficulty retarget: every block using Kimoto's gravity well
 - White paper: https://www.reddcoin.com/papers/PoSV.pdf
 - FAQs paper: http://www.cannacoin.cc/Cannacoin_PoSV_FAQ.pdf

Cannacoin first started in March 28th 2014 as a variant of Litecoin using Scrypt as
the Proof-of-Work (PoW) hash algorithm.
 - 1 minute block target
 - 12.5 coins per block
 - Subsidy halves every 526,000 blocks
 - Difficulty retarget: Every block using Kimoto's gravity well

For more information, as well as an immediately useable, binary version of
the Cannacoin wallet client, please visit http://www.cannacoin.cc.

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
submitter will be asked to start a discussion (if they haven't already) on the
appropriate channels.

The patch will be accepted if there is broad consensus that it is a good thing.
Developers should expect to rework and resubmit patches if the code doesn't
match the project's coding conventions (see `doc/coding.txt`) or are
controversial.

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/cannacoin-project/cannacoin/tags) are created
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

    qmake BITCOIN_QT_TEST=1 -o Makefile.test bitcoin-qt.pro
    make -f Makefile.test
    ./cannacoin-qt_test
