# sword_modules
FROM greghellings/sword

# TODO: Put the maintainer name in the image metadata
MAINTAINER Greg Hellings <greg.hellings@gmail.com>

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="SWORD images with pre-installed modules" \
      io.k8s.display-name="sword_modules" \
      io.openshift.tags="sword,modules,data-only" \
      io.openshift.s2i.script-url="image:////usr/libexec/s2i"

RUN useradd -d /home/sword -s /bin/bash -u 1001 sword \
    chown -R 1001:1001 /usr/share/sword/

COPY install.sh /root/

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./s2i/bin/ /usr/libexec/s2i

# This default user is created in the openshift/base-centos7 image
USER 1001

# TODO: Set the default port for applications built using this image
# EXPOSE 8080

CMD ["usage"]
