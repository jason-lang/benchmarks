#time java -cp ../libs/jason-2.4.jar jason.infra.centralised.RunCentralisedMAS threadring.mas2j

source $JASON_HOME/scripts/jason-setup
time java -cp $JASON_JAR:bin/classes jason.infra.centralised.RunCentralisedMAS threadring.mas2j
