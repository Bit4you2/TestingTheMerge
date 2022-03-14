
#! /bin/sh

PASSWORD=$1

full=$(find validator_keys -name keystore*json)
base=${full%.json}
echo $base.txt
echo $PASSWORD > $base.txt

full=$(find validator_keys -name deposit*json)
base=${full%.json}
echo $base.txt
echo $PASSWORD > $base.txt
