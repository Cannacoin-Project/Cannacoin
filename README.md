Cannacoin integration/staging tree
================================

http://www.cannacoin.org

Copyright (c) 2009-2014 Bitcoin 

Copyright (c) 2011-2014 Litecoin Developers

Copyright (c) 2014-2021 Reddcoin Developers

Copyright (c) 2014-2021 Cannacoin Developers



What is Cannacoin?
----------------

At block 370,000 Cannacoin will transition to its own Proof-of-Stake-Velocity (PoSV) 
algorithm which replaced Proof-of-Work (PoW).
 - 1 minute block target
 - Roughly 4,625,000 CCN will be mined in PoW phase
 - 2% annual interest in PoSV phase
 - Difficulty retarget: every block using Kimoto's gravity well
 - White paper: 
 - FAQs paper: 
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

![0001](https://user-images.githubusercontent.com/84210241/138538925-12671258-c89d-49f2-a55e-54259066b5d4.jpg)
![0002](https://user-images.githubusercontent.com/84210241/138538970-c1c41ddf-06b1-4739-8de0-974bec4abd30.jpg)
![0003](https://user-images.githubusercontent.com/84210241/138539006-cc3d2654-6132-4827-8a62-98f9e46fb17a.jpg)
![0004](https://user-images.githubusercontent.com/84210241/138539028-76c08118-e333-4d5b-9c20-78b173566bd3.jpg)
![0005](https://user-images.githubusercontent.com/84210241/138539041-c341e4b1-7d68-4f3f-9f10-28b40ae8d222.jpg)
![0006](https://user-images.githubusercontent.com/84210241/138539324-cb7d2a52-f7bc-4bb9-8794-02e6a5f9d54e.jpg)
![0007](https://user-images.githubusercontent.com/84210241/138539069-5d1e9240-e396-4e91-ac3b-bb37d7580417.jpg)
![0008](https://user-images.githubusercontent.com/84210241/138539086-209d0b5d-22ff-4d1b-8b02-93e6cfaa6dcf.jpg)
![0009](https://user-images.githubusercontent.com/84210241/138539099-28ceb07d-6b63-4eb7-ac32-30f695cbb30e.jpg)

Copyright (c) 2014-2021 Grass Haus Enterprises
