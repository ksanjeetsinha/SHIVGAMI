#*****************************************************************************************#
# _______ _     _ _____ _    _  ______ _______ _______ _____        .      __             #
# |______ |_____|   |    \\  /  |  ____ |_____| |  |  |   |         /|     |  |            #
# ______| |     | __|__   \\/   |_____| |     | |  |  | __|__       _|_ o  |__|            #
#                                                                                         #                                          
# Simplifying tHe titanIc blastx process using aVailable GAthering of coMputational unIts #
#                                                                                         #
#*****************************************************************************************#
#	"==================================\n";
#	"PROGRAM-4 : shivgami_p4_Status.pl \n";
#	"==================================\n";
#	
#	>>>	THIS PROGRAM WILL PROVIDE THE STATUS OF BLASTX process 
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

	print "
#*****************************************************************************************#
# _______ _     _ _____ _    _  ______ _______ _______ _____        .      __             #
# |______ |_____|   |    \\  /  |  ____ |_____| |  |  |   |         /|     |  |            #
# ______| |     | __|__   \\/   |_____| |     | |  |  | __|__       _|_ o  |__|            #
#                                                                                         #                                          
# Simplifying tHe titanIc blastx process using aVailable GAthering of coMputational unIts #
#                                                                                         #
#*****************************************************************************************#
\n";

print "====================================\n";
print "PROGRAM-4 : prog4_process_status.pl \n";
print "====================================\n";
print "
(c) 2020, Software written by: Naman Mangukia
naman.neoanderson007(at)gmail.com, namanmangukia(at)gujaratuniversity.ac.in 

If you use this software please cite:
Mangukia N, Raval S, Pandya H and Rawal R (2020)
(Publication is in process)

   SHIVGAMI comes with ABSOLUTELY NO WARRANTY and is a free software to use.

SHIVGAMI assemble the computational power of CPUs from available
LINUX machines and uses them to run blastX process.\n";


$c1=`ls|grep xml\$|grep outfile|sort -V`;
chomp($c1);

#print "c1 = $c1\n";

$l=length($c1);

if($l==0)
{
	print "Dear User!\n\tStill no xml file is generated !\n\tYou can try again after sometime.\n";
	exit 0;
}

@c2=split('\n',$c1);


#	checking the status

$cnt0=0;
$pc_counter='';
print "================================================================================================================\n";
print "System_information\tPC\tXML\tTime\tDescription\n";
print "================================================================================================================\n";

$xml_desc_flag=0;$time_desc_flag=0;
$warning_flag=0;

open(F0,"phase5_mergeInfo.txt");
while(<F0>)
{
	$flag_xml=0;
	$flag_time=0;
	$xml_desc="No-Description-Found\t";
	$time_desc="No-Description-Found\t";



	chomp;$cnt0++;
	$pc_name,$pc_counter='';
	$pc_name=(split '\t',$_)[0];
	print $pc_name."\tpc-".$cnt0."\t";
	$pc_counter="pc".$cnt0;

	($len_pc_xml,$pc_cmd_xml)='';
	$pc_cmd_xml=`ls|grep $pc_counter|grep xml|grep outfile`;
	chomp($pc_cmd_xml);

	$len_pc_xml=length($pc_cmd_xml);

	if($len_pc_xml==0)
	{
		$flag_xml=1;
		print "NO\t";
	}
	if($flag_xml==0)
	{
		print "YES:";
		$pc_cmd_xml2='';
		$pc_cmd_xml2=`stat $pc_cmd_xml |grep Size|awk '{print \$2}'`;
		chomp($pc_cmd_xml2);
		print $pc_cmd_xml2."\t";
		if($pc_cmd_xml2==0)
		{
			if($xml_desc_flag==0){$xml_desc_flag=1;}
			$xml_desc="BLANK file generated\t";
		}
	}

	($len_pc_time,$pc_cmd_time)='';
	$pc_cmd_time=`ls|grep $pc_counter|grep _time_`;
	chomp($pc_cmd_time);
	$len_pc_time=length($pc_cmd_time);

	if($len_pc_time==0)
	{
		$flag_time=1;
		print "NO\t";
	}
	if($flag_time==0)
	{
		print "YES:";
		$pc_cmd_time2='';
		$pc_cmd_time2=`stat $pc_cmd_time |grep Size|awk '{print \$2}'`;
		chomp($pc_cmd_time2);
		print $pc_cmd_time2."\t";
		if($pc_cmd_time2==0)
		{
			if($time_desc_flag==0){$time_desc_flag=1;}
			$time_desc="BLANK file generated";
		}
	}
	print "XML_desc: ".$xml_desc."|Time_desc: ".$time_desc."\n";

	if($flag_xml==1 || $flag_time==1)
	{
		$warning_flag=1;
		if($flag_xml==1)
		{
			print "\n";
			print "\tThe XML file is not generated yet:check the child-node\n";
			next;
		}
		if($flag_time==1)
		{
			print "\n";
			print "\tThe time file is not generated yet\n\tcheck the child-node\n";
			next;
		}
		if($flag_xml==1 && $flag_time==1)
		{
			print "\n";
			print "\tBoth the XML and time file is not generated\n\tIt may possible that process is running\n";
			print "\tCheck the child-node\n";
			next;
		}
	}

}
close F0;

