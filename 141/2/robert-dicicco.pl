#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw / uniq /;

my ($inp,$dd) = (1234, 2);

my @num = split(//,$inp);
my $len = scalar(@num);

if($len == 3){
    my @arr = (  $num[0],$num[1],$num[2],
                 "$num[0]$num[1]", "$num[0]$num[2]",
                 "$num[1]$num[2]",
              );
    @arr = uniq(@arr);
    printit( \@arr );
}
elsif ( $len == 4 ){
    my @arr2 = (  $num[0],$num[1],$num[2],$num[3],
                  "$num[0]$num[1]", "$num[0]$num[2]", "$num[0]$num[3]",
                  "$num[1]$num[2]",  "$num[1]$num[3]",
                  "$num[2]$num[3]",
                  "$num[0]$num[1]$num[2]",
                  "$num[0]$num[1]$num[3]",
                  "$num[0]$num[2]$num[3]",
                  "$num[1]$num[2]$num[3]",
               );
    @arr2 = uniq(@arr2);
    printit( \@arr2 );
}

sub printit {
    my $aref = shift;
    print("Possible integers created : ");
    foreach (@$aref){
        print("$_ ");
    }
    print("\n");
    print("Integers divisible by $dd : ");
    foreach (@$aref){
        if(($_ % $dd) == 0){
            print("$_ ");
        }
    }
    print("\n");
}
