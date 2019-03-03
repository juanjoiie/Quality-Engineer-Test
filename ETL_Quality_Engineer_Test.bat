SET KitchenPath=C:/pdi-ce-7.1.0.0-12/data-integration/Kitchen.bat
SET JobPath=C:\Users\JJ\Documents\Quality_Engineer_Test\ETL_Quality_Engineer_Test.kjb
SET LogPath=C:\Users\JJ\Documents\Quality_Engineer_Test\BatchJobLog.log

%KitchenPath% /file:%JobPath% /level:Detailed /log:%LogPath%
Exit