# docker-kafka-mirror-maker

## 使用

```shell
docker run \
  -d \
  --restart always \
  -v `pwd`/kafka-mirror/consumer-mirror.properties:/opt/kafka-mirror-config/consumer-mirror.properties:ro \
  -v `pwd`/kafka-mirror/producer-mirror.properties:/opt/kafka-mirror-config/producer-mirror.properties:ro \
  xwc1125/xwc1125_kafka-mirror-maker:2.8.1_openjdk8 \
  --new.consumer --producer.config /opt/kafka-mirror-config/producer-mirror.properties --consumer.config /opt/kafka-mirror-config/consumer-mirror.properties --num.streams 3 --whitelist "*"
```

### License

Apache 2.0
