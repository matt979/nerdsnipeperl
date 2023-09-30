use strict;

main();

sub main {
	print(to_factoriadic($ARGV[0], 0)."\n");
}

sub to_factoriadic {
	my ($remainder, $partial) = @_;
	die($remainder ." is less than zero") if($remainder < 0);
	die("Numbers bigger than 36287999 are illegal") if($remainder > 36287999);
	return ($partial + $remainder) if($remainder < 2);
	
	my $f = 1;
	my $d = 1;

	while($f * ($d + 1) <= $remainder) {
		$d++;
		$f = $f * $d;
	}
	
	my $i = 1;
	while($f * ($i + 1) <= $remainder) {
		$i++;
	}
	my $incremental_factoriadic = $i * (10**($d-1));
	my $incremental_decimal = $f * $i;

	return to_factoriadic($remainder - $incremental_decimal, $partial + $incremental_factoriadic);
}
