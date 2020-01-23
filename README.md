#                                        SHIVGAMI
# Simplifying tHe titanIc blastx process using aVailable GAthering of coMputational unIts.

Researchers who have small computational units, but not able to run blastx process,
do not worry!

Here we go with SHIVGAMI, which assemble the CPU powers from the available Linux machines and able to convert
a small computer lab into a powerful grid to perform the blastx process !

Communities with powerful resources, but with bulk-query load can also utilize SHIVGAMI to complete the blastx
proecss using available small Linux machines.

In a nutshell, SHIVGAMI is a time and cost savior tool for all users
starting from commercial firm to a common man, utilises the
"Little Drops of Water make a Mighty Ocean" concept
without any requirement of paid software, hardware and man-power.

Going through the 5 steps mentinoed below will help user to understand, install and run the SHIVGAMI !

# 1. Gathering of Linux computational units

	Collecting information for those computational units which are having Linux Operating Systems(OS).
	User can collect all types of Linux Machines like Normal PCs, High-config PCs and Servers.
	We have not tested SHIVGAMI on laptops, but user can include, if the laptop is in the connected network.
	We have tested SHIVGAMI on Ubuntu and CentOS.
  
# 2. Preparation

	(I) Prerequisites
		(i)Perl
       Perl is a programming language.
        
		Below command will display the version of installed perl.
		perl -v

		If, perl is not installed then, run the following commands to install the perl:

		Debian/Ubuntu
		sudo apt-get install perl

		RedHat/CentOS
		yum install perl	(run this as a root user)
    
    User can also get it from
    https://www.perl.org/get.html
    
		(ii)sshpasss
        sshpass is a utility designed for running ssh using the mode referred to as
        "keyboard-interactive" password authentication, but in non-interactive mode.
        User can get it by running following command:
        
		Debian/Ubuntu
		sudo apt-get install sshpass
		
		RedHat/CentOS
		yum install sshpass	(run this as a root user)

		user can re-check the installation using command:
		sshpass -h
    
		(iii)OpenSSH Server
		(iv)OpenSSH Client
    
        OpenSSH provides a server daemon and client tools to facilitate secure,
        encrypted remote control and file transfer operations, effectively replacing the legacy tools.

		Ubuntu OS may have openssh-client, if not,
    it can be retrieved using commnd along with openssh-server:

		Debian/Ubuntu
		sudo apt-get install openssh-server openssh-client

		The installation can be verified using commands:
		sudo dpkg -l openssh-server
		sudo dpkg -l openssh-client
		
		RedHat/CentOS
		sudo apt-get install openssh-server openssh-client

		(v)Blast+
    BLAST+ is a sequence similarity searching program package, provided by NCBI.
    
		The latest Blast+ program can be obtained from NCBI ftp site, below are the steps
		ftp://ftp.ncbi.nlm.nih.gov/
			|
			v
		click on blast
			|	
			v
		click on executables
			|
			v
		click on blast+
			|
			v
		click on LATEST
			|	(final link is: ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST)
			v
		There are various file types, but linux.tar.gz is an easy way to go!
    After download, user can extract the content using command:
    
    tar -xzf file.tar.gz
    
		(vi)Protein database
		A user can make a customized protein database as per the requirement
		The database must be formatted as per the NCBI blast+ package.

		Suppose, a user is having a protein database file called - protein.fasta
		The command to format protein.fasta is:
		/home/lab2/test1/ncbi-blast-2.10.0+/bin/makeblastdb -in protein.fasta -input_type fasta -dbtype prot
		Where, 
			/home/lab2/test1/ncbi-blast-2.10.0+/bin/makeblastdb
			is a path where the makeblastdb executable is located

			-in : input file
			-input_type : input file type
			-dbtype : molecule type ( String OR nucl(nucleotide) OR prot(protein) )

		The same can be seen in detail with makeblastdb help

		If a user want to run blastx against NCBI-NR protein database,
    it can be obtained from:
		ftp://ftp.ncbi.nlm.nih.gov/blast/db/ which is already formated.

		A user must donwload all files with prefix "nr."
		(Example: nr.00 to nr.142 as on 13-Jan-2020 3:43 IST)

		(vii)Network connection
		Network connection is required to run this software.
    It means the Linux pc, which is going to be used to run blastx has to be in network connection.
		
	(II) Master node
		A master node is a computational unit with Linux OS, which distributes the process amongst the child nodes.
		Master node will not take part in the blastx process.
		Master node can be a simple computer or a server or a high-end pc.
		
	(III) Child node system information
		Child nodes are all computational units with Linux OS, except master node.

		A text file "child_node_system_info.txt" (user can rename it, if required) creation
		is required.
    
    First line consist exact below mentioned line:
    NO	USER	IP	Password	process_PATH	blast_program_PATH	Database_PATH
    (
      each 7 fields are separated by TAB,
      user can modify the filed data with required spelling and case of the alphabets but
      the manner of the field must not be changed
    )
    
    All the 7 fields are described below:

		(i)Serial No. OR NO
		This is just a serial number like 1,2,3..

		(ii)User
		Username of a current login
		Example: lab2.
    Username can be identified by typing 'pwd' command on a terminal opened from desktop
    Example: /home/lab2


		(iii)IP Address
    Internet Protocol address.
    It can be known using 'ifconfig' command

		(iv)Password
		A password for the child node system
		Example: lab2_123

		(v)Process path
		A path or location where the process will run
		Example: /home/lab2/Naman

		(vi)Blast path
		A path where blast+ executable is located
		Example: /home/lab2/test1/ncbi-blast-2.10.0+/bin

		(vii)Database path
		A path where protein database is located
		Example: /home/lab2/test1/database
    
    The sample "child_node_system_info.txt" will look like:
    ================================================================================================================
    NO	USER	IP	Password	process_PATH	blast_program_PATH	Database_PATH
    1	lab3	172.16.29.122	111	/home/lab3/Naman	/home/lab3/blast_2p9p0plus/bin/blastx	/home/lab3/nr
    2	lab11	172.16.29.123	222	/home/lab11/Naman	/home/lab11/blast_2p9p0plus/bin/blastx	/home/lab11/nr
    3	lab14	172.16.29.124	333	/home/lab14/Naman	/home/lab14/blast_2p9p0plus/bin/blastx	/home/lab14/nr
    4	lab15	172.16.29.125	444	/home/lab15/Naman	/home/lab15/blast_2p9p0plus/bin/blastx	/home/lab15/nr
    5	u_132	172.16.29.123	555	/home/u_132/Naman	/home/u_132/blast_2p9p0plus/bin/blastx	/home/u_132/nr
    6	lab6	172.16.29.35	666	/home/lab6/Naman	/home/lab6/blast_2p9p0plus/bin/blastx	/home/lab6/nr
    ================================================================================================================

# 3. Download SHIVGAMI

    Download SHIVGAMI from either Github or www.shivgami.net
    It contains 5 perl programs:
      shivgami_p1_Run.pl
      shivgami_p2_OneLine.pl
      shivgami_p3_Partition.pl
      shivgami_p4_Status.pl
      shivgami_p5_Merge.pl

# 4. Run SHIVGAMI

		User must put all 5 programs of SHIVGAMI inside a directory from where the process will be initiated.
    
    Step-1
    Run the 1st perl program with 2 arguments: <input-fasta file> and <child-node-information>
    Examole : 
    perl shivgami_p1_Run.pl input.fasta child_node_system_info.txt
    program-2 and program-3 will be called automatically.
    
    This step will generate a folder called "master_xxxxxxxx",
    where xxxxxxxx=random numbers.
    Example: master_1578137993
    
    Step-2
    User can know the status of result file using program-4
    inside the "master_1578137993" folder.
    Example:
    perl shivgami_p4_Status.pl


# 5. Merge results

    Once, the user will get the "PROGRAM-4 COMPLETED !" status from program-4, program-5 should be run
    inside the "master_1578137993" folder,
    to merge the different result files from the respective child-nodes.
    Example: 
    perl shivgami_p5_Merge.pl
