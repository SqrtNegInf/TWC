#!/usr/bin/env perl
use v5.36;

my $N = shift // 91011;

print_sequences($N);

sub print_sequences {
    my($rest, @prev) = @_;
    my $found_solution = 0;

    if ($rest eq '') {
        if (!$found_solution) {
            say join(",", @prev);
            $found_solution = 1;
        }
    }
    else {
        for (1 .. length($rest)) {
            my $pref = substr($rest,0,$_);
            my $suff = substr($rest,$_);
            next if $suff =~ /^0/;
            if (@prev) {
                if ($prev[-1] + 1 == $pref) {
                    $found_solution ||= print_sequences($suff, @prev, $pref);
                }
            }
            else {
                $found_solution ||= print_sequences($suff, @prev, $pref);
            }
        }
    }
    return $found_solution;
}
