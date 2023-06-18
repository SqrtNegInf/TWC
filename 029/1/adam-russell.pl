#!/usr/bin/env perl
use v5.36;

my $statement = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge';
$statement =~ m/(.*)\{(.*)\}(.*)/;
for my $brace (split(/,/, $2)){
    print "$1$brace$3\n";
}
