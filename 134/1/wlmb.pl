#!/usr/bin/env perl
use v5.36;

use List::Util qw(product);
use List::Permutor;

my ($howmany, $base)= (5, 10);
$base//=10;
say "First $howmany pandigital numbers in base $base";
say "I'm unable to cope with a base <= 2" and exit unless $base>=3;
my $factorial=product(1..$base-1);
say "I'm unable to cope with more than ", $base-1,"!=$factorial numbers in base $base"
    and exit unless $howmany<=$factorial;
my $p=List::Permutor->new(1,0,2..$base-1);
say join $base>10?"-":"", $p->next for 1..$howmany;
