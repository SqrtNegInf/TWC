#!/usr/bin/env raku

sub SBCh {my @bitz = @_;my @bits = @bitz;my $sbch = 0;my $dcds = '';
  while     (@bits        ) {
    if      (@bits[0] == 1) { shift(@bits);
      if    (@bits        ) {
        if  (@bits[0] == 1) { $dcds ~= 'c';
        } else              { $dcds ~= 'b';
        };                    shift(@bits); }
    }     else              { shift(@bits);
                              $dcds ~= 'a'; } }
  $sbch = 1 if              ( $dcds ~~ /a$/ );
  printf("(%-10s) => %s;\n", join(', ', @bitz), $sbch);
  return($sbch);
}
if    (@*ARGS) {
  SBCh(@*ARGS);
} else {
  SBCh(1, 0, 0   ); # => 1;
  SBCh(1, 1, 1, 0); # => 0;
}
