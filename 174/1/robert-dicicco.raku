#!/usr/bin/env raku

my $inp = 0;
my @arr = ();

sub getPosiSum(@a){

  my $sum = 0;

  my $i = 0;

  while $i < @a.elems  {

      $sum += @a[$i] ** ($i+1);

      $i++;

  }

  return $sum;

}

$inp = 0;

my $count = 1;

while $count < 19 {

  @arr = $inp.comb;

  my $retval = getPosiSum(@arr);

  if $retval == $inp {

    print("$retval ");

    $count++;

  }

  $inp++;

}

print(" ");
