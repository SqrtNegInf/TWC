#!/usr/bin/env perl
use v5.36;

my $inp = 0;
my @arr = ();

sub getPositSum {

  my @a = @_;

  my $sum = 0;

  for (my $i = 0; $i < scalar(@arr); $i++){

    $sum += $arr[$i] ** ($i+1);

  }

  return $sum;

}

$inp = 0;

my $count = 1;

while($count < 19){

  @arr = split(//, $inp);

  my $retval = getPositSum(\@arr);

  if($retval == $inp){

    print("$retval ");

    $count++;

  }

  $inp++;

}

print(" ");
