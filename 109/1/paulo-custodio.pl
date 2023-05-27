#!/usr/bin/env perl
use v5.36;

first_chowla(shift || 20);

sub first_chowla {
    my($num) = @_;
    for my $i (1..$num) {
        print ", " if $i > 1;
        print chowla($i);
    }
    print "\n";
}

sub chowla {
    my($n) = @_;
    my @terms = grep {$_!=1 && $_!=$n} divisors($n);
    my $sum = 0; $sum += $_ for @terms;
    return $sum;
}

sub divisors {
    my($n) = @_;
    my(@div_low, @div_high);
    for (my $i = 1; $i <= sqrt($n); $i++) {
        if ($n%$i == 0) {
            push @div_low, $i;
            unshift @div_high, $n/$i if $n/$i != $i;
        }
    }
    return (@div_low, @div_high);
}
