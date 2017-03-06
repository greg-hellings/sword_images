# sword_modules
FROM fedora:latest

# TODO: Put the maintainer name in the image metadata
MAINTAINER Greg Hellings <greg.hellings@gmail.com>

# TODO: Set labels used in OpenShift to describe the builder image
LABEL io.k8s.description="SWORD images with pre-installed modules" \
      io.k8s.display-name="sword_modules" \
      io.openshift.tags="sword,modules,data-only" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

RUN dnf install -y epel-release \
	&& dnf install -y sword-utils \
	&& chown -R 1001:0 /usr/share/sword \
	&& dnf clean all -y

# TODO: Copy the S2I scripts to /usr/libexec/s2i, since openshift/base-centos7 image sets io.openshift.s2i.scripts-url label that way, or update that label
COPY ./s2i/bin/ /usr/libexec/s2i

# Execute code as the SWORD user, created in the base SWORD image
WORKDIR /usr/share/sword
USER 1001

# TODO: Set the default port for applications built using this image
# EXPOSE 8080

CMD ["usage"]
