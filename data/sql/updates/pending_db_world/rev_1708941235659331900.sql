--
UPDATE `creature_template` SET `mechanic_immune_mask` = `mechanic_immune_mask` &~33554432 WHERE `entry` IN (21270, 21274);
