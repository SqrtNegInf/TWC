#!/usr/bin/env perl
use v5.36;
use English qw/ -no_match_vars /;

sub sum {
    my ($arr) = @_;
    my $total = 0;

    for my $elem (@{$arr}) {
        $total += $elem;
    }

    return $total;
}

sub Zmultiply {
    my ($first, $second) = @_;
    my @result;

    for my $i (0 .. scalar @{$second} - 1) {
        push @result, $first->[$i] * $second->[$i];
    }

    return wantarray ? @result : \@result;
}

my $isbn = '978-0-306-40615-7';

if ( $isbn !~ /(\d{3}) \- (\d) \- (\d{3}) \- (\d{5}) \- (\d) /msx ) {
    usage();
}

my @digits = split //, (join q{}, @{^CAPTURE}); 
my @multipliers = (1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3);

my $checkdigit = 10 - sum([Zmultiply([@digits[0 .. 11]], \@multipliers)]) % 10;
say $checkdigit, ($checkdigit == $digits[12] ? ' (valid)' : ' (invalid)');
