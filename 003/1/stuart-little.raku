#!/usr/bin/env raku

my %memo=((2,3,5) X=> 1).Hash;

sub smth5p($n) { %memo{$n} && return True; return (my $den=(2,3,5).first({ $n %% $_ })) ?? (%memo{$n div $den} && (%memo{$n}=1).Bool || False) !! (False) }

(2..50).grep(*.&smth5p).say
