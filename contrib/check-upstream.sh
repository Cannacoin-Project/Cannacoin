#!/bin/sh

# Usage: check <repo> <branch> <last commit checked>

function check(){
	output="merge-$1-$2.txt"

	echo "Checking $1..."

	git fetch $1
	git cherry -v master $1/$2 $3 > $output

	echo "Done, check $output"
}

check bitcoin \
	master \
	3b7925eb7d0653ab304786e8e2344af91a6826fb

check litecoin \
	master-0.8 \
	10d589b7f2f8746d3d186b9d7e37b4de7f6464ea

echo ""
echo "In the output files, commits prefixed with a + are not yet merged from upstream for some reason."
echo "After checking them update the pointer to were you checked in this script."
echo ""
echo "If you don't include a commit for some reason, explain why at the bottom of this script."


<<NOTMERGED

# Not merged from Litecoin

570f4b03eba23abb3c09045a673105d956103847 Litecoin: Add checkpoints to testnet
f389e65c8dcb1544a023caff33da41c71fe61a80 Add testnet DNS seed from xurious.com

# Not merged from Bitcoin


NOTMERGED
