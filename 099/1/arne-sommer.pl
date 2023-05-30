#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $verbose = 0;

GetOptions("verbose" => \$verbose);

my $S = 'abcde';
my $P = 'a*e';

die '"$S" must have length' unless length $S;
die '"$P" must have length' unless length $P;

$P =~ s/\*/.*/g;
$P =~ s/\?/./g;

say ": Perl Regex: $P " if $verbose;

say $S =~ /^$P$/ ? 1 : 0;
