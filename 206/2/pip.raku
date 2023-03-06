#!/usr/bin/env raku

my @para; my %sumz; # DH globals were not declared 

sub APrz {my @aray = @_; # recursively loop through all possible pairs
  if     (!(@aray % 2)) {my $parz; # don't really need this pairz since TempARrAy below tracks removed pairs
    for  1 .. (@aray.elems-1) -> $andx {$parz = '';my @tara = @aray;
      my $frst = shift (@tara); # pair up first value with each of the remaining values
      my $scnd = splice(@tara, $andx - 1, 1);
      push(@para,"$frst,$scnd"); # track pair progress
      $parz   ~= @para[*-1];
      if (@tara) { $parz ~= APrz(@tara); } # recurse...
      else       {my $psum = 0; # no pairs left so compute max sum of min of each pair
        for  @para  {($frst,$scnd) = split(',', $_, :skip-empty);
          $psum += ($frst < $scnd) ?? $frst !! $scnd; }
        %sumz{$psum} = join(' ', @para);
#       say "@para[] => $psum;"; # this will print every set of pairs with their sum
      }; pop (@para);
    }; return($parz); } }

sub MSMP {my @aray = @_;my $msmp = 0; # Max Sum of Min of Pairs
  if     (!(@aray % 2)) {@para=();%sumz=(); # make sure there's an even number of elements to pair
    APrz(@aray);
    my @srts = sort +*, keys(%sumz);
    $msmp = @srts[*-1]; } # get Max Sum from last element of numerically sorted sumz
  printf("(%-7s) => %d;\n", join(',', @aray), $msmp);
  return($msmp); }

MSMP(1,2,3,4); # => 4;
MSMP(0,2,1,3); # => 2;
