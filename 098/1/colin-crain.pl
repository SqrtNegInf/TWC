#!/usr/bin/env perl
#
#       readin-ritin-and-random-characters.pl
#
#         TASK #1 › Read N-characters
#         Submitted by: Mohammad S Anwar
#         You are given file $FILE.
# 
#         Create subroutine readN($FILE, $number) returns the first n-characters
#         and moves the pointer to the (n+1)th character.
# 
#         Example:
#         Input: Suppose the file (input.txt) contains "1234567890"
#         Output:
#             print readN("input.txt", 4); # returns "1234"
#             print readN("input.txt", 4); # returns "5678"
#             print readN("input.txt", 4); # returns "90"
#
#       © 2021 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



use warnings;
use strict;
use feature ":5.26";

use open qw( :encoding(utf-8) :std );

my $len = 20;
my $file = './unicode-text-test.txt';

open( my $fh, '<', $file ) or die "no such file $file : $!";

say readN($fh, 20);
say readN($fh, 20);
say readN($fh, 20);

sub readN {
    no warnings qw( uninitialized );
    my ($fh, $length, $offset) = @_;
    my $buffer;
    read( $fh, $buffer, $length, $offset );
    return $buffer;
}

