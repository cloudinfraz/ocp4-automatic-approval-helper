FROM registry.access.redhat.com/ubi8/ubi:latest
# specify the version string of the oc release, set in the buildconfig environment.
ENV OC_VERSION "4.5.6"

# install the oc client tools
ADD https://mirror.openshift.com/pub/openshift-v4/clients/ocp/$OC_VERSION/openshift-client-linux-$OC_VERSION.tar.gz /tmp/openshift-client-linux-$OC_VERSION.tar.gz
#ADD oc /usr/bin/
RUN tar -xzvf  /usr/bin/openshift-client-linux-$OC_VERSION.tar.gz  -C /usr/bin && \
    chmod +x /usr/bin/oc  && \
    rm -rf /tmp/openshift-client-linux-$OC_VERSION.tar.gz

USER 1001
