#!/usr/bin/env perl
use v5.36;

use constant TEST => 1;

\TEST =~ m#SCALAR\((?<location>.*?)\)#;

printf "%s\n" , $+{location} // 'undef', 
