FROM docker
#
RUN apk update && \
    apk upgrade && \
    apk add python \
            py-pip \
            groff \
            less \
            mailcap \
            git  \
            curl && \
#
    curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
#
    pip install --upgrade awscli==1.14.5 s3cmd==2.0.1 python-magic pip && \
#
    apk -v --purge del py-pip git curl && \
    rm /var/cache/apk/* && \
#
    ln -s /var/run/secret/aws /root/.aws
#

ADD amazon-ecr-credential-helper/bin/local/docker-credential-ecr-login /bin

ADD generate-docker-config.sh /etc/profile.d/generate-docker-config.sh

