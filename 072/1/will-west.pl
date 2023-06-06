#!/usr/bin/env perl
use v5.36;

use Scalar::Util "looks_like_number";

say int numberoftrailingzeroesfrom (afactorialof (anumberoftenorless (frominput())));

sub frominput{
   my $input =10;
   die "You forgot to give me a value, dummy!" unless defined $input;
   $input
}

sub anumberoftenorless{
   my $value = pop;
   die "\"$value\" isn't a number, dimbulb!" unless looks_like_number $value;
   die "$value needs to be equal to or less than 10, you dolt." if $value > 10;
   $value
}

sub afactorialof{
   my $value = pop;
   # 0! = 1, it turns out, so this logic works fine.
   my $factorialized=1;
   $factorialized *= $_ for 2 .. $value;
   $factorialized
}

sub numberoftrailingzeroesfrom{
   my $number = pop;
   print "$number has how many trailing zeroes?   ";
   $number =~ /(0*$)/;
   split '', $1
}



