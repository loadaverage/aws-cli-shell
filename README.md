# aws-cli-shell
[Aws-shell](https://github.com/awslabs/aws-shell) and [aws-cli](https://github.com/aws/aws-cli) in one Docker image

---

#### howto:

>run aws-cli with mounted Docker volume:

```bash
docker run \
 -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
 -e AWS_DEFAULT_OUTPUT=$AWS_DEFAULT_OUTPUT \
 -e AWS_ACCESS_KEY_ID=$AMAZON_ACCESS_KEY_ID \
 -e AWS_SECRET_ACCESS_KEY=$AMAZON_SECRET_ACCESS_KEY \
 -v aws-cli:/home/aws \
 --rm \
 -ti \
 awscli
```
  

> run aws-shell with mounted Docker volume:

```bash
docker run \
 -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
 -e AWS_DEFAULT_OUTPUT=$AWS_DEFAULT_OUTPUT \
 -e AWS_ACCESS_KEY_ID=$AMAZON_ACCESS_KEY_ID \
 -e AWS_SECRET_ACCESS_KEY=$AMAZON_SECRET_ACCESS_KEY \
 -v aws-shell:/home/aws \
 --rm \
 -ti \
 --entrypoint="" \
 awscli \
 aws-shell
```
