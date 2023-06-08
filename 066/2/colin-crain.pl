#!/usr/bin/env perl
use v5.36;


my $input = 64;
my $maxprime = int( sqrt($input) );

my @primes = make_prime_list($maxprime);

my %decomp;
%decomp = map { $_, ++$decomp{$_} } decompose($input, \@primes);

my ($power, $base_factors) = get_powers( \%decomp );

if (defined $base_factors) {
    my $base = 1;
    for (keys $base_factors->%*) {
        $base *= $_ ** $base_factors->{$_};
    }
    say "$input = $base^$power";
}
else {
    say 0;
}

## ## ## ## ## SUBS:

sub get_powers {
## divides a hash of factors and their incidence into a power and a hash of factors with new incidences,
## or returns undef if impossible
    my %decomp = $_[0]->%*;
    my @factors = sort { $decomp{$a} <=> $decomp{$b}
                         ||       $a <=> $b
                       } keys %decomp ;

    return unless @factors;

    my $power = $decomp{$factors[0]};
    return if $power == 1;

    my %base_factors = map { $decomp{$_} % $power == 0 ? ($_, $decomp{$_} / $power)
                                                       : return
                           } @factors;

    return ($power, \%base_factors);
}

sub make_prime_list {
## creates a list of all primes less than or equal to a given number
    my $max = shift;
    my @output = (2);
    CANDIDATE: for(  my $candidate = 3;  $candidate <= $max;  $candidate += 2  ) {
        my $sqrt_candidate = sqrt( $candidate );
        for(  my $test = 3; $test <= $sqrt_candidate; $test += 2  ) {
            next CANDIDATE if $candidate % $test == 0;
        }
        push @output, $candidate;
    }
    return @output;
}

sub decompose {
## given a number and a list of primes less than n/2,
## returns an array list of prime decomposition factors of the number
    my ($num, $primes) = @_;
    my @decomp;
    my @primelist = $primes->@*;
    my $prime = shift @primelist;

    while ( $prime <= $num ) {
        while ($num % $prime == 0) {
            $num = $num / $prime;
            push @decomp, $prime;
        }
        last if scalar @primelist == 0;
        $prime = shift @primelist;
    }
    return @decomp;
}
