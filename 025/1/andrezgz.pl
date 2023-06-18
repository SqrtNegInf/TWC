#!/usr/bin/env perl
use v5.36;

my @pokemons = do{
    local $/;
    my $pokemons = <DATA>;
    split /\n/, $pokemons;
};

my $pokedex = {};
foreach my $p (@pokemons) {
    my @next = grep {(substr $p,-1) eq (substr $_,0,1) } @pokemons;
    push @{$pokedex->{$p}}, @next;
}

my $longest = [[]];
seq($_,$pokedex) for @pokemons;
print scalar(@{$longest}) . ' longest sequences with unique pokemon names (' . @{$longest->[0]} . ')' . $/;
print '* ' . join(',',@$_) . $/ for @{$longest};


sub seq {
    our @candidate;
    my ($p,$pokedex) = @_;
    return unless exists $pokedex->{$p};

    push @candidate, $p;

    if (@candidate > @{$longest->[0]} ){
        $longest = [[@candidate]];
    }
    elsif ( @candidate == @{$longest->[0]} ) {
        my $key = join('', sort @candidate);
        my $exist = grep { $key eq join('', sort @$_) } @{$longest};
        push @$longest, [@candidate] unless $exist;
    }

    my $next = $pokedex->{$p};
    delete $pokedex->{$p};

    seq($_,$pokedex) for @$next;

    $pokedex->{$p} = $next;
    pop @candidate;

}

# OUTPUT
# $ ./ch-1.pl
# 6 longest sequences with unique pokemon names (23)
# * machamp,petilil,landorus,scrafty,yamask,kricketune,emboar,registeel,loudred,darmanitan,nosepass,simisear,relicanth,heatmor,rufflet,trapinch,haxorus,seaking,girafarig,gabite,exeggcute,emolga,audino
# * machamp,petilil,landorus,seaking,girafarig,gabite,emboar,registeel,loudred,darmanitan,nosepass,simisear,relicanth,heatmor,rufflet,trapinch,haxorus,snivy,yamask,kricketune,exeggcute,emolga,audino
# * machamp,petilil,landorus,seaking,girafarig,gabite,emboar,registeel,loudred,darmanitan,nosepass,simisear,relicanth,heatmor,rufflet,trapinch,haxorus,starly,yamask,kricketune,exeggcute,emolga,audino
# * machamp,pinsir,registeel,landorus,scrafty,yamask,kricketune,emboar,relicanth,haxorus,simisear,rufflet,trapinch,heatmor,remoraid,darmanitan,nosepass,seaking,girafarig,gabite,exeggcute,emolga,audino
# * machamp,pinsir,registeel,landorus,seaking,girafarig,gabite,emboar,relicanth,haxorus,simisear,rufflet,trapinch,heatmor,remoraid,darmanitan,nosepass,snivy,yamask,kricketune,exeggcute,emolga,audino
# * machamp,pinsir,registeel,landorus,seaking,girafarig,gabite,emboar,relicanth,haxorus,simisear,rufflet,trapinch,heatmor,remoraid,darmanitan,nosepass,starly,yamask,kricketune,exeggcute,emolga,audino


__DATA__
audino
bagon
baltoy
banette
bidoof
braviary
bronzor
carracosta
charmeleon
cresselia
croagunk
darmanitan
deino
emboar
emolga
exeggcute
gabite
girafarig
