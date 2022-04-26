#!/usr/bin/env raku

my $order = 1;
my @x = (5, 9, 2, 8, 1, 6);

my $i = 1;
while   @x.elems > 1 &&$i  <=$order   {
    @x = @x[1..*]  <<->> @x[0..^* -1];
    say "order {$i++}: {@x}";
}
