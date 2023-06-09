#!/usr/bin/env perl
use v5.36;

my $K = shift || 3;
my @input = (1, 4, 3, 2, 5, 2);
#my @input = map {(1 .. 10)[rand 10] } 1 .. 10; # (1, 4, 3, 2, 5, 2);
print join(' -> ', @input), $/;


# LL-Implementation.
# https://www.slideshare.net/lembark/perly-linked-lists

my $list = [[]];

my $node = $list->[0];
for my $val ( @input )
{
     @$node = ([], $val);
     $node = $node->[0];
}

my $part_uK = [[]];
my $node_uK = $part_uK->[0];

my $part_oK = [[]];
my $node_oK = $part_oK->[0];


$node = $list->[0]; # Back to begin.

while ($node)
{
     if ( $node->[1] and $node->[1] < $K )
     {
          @$node_uK = ([], $node->[1]);
          $node_uK = $node_uK->[0]; 

     }
     elsif ( $node->[1] and $node->[1] >= $K )
     {
          @$node_oK = ([], $node->[1]);
          $node_oK = $node_oK->[0];
     }
     $node = $node->[0];
}

@$node_uK = @{@$part_oK[0]}; # Now all the partitioned LL is in $part_uK.
# $node_uK was already at the end of the list.

# Free memory.
undef $list; 
undef $part_oK; 



# Output.
my $n_all = $part_uK->[0];
while ( $n_all )
{
     print $n_all->[1] if $n_all->[1];

     $n_all = $n_all->[0];
     print ' -> ' if ($n_all and $n_all->[1]);

}
print $/;
