#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum0);
say join ' ',
    map {my $n=$_; sum0 map {$_**2==$n?$_:($_, $n/$_)}
	 grep {$n%$_==0} 2..sqrt($n)} 1..20; #@ARGV;
