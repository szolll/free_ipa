#!/bin/bash

 large-group --desc="Large group"
 large-group --desc="Large group"

for i in `seq 1 3000`; do
    echo "Adding user $i to IPA ... "
    ipa user-add largeuser$i --first=Large --last=User$i > /dev/null
    echo "Adding user $i to large-group ... "
    ipa group-add-member large-group --user=largeuser$i > /dev/null
done
