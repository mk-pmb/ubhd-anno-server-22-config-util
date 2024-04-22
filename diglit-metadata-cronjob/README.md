
DigLit-Cronjob
==============


Installation
------------

1.  Öffne eine Shell als annosrv.
1.  `cd` ins Anno-Server-Config-Verzeichnis (`cfg.@…`)
1.  Mit der URL dieses Repositories hier als `$REPO`:
    `git clone --single-branch --branch=master $REPO cfgutil`
1.  `cd` in den Klon
1.  `cd diglit-metadata-cronjob`
1.  `cp -n example-config.rc config.rc`
1.  Setze in `config.rc` die richtige `metadata_url`.
1.  Beobachte nebenher die Anno-Server-Meldungen.
1.  `./update.sh`
1.  Download dauert ne Weile, dann sollte der Anno Server neustarten.
1.  Wenn es funktioniert hat, richte einen Cron Job ein, der `update.sh`
    als user annosrv startet.

