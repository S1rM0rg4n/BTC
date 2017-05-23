#!/usr/bin/expect

cd /
spawn apt-get install build-essential libcurl4-openssl-dev git automake libtool libjansson* libncurses5-dev libssl-dev
expect "*"
send "S\r"
expect eof
./installer2.sh
cd /BTC
cd /cpuminer-multi
./autogen.sh
./configure CFLAGS="-march=native" --with-crypto --with-curl
make
echo  '{' >> cpuminer-conf.json.cryptonight
echo       ' "api-bind" : "127.0.0.1:4048",'>> cpuminer-conf.json.cryptonight
echo       ' "url" : "stratum+tcp://cryptonight.usa.nicehash.com:3355",'>> cpuminer-conf.json.cryptonight
echo       ' "user" : "3LhvPpNASywNMfaNJLirCVAe5JVMEVfp6N",'>> cpuminer-conf.json.cryptonight
echo       ' "pass" : "x",'>> cpuminer-conf.json.cryptonight
echo       ' "algo" : "cryptonight",'>> cpuminer-conf.json.cryptonight
echo       ' "_comment1" : 2,'>> cpuminer-conf.json.cryptonight
echo       ' "threads" : 4,'>> cpuminer-conf.json.cryptonight
echo       ' "cpu-priority" : 2,'>> cpuminer-conf.json.cryptonight
echo       ' "benchmark" : false,'>> cpuminer-conf.json.cryptonight
echo       ' "debug" : false,'>> cpuminer-conf.json.cryptonight
echo       ' "protocol": false,'>> cpuminer-conf.json.cryptonight
echo       ' "quiet" : false'>> cpuminer-conf.json.cryptonight
echo  '}'>> cpuminer-conf.json.cryptonight
./cpuminer -c cpuminer-conf.json.cryptonight
