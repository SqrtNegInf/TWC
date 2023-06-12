#!/usr/bin/env perl
use v5.36;

my @L = ( -25, -10, -7, -3, 2, 4, 8, 10 );
my $target = 0;

@L = sort { $a <=> $b } @L;

print "INPUT:\n";
print join ",", @L;
print "\n";

my %triplets;

for ( my $x = 0 ; $x <= $#L ; $x++ ) {
    my $start   = $x + 1;
    my $end     = $#L;
    my $current = $x;

    #print "\n$x\n";
    while ( ( $end - $start ) > 0 ) {
        my $result = $L[$current] + $L[$start] + $L[$end];

#print "\n$current $start $end / $L[$current] + $L[$start] + $L[$end] = $result\n";
        if ( $result == $target ) {

            #print "triplet: $L[$current],$L[$start],$L[$end]\n";
            $triplets{"$L[$current],$L[$start],$L[$end]"} = 1;
            $start++;
            $end--;
        }
        elsif ( $result < $target ) { $start++ }
        else                        { $end-- }
    }
}

print "\nOUTPUT:\n";
print join "\n", sort keys(%triplets);
