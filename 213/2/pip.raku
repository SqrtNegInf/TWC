#!/usr/bin/env raku

sub ShrR { my @rtez = @_;my $dest = pop(@rtez);my $srce = pop(@rtez);my $cmar = '';my @srte = ();my %nodz = ();my $ncnt = 0;my $dpth = 2;my @xrtz;
  for   (@rtez) { $cmar ~= '[' ~ join(',', |@($_)) ~ '], '; }
  printf("routes:%-34ssource:$srce, destination:$dest => ", $cmar);
  for   (@rtez) { # make hash of all nodes to determine maximum node count
    for               (   @($_)          ) -> $node { %nodz{$node} = 1; } }
  $ncnt = keys(%nodz).elems;
  for   (    0..$ncnt) { push(@xrtz, []); } # have to loop to push empty lists onto eXplored RouTeZ array so below can push paths onto them up to ncnt depth
  for          (@rtez) { # find all 2-depth routes from source first
    for               (0..@($_).elems-1  ) -> $nndx {
      if       ($_[$nndx       ] == $srce) {
        if     ($nndx                    ) { push(@(@xrtz[$dpth]),       $srce ~ ',' ~ $_[$nndx - 1]); }
        if     ($nndx <   @($_).elems-1  ) { push(@(@xrtz[$dpth]),       $srce ~ ',' ~ $_[$nndx + 1]); } } } }
  while (++$dpth <= $ncnt) { # iteratively deepen search up to: node count
    for        (@(@xrtz[$dpth-1]) ) -> $path { next unless ($path.WHAT.^name eq 'Str' && $path.chars);my $bgin = $path;$bgin ~~ s/\,(\d+)$//;my $ennd = $0;
      for      (@rtez) {
        for           (0..@($_).elems-1  ) -> $nndx {
          if     ($_[$nndx     ] == $ennd) { # could be made faster by not re-adding nodes already visited earlier in path
            if ($nndx                    ) { push(@(@xrtz[$dpth]),       $path ~ ',' ~ $_[$nndx - 1]);#say @xrtz[$dpth][*-1];
              if ($_[$nndx - 1 ] == $dest) { @srte =          split(',', $path ~ ',' ~ $_[$nndx - 1], :skip-empty);last; } }
            if ($nndx <   @($_).elems-1  ) { push(@(@xrtz[$dpth]),       $path ~ ',' ~ $_[$nndx + 1]);#say @xrtz[$dpth][*-1];
              if ($_[$nndx + 1 ] == $dest) { @srte =          split(',', $path ~ ',' ~ $_[$nndx + 1], :skip-empty);last; } } }
        }; last if (@srte.elems);
      };   last if (@srte.elems);
    };     last if (@srte.elems); }
  if    (@srte) { say '(' ~ join(',', @srte) ~ ');';return(@srte); }
  else          { say '-1;';                        return(   -1); }
}
if    (@*ARGS) {   say 'Please use function interface in code rather than passing command-line parameters of routes, source, and destination!';
# ShrR(@*ARGS);
} else {
  ShrR([[1,2,6], [5,6,7],                ], 1, 7); # => (1,2,6,7);
  ShrR([[1,2,3], [4,5,6],                ], 2, 5); # => -1;
  ShrR([[1,2,3], [4,5,6], [3,8,9], [7,8],], 1, 7); # => (1,2,3,8,7);
  ShrR([[1,2,3], [4,5,6], [6,8,9], [3,4],], 1, 9); # => (1,2,3,4,5,6,8,9);
  ShrR([[1,2,3], [4,5,6], [6,8,9], [3,4],], 9, 1); # => (9,8,6,5,4,3,2,1);
}
