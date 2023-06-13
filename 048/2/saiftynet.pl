#!/usr/bin/env perl
use v5.36;

my $format = $ARGV[0] // "MDY";  # valid strings "MDY", "DMY" and "YMD".
die 'Invalid string, must be "MDY", "DMY" or "YMD"' if $format !~/^MDY|DMY|YMD\b/;

foreach my $yyyy (2000..2999){
   my $mm   =  reverse substr($yyyy,2,2);
   my $dd   =  reverse substr($yyyy,0,2);
   
   ($mm,$dd)=($dd,$mm) if $format eq "DMY";    # Swap if DDMMYYY required
   
   next if ($mm >12 or $mm ==0);               # Discard invalid months
   if ($mm =~/02/){                            # February is special case
       my $notLeapYear=($yyyy % 4)||(!($yyyy%100)&&($yyyy%400));
       my $FebDays=(28+($notLeapYear?0:1))."";
       next if ($dd gt $FebDays or $dd eq "00")
   }
   elsif ($mm=~/^01|03|05|07|08|10|12/){       # months with 31 days
       next if ($dd gt "31"     or $dd eq "00");
   } 
   else{                                       # all the rest have 30 days
       next if ($dd gt "30"     or $dd eq "00");
   
  }
  
   print "M $mm, D $dd, Y $yyyy :  $mm$dd$yyyy \n" if $format eq "MDY";
   print "D $dd, M $mm, Y $yyyy :  $dd$mm$yyyy \n" if $format eq "DMY";
   print "Y $yyyy, M $mm, D $dd :  $yyyy$mm$dd \n" if $format eq "YMD";   
}
