#!/usr/bin/env perl
use v5.36;

use Test::More;

my(@s,@o);

## List of operators - Entries in each array are:
##  * precedence of operator
##  * function to be run when finding operator in infix stream
##  * function to be run when finding operator in rpn stream

my %f;
%f = (
  '('=>[0,sub{push@s,'(' },                                                       ],
  ')'=>[0,sub{push@o,$_ while($_=pop@s)ne'('},                                    ],
  '*'=>[2,sub{push@o,pop@s while@s&&$f{$s[-1]}[0]>1;push@s,'*'},sub{$s[-2]*=pop@s}],
  '+'=>[1,sub{push@o,pop@s while@s&&$f{$s[-1]}[0];  push@s,'+'},sub{$s[-2]+=pop@s}],
  '-'=>[1,sub{push@o,pop@s while@s&&$f{$s[-1]}[0];  push@s,'-'},sub{$s[-2]-=pop@s}],
);

my @TESTS = (
  [ '10 + 20 - 5', 25 ],
  [ '(10 + 20 - 5) * 2', 50 ],
  [ '(5 - 10) * -5', 25 ],
  [ '10 * 10 - 6 * 6 - 8 * 8', 0 ],
  [ '4 + 4 - 6 - 2', 0 ],
  [ '(10 + 10) * (10 - 10) * (10 + 10) * (20 - (((20))))', 0 ],
  [ '(((((10+10)*10+10)*10+10)*10+10)*10+10)*10+10', 2111110 ],
);

is( evaluate(        $_->[0]), $_->[1] ) foreach @TESTS;
is( evaluate_via_rpn($_->[0]), $_->[1] ) foreach @TESTS;
is( evaluate_rpn_hsh($_->[0]), $_->[1] ) foreach @TESTS;
is( eval(            $_->[0]), $_->[1] ) foreach @TESTS;
#cmpthese( 20000, {
#  'evaluate' => sub { evaluate($_->[0]) for @TESTS },
#  'eval_rpn' => sub { evaluate_via_rpn($_->[0]) for @TESTS },
#  'eval_hsh' => sub { evaluate_rpn_hsh($_->[0]) for @TESTS },
#  'eval'     => sub { eval(    $_->[0]) for @TESTS },
#  'eval_x'   => sub { eval_x(  $_->[0]) for @TESTS },
#});
done_testing();

sub eval_x {
  return eval( shift );
}
sub evaluate  {
  my $str = shift;
  1 while $str =~ s/\(\s*([^()]*?)\s*\)/       evaluate($1)             /e;
  1 while $str =~ s/(-?\d+)\s*\*\s*(-?\d+)/    $1 * $2                  /e;
  1 while $str =~ s/(-?\d+)\s*([-+])\s*(-?\d+)/$2 eq '+' ? $1+$3 : $1-$3/e;
  return $str;
}

sub evaluate_via_rpn  {
  @s=();@o=(); ## Stack/output
  for ( $_[0] =~ m{(-?\d+|[-+*()])}g ) {
    if( m{\d} ) { ## Number push to output
      push @o, $_;
    } elsif( $_ eq '(' ) { # open bracket add to stack
      push @s, $_;
    } elsif( $_ eq ')' ) { # close bracket
      push @o, $_ while ($_ = pop @s) ne '('; # push everything to output (in reverse order)
    } else {                                  # until we reach the open bracket
      push @o, pop @s while @s && $f{$s[-1]}[0] && $f{$_}[0]<=$f{$s[-1]}[0]; # pop off
      push @s, $_;           # and push to stack if higher precidence and push value to stack
    }
  }
  push @o, reverse @s;

  @s = ();
  ## Now evaluate the RPN tree...
    $_ eq '+' ? $s[-2] += pop @s
  : $_ eq '-' ? $s[-2] -= pop @s
  : $_ eq '*' ? $s[-2] *= pop @s
  :             (push @s, $_) for @o;
  $s[0];
}

## Code from hell... First for loop processes the infix into rpn
##                   Second for loop processes the rpn stream
sub evaluate_rpn_hsh  {
  @o=(); @s=();
  ($f{$_}) ? (&{$f{$_}[1]}) : (push@o,$_) for $_[0] =~ m{(-?\d+|[-+*()])}g;
  ($f{$_}) ? (&{$f{$_}[2]}) : (push@s,$_) for @o, reverse splice @s,0;
  $s[0];
}

