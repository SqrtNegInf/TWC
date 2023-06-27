#!/usr/bin/env perl
use v5.36;

use Lingua::EN::Numbers qw(num2en);

say sequence(shift||9);

sub sequence {
    my($n) = @_;
    my @out;
    while ($n != 4) {
        my $num_en = num2en($n);
        my $len = length($num_en);
        my $len_en = num2en($len);

        push @out, "$num_en is $len_en";
        $n = $len;
    }

    push @out, "four is magic.";
    $out[0] =~ s/(\w)/\U$1/;
    return join(", ", @out);
}
