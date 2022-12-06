#!/usr/bin/env raku

my @ss = [["adc", "wzy", "abc"],["aaa", "bob", "ccc", "ddd"]];
my @out = [];

sub StringValue($mystr) {
  my $val1 = substr($mystr,1,1);
  my $val0 = substr($mystr,0,1);
  my $val2 = substr($mystr,2,1);
  my $x = ord($val1) - ord($val0);
  my $y = ord($val2) - ord($val1);
  push(@out, "$x:$y");
}

sub MAIN() {

  for @ss -> @n {

    put "Input: @n = \[" ~ @n ~ "]";

    for 0..(@n.elems - 1) -> $x {

      StringValue(@n[$x]);

    }

    for 0..(@n.elems - 1) -> $x {

      my $cnt = @out.grep(@out[$x]).elems;

      if $cnt == 1 {

        print("Output: @n[$x]\n\n");

      }

    }

    @out = [];

  }

}
