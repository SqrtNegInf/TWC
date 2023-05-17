#!/usr/bin/env perl
use v5.36;

my($c,@p)=(5,3);
for(;@p<10000;$c+=2){
  ($_*$_>$c)?((push@p,$c),last):$c%$_||last for@p;
}
say$p[-1];
