#!/usr/bin/env raku

.say for center  ('This', 'is', 'a test of the', 'centre function');

sub center (@strings)
{
  my $max-length = @strings>>.chars.max;
  return @strings.map({ .indent(($max-length - .chars) / 2) });
}
