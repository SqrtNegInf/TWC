#!/usr/bin/env perl
use v5.36;
use Algorithm::Permute;
use feature qw/say/;

my @arr = ([1,2,3], [1,2,3,4], [1,2,3,4,5]);

sub main {

    my $arg = shift;

    my @a = (1..$arg);

    my $len = scalar(@a);

    say "Input: $len";

    my $p = Algorithm::Permute->new(\@a, $len);

    while ( my @suba = $p->next) {

      my $res = 0;

      my $res2 = 0;

      my $success = 0;

      for my $x (0..$len-1){

        $res = $suba[$x] % ($x+1);

        $res2 = ($x+1) % $suba[$x];

        if (($res == 0) || ($res2 == 0) ) {

          $success++;

        }

        if ($success == $len) {

          print("\[@suba\] is cute!\n");

        }

      }

    }

    print("\n");

}



for my $arg (5) {

  if (( $arg <1) || ($arg > 15)) {

    say "Error: supplied arg = $arg. arg must be greater than 0 and less than 16";

    exit(1);

  }

  main($arg);

}
