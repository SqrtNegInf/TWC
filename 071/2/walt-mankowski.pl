#!/usr/bin/env perl
use v5.36;

use lib '.';
use Node;

my $N = 3;
my $head = Node->new(undef);

make_list($head, 1..5);
print_list($head);
remove_from_end($head, $N);
print_list($head);

sub make_list($head, @a) {
    my $node = $head;
    for my $i (@a) {
        $node->set_next(Node->new($i));
        $node = $node->next;
    }
}

sub print_list($head) {
    my $node = $head->next;
    while (defined $node) {
        print $node->val;
        print " -> " if defined $node->next;
        $node = $node->next;
    }
    say "";
}

sub list_length($head) {
    my $node = $head;
    my $len = 0;
    while (defined $node->next) {
        $len++;
        $node = $node->next;
    }
    return $len;
}

sub remove_from_end($head, $n) {
    # get to the position before the node to delete
    my $pos = list_length($head);
    my $node = $head;
    while ($pos > $n) {
        $node = $node->next;
        $pos--;
    }

    # remove it
    $node->set_next($node->next->next);
}
