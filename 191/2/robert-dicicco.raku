#!/usr/bin/env raku

sub main($n) {

  print "Input: n = $n\n";

  my @arr = 1..$n;

  my $len = @arr.elems;

  for @arr.permutations -> @suba {

    my $res = 0;

    my $res2 = 0;

    my $success = 0;

    for 0..($len-1) -> $x {

      $res = @suba[$x] % ($x+1);

      $res2 = ($x+1) % @suba[$x];

      if (($res == 0) || ($res2 == 0))  {

        $success++;

      }

      if ($success == $len)  {

        print "[" ~ @suba ~ "\] is cute!\n";

      }

    }

  }

  put " ";

}


for 5 -> $arg {

  if (( $arg < 1 ) || ( $arg > 15 )) {

    say "Error: supplied argument = $arg. Argument must be greater than 0 and less than 16";

    exit(1);

  }

  main($arg);

}
