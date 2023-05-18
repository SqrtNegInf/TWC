#!/usr/bin/env perl
use v5.36;

use Parse::RecDescent;

# $RD_HINT = 1;

my $calculator = <<'-EOT-';
    expression: term(s /([+-])/) {
        $return = $item[1]->[0];

        for (my $i = 1; $i < scalar @{$item[1]}; $i+=2) {
            if ($item[1]->[$i] eq q{+}) {
                $return += $item[1]->[$i + 1];
            } elsif ($item[1]->[$i] eq q{-}) {
                $return -= $item[1]->[$i + 1];
            }
        }
    }

    group: '(' expression ')' { $item[2]; }

    term: factor(s /\*/) {
        $return = 1;

        for my $factor (@{$item[1]}) {
            $return *= $factor;
        }
    }

    factor: number
        | group

    number: /\-?\d+(\.\d+)?/
-EOT-

my ($expression) = shift @ARGV // '3*2+2';
my $parser = Parse::RecDescent->new($calculator);
say $parser->expression($expression) // die "Parse error.\n";
