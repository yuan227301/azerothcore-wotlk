--
UPDATE `spell_dbc` SET `Attributes`=`Attributes`&~0x00200000, `AttributesEx7`=`AttributesEx7`|0x01800000, `DefenseType`=1 WHERE `ID`=20253;
