#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

use List::Util qw(min);

use lib ".";
use MinSlidingWindow qw(minSlidingWindow);


my $WinSize = 3;
GetOptions('winsize:n' => \$WinSize);

die Usage() unless ($WinSize // 0) > 1;

my @A =  (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);

die Usage() unless scalar(@A) > $WinSize;

my $answer = minSlidingWindow(\@A, $WinSize);
say join(", ", @$answer);
