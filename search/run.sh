#time java -cp ../libs/jason-2.3.jar jason.infra.centralised.RunCentralisedMAS search.mas2j

source $JASON_HOME/scripts/jason-setup
time java -Xss15m -cp "$JASON_HOME/libs/*":bin/classes jason.infra.local.RunLocalMAS search.mas2j
