#!/usr/bin/env perl
use v5.36;

my @list=();
my %option=(
   unique=>0,
   separator=>"\n",
   caseInsensitive=>0,
);

# example input to demo if no input supplied
my @plist=("name\@example.org","rjt\@cpan.org","Name\@example.org",
          "rjt\@CPAN.org","user\@alpha.example.org","data","-U");
# or use provided input
@plist=@ARGV if @ARGV; 

while (@plist){
  my $next=shift @plist; 
  if ($next=~/^(.+@[^@]+)$/){ # collect email-looking arguments
    push @list, $next 
    }
    # options -u unique as defined in task,
    #         -U username case insensitive
    #         -o output to file (follwed by filename
    #         -s choose a different separator
    elsif   ($next=~/^-[Uuos]$/){ 
      if    ($next=~/^-u$/) {$option{unique}=1}
      elsif ($next=~/^-o$/) {$option{outputFile}=shift @plist}
      elsif ($next=~/^-U$/) {$option{caseInsensitive}=1;$option{unique}=1}
      elsif ($next=~/^-s$/) {$option{separator}=shift @plist}
      
    }
    # uses the __DATA__ segment for demo purposes if "data" is one of the parameters
    elsif ($next=~/^data$/i){ 
      while(<DATA>){
        my @found=(m/([^\s"']+@[\w\.]+)/g);
        push @list, @found;
      }
    }
    elsif (-f $next){
      open my $fh, "$next" or next; 
      while(<$fh>){
        my @found=(m/([^\s"']+@[^\w\b]+)/g);
        push @list, @found;
      }
      close $fh;
    }
}

sortEmail();

sub sortEmail{
  my @splitList=map {m/^(.+)@([^@]+)$/;[$1,$2]} map{$option{caseInsensitive}?lc $_:$_} @list;
  my @sorted=sort { lc ($$a[1]) cmp lc($$b[1])? lc $$a[1] cmp lc $$b[1]:$$a[0] cmp $$b[0]       } @splitList;
  my @filtered=();
  if ($option{unique}){
    foreach (0..$#sorted){
      push @filtered,$sorted[$_] unless (${$sorted[$_]}[0] eq ${$sorted[$_-1]}[0]) and (lc ${$sorted[$_]}[1] eq lc ${$sorted[$_-1]}[1])
    }
  }
  else {
    @filtered=@sorted;
  }
  
  if ($option{outputFile}){
    open (my $fh,">",$option{outputFile}) or die "unable to create outputFile $option{outputFile}:$!";
    print $fh "$$_[0]\@$$_[1]$option{separator}" foreach @filtered;
    close $fh;
    
  }
  else{
    print "$$_[0]\@$$_[1]$option{separator}" foreach @filtered;
  }
}


__DATA__
fred@flintstone.com, wilma@flintstone.com lorem ipsum etc rubbish barney@rubble.org
more rubbish BETTY@rubble.com 
;
