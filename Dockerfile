FROM progrium/busybox
MAINTAINER Christian Lück <christian@lueck.tv>
RUN opkg-install openssh-client
EXPOSE 18083 3389 3390 3391
ADD run.sh /
ENTRYPOINT ["sh", "/run.sh"]