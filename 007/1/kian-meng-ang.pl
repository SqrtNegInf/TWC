#!/usr/bin/env perl
use v5.36;

sub generate_niven_sequence {
    my %args = @_;

    $args{from} //= 0;
    $args{to} //= 50;

    my @niven_numbers;
    foreach my $number ($args{from}..$args{to}) {
        next if ($number == 0);

        my $sum_of_its_digits = 0;
        $sum_of_its_digits += $_ foreach split //, $number;
        push @niven_numbers, $number if ($number % $sum_of_its_digits == 0);
    }

    return \@niven_numbers;
}

say join q/|/, @{generate_niven_sequence(from => 0, to =>50)};
