# build images
git checkout box/5.0
docker build  --platform linux/arm64 -t nhaidarflipp/kafka-lenses-dev:arm64 .
git checkout fdd/main
docker build  --platform linux/amd64 -t nhaidarflipp/kafka-lenses-dev:amd64 .

# push env specific images
docker push nhaidarflipp/kafka-lenses-dev:arm64
docker push nhaidarflipp/kafka-lenses-dev:amd64

# create multi-arch manifest and push
docker manifest create nhaidarflipp/kafka-lenses-dev:latest --amend nhaidarflipp/kafka-lenses-dev:arm64 --amend nhaidarflipp/kafka-lenses-dev:amd64
docker manifest push nhaidarflipp/kafka-lenses-dev:latest
