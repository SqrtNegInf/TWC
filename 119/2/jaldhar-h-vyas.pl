#!/usr/bin/env perl
use 5.020;
use warnings;

# answer is wrong

my $N = shift // 60;
my $n = 0;
my $nth = 0;

while (++$n) {
    if ( $n =~ /^ [1-3]+ $/x && $n !~ /^ 11/x ) {
        if (++$nth == $N) {
            say $n;
            last;
        }
    } 
}
