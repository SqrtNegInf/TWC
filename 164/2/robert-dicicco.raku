#!/usr/bin/env raku

my %seen;

sub process( UInt $num) {
  my $sum = 0;
  for ( $num.comb ) { $sum += $_ ** 2 }
  if %seen.EXISTS-KEY($sum) { return 0 }
  if $sum > 1 {
    %seen{$sum} = 1;
    process( $sum );
  } else {
    return $sum;
  }
}

sub USAGE() {
    print Q:c:to/EOH/;
    Usage: {$*PROGRAM-NAME} [number]
    Number must be an integer between 1 and 20
EOH
}

sub MAIN( UInt $cnt is copy where 1 .. 20  = 8) {
  my $n = 1;
  while ($cnt > 0) {
    my $retval = process($n);
    if $retval > 0 {
      print "$n ";  # is a Happy Number!";
      $cnt--;
    }

    %seen = ();
    $n++;
  }

  say ' ';
}
