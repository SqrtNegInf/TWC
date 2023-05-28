#!/usr/bin/env perl
use v5.36;

use Devel::Peek;
use Capture::Tiny q/capture_stderr/;
use constant A => "test";
my $a = 1;    
my $address;  
my $stderr = capture_stderr {
    Dump(A)
};
$stderr =~ m/at\s(0x.*\n).*/;
$address = $1;  
chomp($address);
print "Address of constant A: $address\n"; 
$stderr = capture_stderr {
    Dump($a)
};
$stderr =~ m/at\s(0x.*\n).*/;
$address = $1;  
chomp($address);
print "Address of \$a: $address\n"; 
