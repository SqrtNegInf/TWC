#!/usr/bin/env perl
use 5.020;
use warnings;
use English qw/ -no_match_vars /;

my $filename = shift // 'phone-numbers.txt';

open my $file, '<' , $filename or die "$OS_ERROR\n";
local $RS = undef;
my @phone_numbers = split "\n", <$file>;
close $file;

my $valid = qr{ \A \s* ( \+\d{2} | \(\d{2}\) | \d{4} ) \s* \d{10}  \s* \z }msx;

map { say; } grep { /$valid/ } @phone_numbers;
