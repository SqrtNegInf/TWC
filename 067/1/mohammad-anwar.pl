#!/usr/bin/env perl
use v5.36;

use List::Util qw(uniq);

my $m = 5;
my $n = 3;

print join "\n", comb($m, $n), '';

sub comb {
    my ($m, $n) = @_;

    die "ERROR: Missing 'm'.\n"
        unless defined $m;
    die "ERROR: Missing 'n'.\n"
        unless defined $n;
    die "ERROR: Invalid m=$m (m>0).\n"
        unless ($m > 0);
    die "ERROR: Invalid n=$n (n>0).\n"
        unless ($n > 0);
    die "ERROR: Invalid n=$n (n<=m).\n"
        unless ($n <= $m);

    # prepare data set
    my @data = ();
    push @data, [1..$m] foreach (1..$n);

    # generate all possible combinations
    my @combinations = ('');
    foreach my $members (@data) {
        @combinations = map {
            my  $member = $_;
            map $member.$_, @$members
        } @combinations;
    }

    # filter combinations
    my %filter;
    foreach my $member (@combinations) {
        my @uniq = uniq split //, $member;
        next unless (@uniq == $n);
        $filter{ sprintf("[%s]", join ', ', sort @uniq) } = 1;
    }

    # return sorted result
    return sprintf("[ %s ]", join ', ', (sort keys %filter));
}
