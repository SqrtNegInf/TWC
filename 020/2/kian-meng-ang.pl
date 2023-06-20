#!/usr/bin/env perl
use v5.36;

use Carp;
use Math::Prime::Util qw(is_prime);

sub generate_amicable_numbers($n) {
    carp '$n must larger than 1' if ($n <= 1);

    # Using Thābit ibn Qurra theorem.
    # See https://en.wikipedia.org/wiki/Thabit_number
    my $p = (3 * (2 ** ($n - 1))) - 1;
    my $q = (3 * (2 ** $n)) - 1;
    my $r = (9 * (2 ** (2 * $n - 1))) - 1;

    my ($an1, $an2);
    if (is_prime($p) && is_prime($q) && is_prime($r)) {
        $an1 = (2 ** $n) * $p * $q;
        $an2 = (2 ** $n) * $r;
    }
    return ($an1, $an2);
}

my $n = 2;
while (1) {
    if (my ($an1, $an2) = generate_amicable_numbers($n)) {
        say "$n => ($an1,$an2)";
        last;
    }
    $n++;
}

1;

__END__

$ perl ch-2.pl
2 => (220,284)
