#!/usr/bin/env raku
#
my %index;

#build the index tree
#$*ARGFILES.handles.map({
<sample.txt sample1.txt sample2.txt>.map({
    my $fh = $_.IO.open; 
	$fh.encoding('utf8');
	my $path=$fh.IO.path;
	my $line=1;
	sink $fh.IO.lines.map({
		sink .comb(/\w+/).  map({
			%index{$_}{$path}<count>++;
			%index{$_}{$path}<lines>.push($line);
		});
		$line++;
	});
});

#print out the index tree sorted by words
%index.keys.sort.map({
        print "Word: $_\n";
	my $e=%index{$_};#$_;
	sink $e.keys.sort.map({
		printf "\tFile: %s\t Count: %s\t Line: %s\n", $_, $e{$_}.<count>, $e{$_}.<lines>;	
	});
});


