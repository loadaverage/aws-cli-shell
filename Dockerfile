# version 0.0.2
# aws-shell and aws-cli in one image
# based on https://github.com/jessfraz/dockerfiles/blob/master/awscli/Dockerfile
#
# howto:
#  run awscli with mounted Docker volume:
#    docker run \
#     -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
#     -e AWS_DEFAULT_OUTPUT=$AWS_DEFAULT_OUTPUT \
#     -e AWS_ACCESS_KEY_ID=$AMAZON_ACCESS_KEY_ID \
#     -e AWS_SECRET_ACCESS_KEY=$AMAZON_SECRET_ACCESS_KEY \
#     -v aws-cli:/home/aws \
#     --rm \
#     -ti \
#     awscli
#
#  run aws-shell with mounted Docker volume:
#    docker run \
#     -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
#     -e AWS_DEFAULT_OUTPUT=$AWS_DEFAULT_OUTPUT \
#     -e AWS_ACCESS_KEY_ID=$AMAZON_ACCESS_KEY_ID \
#     -e AWS_SECRET_ACCESS_KEY=$AMAZON_SECRET_ACCESS_KEY \
#     -v aws-shell:/home/aws \
#     --rm \
#     -ti \
#     --entrypoint="" \
#     awscli \
#     aws-shell

FROM alpine
ENV AWSUSER aws
ENV MAINTAINER "VS <github@roundside.com>"

RUN apk update && apk upgrade && apk --no-cache add ca-certificates \
           groff less \
           python py2-pip \
           && pip install awscli aws-shell \
           && adduser ${AWSUSER} -S -s /bin/sh \
           && su ${AWSUSER} -c "mkdir -p /home/${AWSUSER}/.aws" \
           && { \
             echo '[default]'; \
             echo 'output = json'; \
             echo 'region = $AWS_DEFAULT_REGION'; \
             echo 'aws_access_key_id = $AMAZON_ACCESS_KEY_ID'; \
             echo 'aws_secret_access_key = $AMAZON_SECRET_ACCESS_KEY'; \
           } > /home/${AWSUSER}/.aws/config

USER $AWSUSER
ENTRYPOINT ["aws"]
