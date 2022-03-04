#!/usr/bin/env raku

sub MAIN( Int $N is copy  = 200) {
  (1 .. $N).grep( { $_ !~~ /1/ } ).elems.say ;
}
