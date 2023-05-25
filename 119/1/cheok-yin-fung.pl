#!/usr/bin/env perl
use v5.36;

print oct ("0x". scalar reverse sprintf("%02x", 101)) ,"\n";

=pod
sub hex2dec {
    return oct ("0x".$_[0]);
}

sub dec2hex {
   return sprintf("%02x", $_[0]); 
}

my $N = $ARGV[0];

print hex2dec(scalar reverse (dec2hex $N));
print "\n";
=cut
