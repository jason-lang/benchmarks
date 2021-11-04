#time java -cp ../jason-agere13.jar:bin/classes jason.infra.centralised.RunCentralisedMAS threadring.mas2j
#time java -cp ~/bin/Jason-1.4.2/lib/jason.jar:bin/classes jason.infra.centralised.RunCentralisedMAS threadring.mas2j
source $JASON_HOME/scripts/jason-setup
time java -cp "$JASON_HOME/libs/*":bin/classes jason.infra.local.RunLocalMAS threadring.mas2j
