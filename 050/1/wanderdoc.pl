#!/usr/bin/env perl
use v5.36;

use Bit::Vector;
use List::Util qw(max);

my @intervals = ([2,7], [3,9], [10,12], [15,19], [18,22]);

# Pushing of, say, [10, 35] would not otherwise work correctly
@intervals = sort { $a->[0] <=> $b->[0] } @intervals;

my $max = max(map @$_, @intervals);
my @veclist = Bit::Vector->new($max + 1, scalar @intervals);
$veclist[$_]->Interval_Fill(@{$intervals[$_]}) for 0 .. $#veclist;


my @results;
my $res = $veclist[0]->Shadow();

for my $v ( @veclist )
{
     if ($res->is_empty())
     {
          $res->Or($res, $v);
     }
     else
     {
          # to prevent merging [3,9] and [10,12].
          if ( $v->Min() < $res->Max() ) 
          {
               $res->Or($res, $v);
          }
          else
          {
               my $res_p = $res->Clone();
               push @results, $res_p;
               $res->Empty();
               $res->Or($res, $v);

          }
     }
}
push @results, $res;
print '[' . $_->to_Enum() . ']' for @results;
# print $/ x 2;
# or
# print join('-', $_->Index_List_Read()), $/ for @results;
