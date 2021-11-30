Cannacoin (integration/staging tree)
=
<br>
https://www.cannacoin.org<br>
https://blog.cannacoin.org<br>
<br>
Copyright (c) 2009-2014 Bitcoin Developers
<br>
Copyright (c) 2011-2014 Litecoin Developers
<br>
Copyright (c) 2014-2021 Reddcoin Developers
<br>
Copyright (c) 2014-2021 Cannacoin Developers
<br>


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
the Cannacoin wallet client, please visit <s>http://www.cannacoin.cc</s>.

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


<br><br>
Team Cannacoin

Brent K. aka deusopus<br>
Lead Director and Member since 2014<br>
Founder of Grass Haus Enterprises.<br>
<br><br>
Thomas B. aka CryptoSplinter<br>
Assistant Director and Senior Member.<br>
Technical Support.<br>
<br><br><br>
In Memory Of...<br>
Phil C. aka RebPhil<br>
Original Lead Developer and Founding Member of The Cannacoin Community Network.<br>
Gone but not forgotten. RIP 2015.<br>
<br>
Always do your due diligence!<br>
<br><br>
Join the Cannacoin Discord server<br>
https://discord.gg/TEC9aNBhHw<br>
<br>
<br>

Copyright (c) 2014-2021 Grass Haus Enterprises<br>
<br><br>
Thanks to Subtoshi and JamesonWA and all the members of The Cannacoin Community Network
