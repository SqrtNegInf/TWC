#!/usr/bin/env perl
use v5.36;

my $cnt = 1;

my $start = 1;
my $end = 200;
my $number = $start;
while ( $number <= $end )
{
     if ( $number =~ /[23457]/ )
     {
          while ( $number =~ /[23457]/ )
          {

               my @num_array = split(//,$number);
               @num_array = map { 
                    my $digit = $_; 
                    if ( $digit =~ /[23457]/ ) 
                    {
                         $digit++; 
                    }; 
                    $digit; } 
                    @num_array;
               $number = join('', @num_array);
          }
     }


     elsif ( $number =~ /0$/ )
     {
          $number++;

     }
     else
     {
          print join(": ", $cnt++, $number), $/ if ( $number == make_sgn($number));

          $number++;
     }
}
# 4_995 numbers if $start == 50 and $end == 10**10.
sub make_sgn
{
     my $str = $_[0];
     $str = reverse $str;

     $str =~ tr/69/96/;
     return $str;
}
