#!/usr/bin/env perl
use v5.36;

use Text::CSV_XS qw(csv);

my $aoa = csv(in => *DATA, sep_char => ',');
my $transposed = transpose($aoa);
print_matrix($transposed);

sub transpose
{
     my $aoa = $_[0];
     my $output;
     for my $i ( 0 .. $#$aoa )
     {
          for my $j ( 0 .. $#{$aoa->[$i]} )
          {
               $output->[$j][$i] = $aoa->[$i][$j];
          }
     }
     return $output;


}



sub print_matrix
{
     my $mtr = $_[0];
     for my $i ( 0 .. $#$mtr )

     {
          print join(',', @{$mtr->[$i]}), $/;
     }
}





__END__
name,age,sex
Mohammad,45,m
Joe,20,m
Julie,35,f
Cristina,10,f
