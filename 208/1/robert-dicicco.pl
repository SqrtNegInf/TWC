#!/usr/bin/env perl
use v5.36;

my @list1 = (["Perl", "Raku", "Love"],["A","B","C"], ["A", "B", "C"]);
my @list2 = (["Raku", "Perl", "Hate"],["C","A","B"], ["D", "E", "F"]);

my $ln = scalar @list1;

for (0..$ln - 1) {
    my @isect = ();
    my $ref1 = $list1[$_];
    my $ref2 = $list2[$_];

    print "Input: \@list1 = @$ref1\n";
    print "       \@list2 = @$ref2\n";

    foreach my $item (@$ref1) {
        push @isect, $item if grep {  $item eq $_ } @$ref2;
    }

    print "Output : (";
    for my $item (@isect) {

        print "'",$item,"' ";
    }
    say ")\n";
}
