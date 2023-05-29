#!/usr/bin/env perl
use v5.36;

sub ellis($c,$name) {
    qq|${\ do{$c}}o-| . (($c eq substr(lc $name,0,1)) ? (substr($name,1)) : ($c . substr($name,1)));
}

sub verse($name) {
    my $main = ucfirst($name);
    my $verse=<<"END";
$main, $main, ${\ do {ellis('b',$main)}}
Bonana-fanna ${\ do {ellis('f',$main)}}
Fee fi ${\ do {ellis('m',$main)}}
$main!    
END
    return $verse;
}

say verse('Katie');
