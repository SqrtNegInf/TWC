#!/usr/bin/env raku
# https://dev.to/jeongoon/weekly-challenge-080-2kg9

say((|(5, 2, -2, 0),0,Inf).sort.rotor(2=>-1).first({.[0]>-1>[-] $_})[0]+1);
[1..∞].first({(5, 2, -2, 0).Set∌$_}).say;

# but: 4 (should be 0?)
say((|(1, 2, 3),0,Inf).sort.rotor(2=>-1).first({.[0]>-1>[-] $_})[0]+1);
