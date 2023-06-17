#!/usr/bin/env perl
use v5.36;

sub generate_bar_graph {
    my @keys;
    my ($data,$opt) = @_;
    my $longest     = 0;
    my @sorted      = sort keys %{$data};
    for my $word (@sorted) {
        $longest = length $word if $longest < length $word;
    }
    
    @keys = ($opt eq "values")?sort { ${$data}{$b}-${$data}{$a} } @sorted:@sorted;
    
    for my $word (@keys) {
        printf ("%${longest}s | %s\n",$word, "####" x ${$data}{$word});
    }
}

my $data = { apple => 3, cherry => 2, banana => 1 };
say "Bar graph sorted by labels:";
generate_bar_graph($data,"labels");
say "\nBar graph sorted by values:";
generate_bar_graph($data,"values");
