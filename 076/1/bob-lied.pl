#!/usr/bin/env perl
use v5.36;

use lib ".";
use PrimeSum;

sub Usage { "Usage: $0 N\n\t2 <= N <= 10000" };

my $N = 51;

die Usage() unless $N && $N > 1 && $N <= 10000;

my $task = PrimeSum->new($N);
my ($result, $list) = $task->run();
say "$N ==> $result [ ", join(', ', @$list), " ]";
