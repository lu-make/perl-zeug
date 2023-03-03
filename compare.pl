use strict;

sub compare($$){
	my $score = 0;
	my ($u, $v) = @_;
	my $ul = length($u);
	my $vl = length($v);
	my $tl;
	$tl = $ul if ($ul >= $vl);
	$tl = $vl if ($vl > $ul);
	
	my $s;
	my $t;
	# todo Sortieren nach Buchstaben
	for my $i (0 .. ($tl - 1)) {
		print ("\n" . $i . ", ");
		$s = substr $u, $i, 1 or $s = "";
		$t = substr $v, $i, 1 or $t = "";
		print ("\"" . $s . "\" == \"" . $t . "\"") if ($s eq $t);
		print ("\"" . $s . "\" =/= \"" . $t . "\"") unless ($s eq $t);
		$score++ if ($s eq $t);
	}
	print "\n" . $score . " / " . $tl;
}

print "String 1: ";
our $input1 = <STDIN>;
chomp $input1;
print "String 2: ";
our $input2 = <STDIN>;
chomp $input2; 
compare($input1, $input2);
