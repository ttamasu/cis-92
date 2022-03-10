FROM docker.io/ubuntu:20.04

RUN  apt update -y && DEBIAN_FRONTEND=noninateractive apt install -y python3-pip tzdata postgresql-client
RUN python3 -m pip install django psycopg2-binary

COPY app/mysite/ /app

ENV DJANGO_ADMIN_EMAIL=admn@example.com
ENV DJANGO_ADMIN_USERNAME=admn
ENV DJANGO_SUPERUSER_PASSWORD=admn

WORKDIR /app

ENTRYPOINT ["/bin/bash"]



CMD ["-c","./entrypoint.sh" ]