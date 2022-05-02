#!/usr/bin/env perl

use strict;
use warnings;
use feature qw / say /;

my $length_of_sequence = 30;
my $current_position   = 0;
my $current_int        = 0;
my %last_int_position;
my $next_int;

say "Printing the first $length_of_sequence values in Van Eck's sequence:";
while ( $current_position < $length_of_sequence ) {
    print "$current_int, ";
    if ( exists $last_int_position{$current_int} ) {
        $next_int = $current_position - $last_int_position{$current_int};
    }
    else {
        $next_int = 0;
    }
    $last_int_position{$current_int} = $current_position;
    $current_int = $next_int;
    $current_position++;
}
print "...\n";

# Alternate method using an array to hold sequence:
#
# my @sequence = (0);
# while((scalar @sequence) < $length_of_sequence){
#     if(exists $last_int_position{$sequence[-1]}){
#         $next_int = ((scalar @sequence) - $last_int_position{$sequence[-1]});
#     }
#     else {
#         $next_int = 0;
#     }
#     $last_int_position{$sequence[-1]} = scalar @sequence;
#     push @sequence, $next_int;
# }
# for (@sequence){
#     print "$_, ";
# }
# print "...\n";
