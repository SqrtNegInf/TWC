#!/usr/bin/env perl
use v5.36;

use Struct::Dumb;
use Test::More;

my %DATA =
(
       1 => ['0.1',   '1.1',    -1], 6 => ['1.2.1',   '1.2.1_2',   -1],
       2 => ['2.0',   '1.2',     1], 7 => ['1.2.1_3', '1.2.1_2',    1],
       3 => ['1.2',   '1.2_5',  -1], 8 => ['01.02.1', '1.2.1',      0],
       4 => ['1.2.1', '1.2_1',   1], 9 => ['0_1.2.3', '1.0.0',     -1],
       5 => ['1.2.1', '1.2.1',   0], A => ['1.2_1.1', '1.2.1',      1],

);




struct Version => [qw(h v s a)], named_constructor => 1;


for my $set ( sort keys %DATA )
{
     my $result = compare($DATA{$set});
     is($result, ${$DATA{$set}}[2], "Set ${set} correct.");

}
done_testing(scalar keys %DATA);

sub compare
{
     my $aref = $_[0];
     my ($v1, $v2) = @{$aref}[0,1];
     my ($ver1, $ver2) = map parse_version($_), ($v1, $v2);

     my @comparison;
     $comparison[0] = $ver1->h < $ver2->h ? -1 : $ver1->h > $ver2->h ?  1 : 0;
     $comparison[1] = $ver1->v < $ver2->v ? -1 : $ver1->v > $ver2->v ?  1 : 0;
     $comparison[2] = $ver1->s < $ver2->s ? -1 : $ver1->s > $ver2->s ?  1 : 0;
     $comparison[3] = $ver1->a < $ver2->a ? -1 : $ver1->a > $ver2->a ?  1 : 0;

     while (@comparison)
     {

          my $comp = shift @comparison;
          if ( $comp != 0 )
          {
               return $comp;
          }
     }
     return 0;
}

sub parse_version
{
     my $string = $_[0]; # print $string, $/;
     my @data = split(/[.]/, $string);
     my $version = Version(h => -1, v => -1, s => -1, a => -1);
     while ( @data )
     {    
          my $chunk = shift @data; 

          if ( $chunk =~ /^[0-9]+$/ )
          {    
               $chunk *= 1; 
               ($version->h > - 1) ?
                    ($version->v > - 1) ? 
                         $version->s = $chunk :
                    $version->v = $chunk :
               $version->h = $chunk;

          }
          elsif ( $chunk =~ /[_]/ )
          {
               my ( $sub, $alpha) = split(/[_]/,$chunk);
               $_ *= 1 for ( $sub, $alpha);

               ($version->h > - 1) ?
                    ($version->v > - 1) ? 
                         $version->s = $sub :
                    $version->v = $sub :
               $version->h = $sub;

               $version->a = $alpha;
          }

     } 
     return $version;
}
