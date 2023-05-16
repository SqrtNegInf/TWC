#!/usr/bin/env perl
use v5.36;

my @ltp = ();
my @recent_ltp = (2,3,5,7);
my @new_ltp = ();

my @prime = (2,3,5,7);



sub is_prime {
    my $t = $_[0];
    for (my $k = 0; $prime[$k] <= sqrt($t); $k++) {
        return 0 if $t % $prime[$k] == 0;
    } 
    return 1;
}



sub append_primes {
    my $max = $_[0];
    HERE: for my $can ($prime[-1]+1..$max) {
        for my $p (@prime) {
            next HERE if $can % $p == 0;
            last if $p > sqrt($can);
        }
        push @prime, $can;
    }
}



sub append_ltp {
    my $target_size = $_[0];
    if ($target_size <= (scalar @ltp + scalar @recent_ltp)) {
        push @ltp, @recent_ltp;
        return;
    }
    for my $d (1..9) {
        for my $num (@recent_ltp) {
            my $new_num = $d . $num;
            push @new_ltp, $new_num if is_prime($new_num);
        }
    }
    push @ltp, @recent_ltp;
    @recent_ltp = @new_ltp;
    @new_ltp = ();
    append_ltp($target_size);
}



append_primes(1000);
append_ltp(20);
print "$_ " for @ltp[0..19];
print "\n";

