#!/usr/bin/env perl
use v5.36;

#
# Working from the end of the required string backwards, we alternate
# placing a hash, and placing a number. We place them in an array @out,
# and at the end, print out said array in reverse order.
#

while (my $index = <DATA>) {
    chomp $index;
    my @out;
    my $hash = 0;
    while ($index) {
        if ($hash = !$hash) {
            push @out => "#";
            $index --;
        }
        else {
            push @out =>      $index + 1;
            $index -= length ($index + 1);
        }
    }
    say join "" => reverse @out;
}

__END__
2
20
120
