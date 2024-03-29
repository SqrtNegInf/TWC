#!/usr/bin/env perl
use v5.36;

my $binary_str = $ARGV[0] // "101";

print "$binary_str => ", flip_binary($binary_str), "\n";

sub flip_binary {
    my ($binary_str) = @_;

    die "ERROR: Missing binary string.\n"
        unless defined $binary_str;
    die "ERROR: Invalid binary string [$binary_str].\n"
        unless ($binary_str =~ /^[01]+$/);

    my $result = {};
    my $size = length($binary_str);
    foreach my $left (1 .. $size) {
        foreach my $right ($left .. $size) {
            my $_binary_str = $binary_str;
            foreach my $i ($left .. $right) {
                --$i;
                my $c = substr($_binary_str, $i, 1);
                $c = ($c) ? (0) : (1);
                substr($_binary_str, $i, 1, $c);
            }
            $result->{ sprintf("%s (%s,%s)", $_binary_str, $left, $right) } = ($_binary_str =~ tr/1/1/);
        }
    }

    return flipped_binary($result);
}

sub flipped_binary {
    my ($result) = @_;

    my $v;
    my @r;
    foreach my $k (sort { $result->{$b} <=> $result->{$a} } sort keys %$result) {
        if (defined $v) {
            if ($result->{$k} == $v) {
                push @r, $k;
            }
        }
        else {
            $v = $result->{$k};
            push @r, $k;
        }
    }

    return join (" | ", @r);
}
