MASERT_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' dockerfile_redis-master_1)
SLAVE_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' dockerfile_redis-slave1_1)
SENTINEL_IP=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' dockerfile_redis-sentinel_1)

echo Redis master: $MASERT_IP
echo Redis Slave: $SLAVE_IP
echo ------------------------------------------------
echo Initial status of sentinel
echo ------------------------------------------------
docker exec dockerfile_redis-sentinel_1 redis-cli -p 26379 info Sentinel
echo Current master is
docker exec dockerfile_redis-sentinel_1 redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster
echo ------------------------------------------------

echo Stop redis master
docker pause dockerfile_redis-master_1
echo Wait for 10 seconds
sleep 10
echo Current infomation of sentinel
docker exec dockerfile_redis-sentinel_1 redis-cli -p 26379 info Sentinel
echo Current master is
docker exec dockerfile_redis-sentinel_1 redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster


echo ------------------------------------------------
echo Restart Redis master
docker unpause dockerfile_redis-master_1
sleep 5
echo Current infomation of sentinel
docker exec dockerfile_redis-sentinel_1 redis-cli -p 26379 info Sentinel
echo Current master is
docker exec dockerfile_redis-sentinel_1 redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster