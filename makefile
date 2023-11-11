docker-build:
	docker build --platform=linux/amd64 -f Dockerfile -t xwc1125/xwc1125_kafka-mirror-maker:2.8.1_openjdk8-alpine .
	docker build --platform=linux/amd64 -f Dockerfile-base-openjdk8 -t xwc1125/xwc1125_kafka-mirror-maker:2.8.1_openjdk8 .
	docker build --platform=linux/amd64 -f Dockerfile-base-ubuntu -t xwc1125/xwc1125_kafka-mirror-maker:2.8.1_ubuntu .
docker-run:
	docker run -d --platform=linux/amd64 --name kafka-mirror --restart always -v `pwd`/consumer-mirror.properties:/opt/kafka-mirror-config/consumer-mirror.properties:ro -v `pwd`/producer-mirror.properties:/opt/kafka-mirror-config/producer-mirror.properties:ro xwc1125/xwc1125_kafka-mirror-maker:2.8.1 --new.consumer --producer.config /opt/kafka-mirror-config/producer-mirror.properties --consumer.config /opt/kafka-mirror-config/consumer-mirror.properties --num.streams 3 --whitelist "*"
