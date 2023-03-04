# Zwei Strings vergleichen und rekursiv Ähnlichkeiten ermitteln.

use strict;
use warnings;
use diagnostics;
	
our @score;
our @str0;
our @str1;
our $l;

sub compare($$){
	my ($u, $v) = @_;
#	my ($len, $str, $sstr) = clen($u, $v);
	push (@str0, $u);
	push (@str1, $v);
	my $str0_ref = \@str0;
	my $str1_ref = \@str1;
	list($u, $str0_ref);
	list($v, $str1_ref);
	foreach (@str0){
			push(@score, (search($v, $_)));
			print(" " . $score[$#score] . "\n");
		}
	foreach (@str1){
			push(@score, (search($u, $_)));
			print(" " . $score[$#score] . "\n");
		}
	my $score = 0;
	my $total = ($#score + 1);
	foreach my $i (@score){
		$score += $i;
	}
	my $p = (($score / $total) * 100);
	print("@score\n$score / $total => $p%\n");
	return $p;
}

sub list($){
	my $s = $_[0];
	my $arr_ref = $_[1];
	# print("Substrings: @{$arr_ref}\n");
	# print("List " . $s . "\n");
	$l = length($s);
	if ($l <= 1){
		return;
	}
	my @div = divide($s, $l);
	foreach (@div) {
		push(@$arr_ref, $_);
		&list ($_, $arr_ref);
	}
}

sub search($$) {
	my ($u, $v) = @_;
	print("\"" . $u . "\" - \"" . $v . "\" ");
	return 1 if (index($u, $v) > -1);
	return 0;
}

sub divide($$) {
	my ($s, $len) = @_;
	my $s0 = substr($s, 0, ($len / 2));
	my $s1 = substr($s, ($len / 2), $len);
	# print("Teile \"" . $s . "\" -> \"" . $s0 . "\" - \"" . $s1 . "\"\n");
	return ($s0, $s1);
}

our ($input1, $input2) = @ARGV;
compare($input1, $input2) if ($input1 and $input2);
print "Geben Sie zwei Strings an." unless ($input1 and $input2);

# print "String 1: ";
# our $input1 = <STDIN>;
# chomp $input1;
# print "String 2: ";
# our $input2 = <STDIN>;
# chomp $input2; 
