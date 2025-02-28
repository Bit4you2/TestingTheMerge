#!/bin/bash
if [ ! -d /root/.ethereum/keystore ]; then
    echo "/root/.ethereum/keystore not found, running 'geth init'..."
    geth init /root/merge-testnets/kiln/genesis.json 
    echo "...done!"
fi

geth                                                     \
       --port=30304                                      \
       --http --http.api="engine,eth,web3,net,debug"     \
       --http.corsdomain="*"                             \
       --http.addr="0.0.0.0"                             \
       --networkid=1337802                               \
       --syncmode=full                                   \
       --authrpc.jwtsecret=/tmp/jwt/jwtsecret            \
       --override.terminaltotaldifficulty=20000000000000 \
       --bootnodes="enode://c354db99124f0faf677ff0e75c3cbbd568b2febc186af664e0c51ac435609badedc67a18a63adb64dacc1780a28dcefebfc29b83fd1a3f4aa3c0eb161364cf94@164.92.130.5:30303,enode://d41af1662434cad0a88fe3c7c92375ec5719f4516ab6d8cb9695e0e2e815382c767038e72c224e04040885157da47422f756c040a9072676c6e35c5b1a383cce@138.68.66.103:30303,enode://91a745c3fb069f6b99cad10b75c463d527711b106b622756e9ef9f12d2631b6cb885f831d1c8731b9bc7177cae5e1ea1f1be087f86d7d30b590a91f22bc041b0@165.232.180.230:30303,enode://b74bd2e8a9f0c53f0c93bcce80818f2f19439fd807af5c7fbc3efb10130c6ee08be8f3aaec7dc0a057ad7b2a809c8f34dc62431e9b6954b07a6548cc59867884@164.92.140.200:30303"                   \
	--ws \
	--ws.origins='*' \
        "$@"
