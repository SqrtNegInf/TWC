#!/usr/bin/env perl
use v5.36;

my @data;
while (<DATA>) {
    chomp;
    push @data, [split /,/, $_];
}
for (transpose(@data)) {
    say join ',', @$_;
}

sub transpose {
    my(@in) = @_;
    my @out;
    for my $row (0..$#in) {
        for my $col (0 .. $#{$in[$row]}) {
            $out[$col] ||= [];
            $out[$col][$row] = $in[$row][$col];
        }
    }
    return @out;
}

__END__
name,age,sex
Mohammad,45,m
Joe,20,m
Julie,35,f
Cristina,10,f
