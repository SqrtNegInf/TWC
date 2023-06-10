#!/usr/bin/env perl
use v5.36;

use Tree::DAG_Node;

my $root = Tree::DAG_Node->new;
$root->name(1);
$root->new_daughter->name($_) for (2 .. 3);

my @names = (45, 67);
my $count = 0;

for my $node ($root->daughters) 
{
    for my $digit (split(//, $names[$count++])) 
    {
        $node->new_daughter->name($digit);


    }
}


print map "$_\n", @{$root->draw_ascii_tree};
print $/;

invert($root);

print map "$_\n", @{$root->draw_ascii_tree};
# This is built-in in the module, so all credit goes to the author.
print $/;
# A slight modification:
print  map { s/   /  /g; s/^\s+$//g; $_; }
     map {s/\-/ /g; s/[|]//g; s/[<>]/ /g;
     "$_$/";}  @{$root->draw_ascii_tree};


sub invert 
{
     my $node = shift;
     my @daughters = $node->daughters;
     @daughters = reverse @daughters;
     $node->set_daughters(@daughters);
     invert($_) for $node->daughters;
}
