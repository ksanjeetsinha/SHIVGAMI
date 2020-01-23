#*****************************************************************************************#
# _______ _     _ _____ _    _  ______ _______ _______ _____        .      __             #
# |______ |_____|   |    \\  /  |  ____ |_____| |  |  |   |         /|     |  |            #
# ______| |     | __|__   \\/   |_____| |     | |  |  | __|__       _|_ o  |__|            #
#                                                                                         #                                          
# Simplifying tHe titanIc blastx process using aVailable GAthering of coMputational unIts #
#                                                                                         #
#*****************************************************************************************#
#	"====================================\n";
#	"PROGRAM-3 : shivgami_p3_Partition.pl\n";
#	"====================================\n";
#	
#	>>>	THIS PROGRAM WILL MAKE "N" NUMBER OF FASTA FILES FROM A SINGLE FASTA FILE
#
#	(c) 2020, Software written by: Naman Mangukia
#	naman.neoanderson007(at)gmail.com, namanmangukia(at)gujaratuniversity.ac.in 
#
#	If you use this software please cite:
#	Mangukia N, Raval S, Pandya H and Rawal R (2020)
#	(Publication is in process)
#
#   	SHIVGAMI comes with ABSOLUTELY NO WARRANTY and is a free software to use.

#	SHIVGAMI assemble the computational power of CPUs from available
#	LINUX machines and uses them to run blastX process.\n";
#
$arg1=$#ARGV+1;
if($arg1!=3)
{
	print "USAGE : perl	$0	<No of Splitted files U Want>	<input-file>	<output_prefix>\n";
	exit 0;
}

$sp_no='';	#	No. of splitted files
$sp_no=$ARGV[0];
chomp($sp_no);

$out_prefix='';	#	No. of splitted files
$out_prefix=$ARGV[2];
chomp($out_prefix);


if($sp_no < 1)
{
	print "USAGE : Please enter the POSITIVE-INTEGER for the 1st-Argument\n";
	exit 2;
}


($tot_seq,$lencnt,$tot_line)=0;
$l='';
open(IN,"$ARGV[1]");
while(<IN>)
{
	if(/^>/){$tot_seq++;$tot_line++;}
	else
	{
		$tot_line++;
		chomp;$l='';
		$l=length($_);
		$lencnt+=$l;
	}
}
close IN;

if($sp_no > $tot_seq)
{
	print "USAGE : Please enter 1st Argument in less-than-OR-Equal amount to the #_of_sequences\n";
	exit 1;
}

$range='';
$range=int($lencnt/$sp_no);

#print "range = $range\n";

($curr_line,$curr_l)=0;
($fcnt)=1;
($curr_lcnt,$outfh,$fname)='';

$outfh="OUT".$fcnt;
$fname=$out_prefix."_".$fcnt.".fa";

open(IN,"$ARGV[1]");
open($outfh,">$fname");

$last_phase=0;
while(<IN>)
{
	if($last_phase==0)
	{
		if(/^>/){print $outfh $_;$curr_line++;}
		else
		{
			print $outfh $_;
			$curr_line++;
			$curr_l='';
			$curr_l=length($_);
			$curr_lcnt+=$curr_l;
			if($curr_lcnt>=$range)
			{
				$curr_lcnt=0;
				close $outfh;($outfh,$fname)='';
				$fcnt++;
				if($fcnt==$sp_no){$last_phase=1;$outfh="OUT".$fcnt;$fname=$out_prefix."_".$fcnt.".fa";open($outfh,">$fname");next;}
				$outfh="OUT".$fcnt;
				$fname=$out_prefix."_".$fcnt.".fa";
				open($outfh,">$fname");
			}
		}
	}
	else
	{
		print $outfh $_;
	}
}
close IN;
close $outfh;