if($xml_desc_flag==1)
{
	print "\n\n";
	print "\tXML files generated, but one/many files are BLANK\n";
	print "\tIt may be due to interrupted blastx process at respective CHILD-NODE\n";
	print "\tPlease check the issue\n";
	print "\txxxxxxxxx	Process Incompleted	xxxxxxxxxx\n";
	exit 0;
}
if($time_desc_flag==1)
{
	print "\n\n";
	print "\ttime files generated, but one/many files are BLANK\n";
	print "\tPlease check the issue\n";
	print "\txxxxxxxxx	Process Incompleted	xxxxxxxxxx\n";
	exit 0;
}
if($xml_desc_flag==1 && $time_desc_flag==1)
{
	print "\n\n";
	print "\tXML and time files generated, but one/many files are BLANK\n";
	print "\tPlease check the issue\n";
	print "\txxxxxxxxx	Process Incompleted	xxxxxxxxxx\n";
	exit 0;
}

if($warning_flag==1)
{
	print "\n\n";
	print "\t1 or More XML/time files are not generated\n";
	print "\tPlease check the issue\n";
	print "\txxxxxxxxx	Process Incompleted	xxxxxxxxxx\n";
	exit 0;
}


$cnt1=`ls|grep xml\$|grep outfile|wc -l`;
chomp($cnt1);


$line='';
%hash1_xml=();
foreach $line(@c2)
{
	chomp($line);
	$hash1_xml{$line}=1;
}

%hash2_time=();
$cnt2=0;
open(F1,"Phase6_output_stuff.txt");
while(<F1>)
{
	if(/^USR_IP/){next;}
	chomp;
	($xmlout1,$time_val1_fnm,$time_val1)='';
	$xmlout1=(split '\t',$_)[6];

	print $xmlout1."\t";
	if(exists $hash1_xml{$xmlout1})
	{
		print ":\tProcess Completed\n";$cnt2++;
		$time_val1_fnm=(split '\t',$_)[9];
		$time_val1=`cat $time_val1_fnm`;
		chomp($time_val1);
		$hash2_time{$cnt2}=$time_val1;
		next;
	}
	print ":\tProcess Running..\n";
}
close F1;

$max1=-1;$flag1=0;$pc_max='';
if($cnt2==$cnt1)
{
	$flag1=1;
	for($i=1;$i<=$cnt2;$i++)
	{
		print "Time span by pc".$i." = ".$hash2_time{$i}." sec\n";
		if( $max1<($hash2_time{$i}) )
		{
			$max1=$hash2_time{$i};$pc_max=$i;
		}
	}
}
if($flag1==1)
{
	($h1,$m1,$s1,$left1)='';
	$h1=int($max1/3600);
	$left1=$max1 % 3600;
	$m1=int($left1/60);
	$s1=int($left1 % 60);
	print "Overall Maximum time span by pc-".$pc_max." = ".$h1." Hour ".$m1." min ".$s1." sec\n";
}



