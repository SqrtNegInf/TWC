#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

my $string = shift || 25525511135;

find_address($string);



sub find_address
{
     my $string = $_[0];
     my $str_len = length($string);
     print "Too short for any valid IPv4 address!$/" 
          and return unless $str_len > 3;
     my $counter;
     my $re = qr/^(?:[0-9]|1[0-9][0-9]|2(?:[0-4][0-9]|[5][0-5])|[1-9][0-9])$/;

     for my $len_A ( 1 .. 3 )
     {
          my $oct_A = substr($string, 0, $len_A);


          if ( $oct_A =~ $re )
          {
               my $pt1 = $len_A;

               B: for my $len_B ( 1 .. 3 )
               {
                    last B if ($pt1 + $len_B == $str_len);
                    my $oct_B = substr($string, $pt1, $len_B);

                    if ( $oct_B =~ $re )
                    {
                         my $pt2 = $pt1 + $len_B;
                         C: for my $len_C ( 1 .. 3 )
                         {
                              last C if (
                                   ($pt2 == $str_len) or ($pt2 + $len_C == $str_len)
                              );

                              my $oct_C = substr($string, $pt2, $len_C); 
                              my $pt3 = $pt2 + $len_C;

                              if ( $pt3 < $str_len )
                              {
                                   my $oct_D = substr($string, $pt3);
                                   if ( $oct_C =~ $re and $oct_D =~ $re )
                                   {

                                        print join('.', $oct_A, $oct_B, $oct_C, $oct_D), $/;
                                        $counter++;
                                   }
                              }
                         }
                    }
               }
          }

     }
     print "No valid IPv4 address found!$/" unless $counter;
}
