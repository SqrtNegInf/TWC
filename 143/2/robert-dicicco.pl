#!/usr/bin/env perl
use v5.36;

use ntheory qw/divisors/;

# initialize vars
# array to hold list of divisors
my @final = ();

# sum of initial set of divisors
my $target = 0;

# Get number from user
#my $inp = prompt 'Input the number : ', -integer => [ 1 .. 999 ];
#chomp($inp);
my $inp = 36; #int($inp);

# calculate list of divisors
my @d = divisors($inp);

# get divisors and their sums
foreach(@d){
    my $val = $inp / $_;
    # skip the opposite pair (e.g. 3,4  but skip 4,3)
    next if ($val > $_);
    my $digit_sum = $val + $_;

    if($target == 0){
        $target = $digit_sum;
        push(@final,$val,$_);
    }

    if($digit_sum == ($target + 1)){
        push(@final,$val,$_);
        last;
    }
}

# if we have 4 divisors that meet the criteria, print
if(scalar(@final) == 4){
    print("$final[2] x $final[3] = $final[0] x $final[1] and $final[2] + $final[3] = $final[0] + $final[1] + 1");
} else {
    print("Not Stealthy!\n");
}
