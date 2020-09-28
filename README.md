# OpenShift 4.x Node Certification automatic-approval-helper
1. Build Image (recommended to use prebuilt image https://catalog.redhat.com/software/containers/openshift4/ose-cli/5cd9ba3f5a13467289f4d51d?container-tabs=gti)

```
cd ocp4-automatic-approval-helper
sudo buildah bud --format=docker -t nf-registry.com:9066/redhat/oclientubi8 .
sudo podman push  nf-registry.com:9066/redhat/oclientubi8

```

2. Create a OpenShift cronjob

At this stage where we have:
* Image
* ConfigMap

We now can defined the cronjob, this YAML defined a job that will run once per 30 minutes:

```
cd ocp4-automatic-approval-helper
oc new-project serving-cert-approver
oc create configmap script --from-file=approver.sh
oc project serving-cert-approver
oc create -f deploy-cert-approval-cronjob.yaml
```
reference： Aizuddin
