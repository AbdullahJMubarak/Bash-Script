DIR=$1
BDIR=$2
SECS=$3
MAXBUPS=$4
run:
	./backup.sh $(DIR) $(BDIR) $(SECS) $(MAXBUPS)

BDIR="./c"
launch:
	./backup.sh $(DIR) $(BDIR) $(SECS) $(MAXBUPS)

