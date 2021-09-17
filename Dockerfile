FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
ENV BUCKET_NAME None
ENV FOLDER_PATH None
RUN apt update && apt install -y s3fs && apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* var/tmp/* /build
CMD ["sh","-c","--", "/usr/bin/s3fs -o allow_other,iam_role=auto $BUCKET_NAME $FOLDER_PATH; while true; do sleep 60; echo 'Hello from s3fs'; done;"]
