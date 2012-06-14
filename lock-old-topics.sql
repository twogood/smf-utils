UPDATE smf_topics t, smf_messages m 
SET t.locked = 1 
WHERE m.id_msg = t.id_last_msg 
AND (FROM_UNIXTIME(m.posterTime) < DATE_SUB(NOW(), INTERVAL 90 day)) 
AND t.locked = 0 

