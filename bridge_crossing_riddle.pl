use strict;
use warnings;

print uc "You are an intern in a distant lab on the top of mountain near a cliff.\nThe zombies in the lab manage to get out of the room they're being held.\nYou and the others in the lab manage to get near the cliff.\nThere is a narrow bridge, but it can only hold two people at a time.\nThey have one lantern that you the intern grabbed on the way out and,\nbecause it's night and pitch dark, the lantern has to be used when crossing the bridge.\nThe professor makes some calculation and it seems like you have 17 minutes until the zombies get to you.\nThe intern can cross the bridge in 1 minute,the assistant in 2 minutes,\nthe janitor in 5 minutes, and the old professor in 10 minutes.\nWhen two people cross the bridge together, they must move at the slower person's pace.\nThe question is, can you all get across the bridge before the zombies get to you and cut the ropes so they can't cross?\n";
print "\n\n";
my $t=0;
my $max=17;
my $cnt=0;
my $rt;
my $left=18;
my $rightside=" none ";
my $leftside=" intern assistant janitor professor";
while ( $t <= $max ) {
    print "Who would pass?\n";
    print "Leftside: $leftside";
    print "\n";
    print "Rightside: $rightside";
    print "\n";
    
    if (($cnt%2)==1){
        print "You are on the right side\n";
    }
    elsif (($cnt%2)==0){
        print "You are on the left side\n";
    }
    my $lantern = <STDIN>;
    chomp $lantern;
    my $person = <STDIN>;
    chomp $person;
    
    if (($cnt%2)==1){
        $leftside = "$leftside $lantern $person";
        $rightside =~ s/$lantern//;
        $rightside =~ s/$person//;
        print "Gone to the left side\n";
    }
    elsif (($cnt%2)==0){
        $rightside = "$rightside $lantern $person";
        $leftside =~ s/ $lantern//;
        $leftside =~ s/ $person//;
        $rightside =~ s/ none//;
    }
    
    if ($lantern eq "intern"){
        $lantern=1;
        $cnt+=1;
    }
    elsif ($lantern eq "assistant"){
        $lantern=2;
        $cnt+=1;
    }
    elsif ($lantern eq "janitor"){
        $lantern=5;
        $cnt+=1;
    }
    elsif ($lantern eq "professor"){
        $lantern=10;
        $cnt+=1;
    }
    else {
        $leftside =~ s/ $lantern//;
        $leftside =~ s/ $person//;
        $rightside =~ s/ $lantern//;
        $rightside =~ s/ $person//;
        print "That's the wrong insert.";
        next;
    }
    if ($person eq "intern"){
        $person=1;
    }
    elsif ($person eq "assistant"){
        $person=2;
    }
    elsif ($person eq "janitor"){
        $person=5;
    }
    elsif ($person eq "professor"){
        $person=10;
    }
    elsif ($person eq ""){
        $person=0;
    }
    else {
        $leftside =~ s/ $lantern//;
        $leftside =~ s/ $person//;
        $rightside =~ s/ $lantern//;
        $rightside =~ s/ $person//;
        print "That's the wrong insert.";
        next;
    }
    if ($lantern>$person) {
        $t = $t + $lantern;
    }
    if ($lantern<$person) {
        $t = $t + $person;
    }
    
    if (($cnt%2)==1){
        $left-= $lantern + $person;
    }
    elsif (($cnt%2)==0){
        $left+= $lantern + $person;
    }
    $rt = $max - $t;
    
    if ($rt>0){
        print "Remaing time: $rt";
        print "\n";
    }
    
    if ($t>=17){
        last;
    }
}
print $t;
print "\n";
if ($t==17)
{
    if ($left==0)
    {
        print "\n Yay!! 😁 You survived the zombies! 😀  You get to live in this mortal coil once more.  🙂  ";
    }
    else{
        print "Eaten by zombies: $leftside ";
        print "\n You are dead.You got eaten by the zombies. ☠💀";
    }
}
else {
    print "\n You are dead.You got eaten by the zombies. ☠💀";
}
