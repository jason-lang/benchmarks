#time java -cp ../libs/jason-2.3.jar jason.infra.centralised.RunCentralisedMAS threadring.mas2j

source $JASON_HOME/scripts/jason-setup
echo $JASON_JAR
time java -cp "$JASON_HOME/libs/*":bin/classes jason.infra.local.RunLocalMAS threadring.mas2j
