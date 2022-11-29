#!/usr/bin/env raku

my @lists = ([1,0,5], [0,2,0], [0,3,0]);
my $cnt;

sub MaxPos( @arr ) {

  my $max = 0;

  my $maxpos = -1;

  loop (my $x=0; $x < 3; $x++) {

    if (@arr[$x] > $max) {

      $max = @arr[$x];

      $maxpos = $x;

    }

  }

  return $max, $maxpos;

}

 

sub MinPos( @arr ) {

  my $min = 9;

  my $minpos = -1;

  loop (my $x=0; $x < 3; $x++) {

    if (@arr[$x] < $min) {

      $min = @arr[$x];

      $minpos = $x;

    }

  }

  return $min, $minpos;

}

 

sub GetTotalVal($arr) {

  my $sum = 0;

  for  (0 .. 2) -> $i

  {

    $sum += @$arr[$i];

  }

  return $sum

}

 

sub EvenUp( @arr) {

  $cnt++;

  my ($max, $maxpos) = MaxPos(@arr);

  my ($min, $minpos) = MinPos(@arr);

  print "\t(" ~ @arr ~ ")\n" if ($cnt > 1);

  @arr[$maxpos]--;

  ($maxpos == 0) || ($maxpos == 2) ?? @arr[1]++ !! @arr[$minpos]++;

  if ((@arr[0] == @arr[1] == @arr[2])) {

    print "\t(" ~ @arr ~ ")\n";

    say "Output: $cnt";

    say " ";

  } else {

    EvenUp(@arr);

  }

}

 

for (@lists) -> @lst {

  print("Input: \@lst = (" ~ @lst ~ ")\n");

  $cnt = 0;

  my $target = (GetTotalVal(@lst) / 3);

  $target >= 1 ?? EvenUp(@lst) !! say "Output: -1\n";

}
