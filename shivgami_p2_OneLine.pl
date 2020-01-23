#*****************************************************************************************#
# _______ _     _ _____ _    _  ______ _______ _______ _____        .      __             #
# |______ |_____|   |    \\  /  |  ____ |_____| |  |  |   |         /|     |  |            #
# ______| |     | __|__   \\/   |_____| |     | |  |  | __|__       _|_ o  |__|            #
#                                                                                         #                                          
# Simplifying tHe titanIc blastx process using aVailable GAthering of coMputational unIts #
#                                                                                         #
#*****************************************************************************************#
#	"==================================\n";
#	"PROGRAM-2 : shivgami_p2_OneLine.pl\n";
#	"==================================\n";
#	
#	>>>	THIS PROGRAM WILL MAKE EACH SEQUENCE OF A FASTA FILE IN A SINGLE LINE
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
if($arg1!=2)
{
	print "USAGE : perl	$0	<input>	<output>\n";
	exit 0;
}

open(IN,"$ARGV[0]");
open(OUT,">$ARGV[1]");
while (<IN>)
{
	if (/>/)
	{	chomp;$_=~s/[\r]//g;
		if ($. == 1)
		{
			print OUT "$_\n";
		}
		else {print OUT "\n$_\n";}
	}
	else
	{
		chomp;$_=~s/[ \t\n\r]//g;
		print OUT $_;
	}
}
close IN;
