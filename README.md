# Zec.rocks Configurations

This repository holds the configurations for the Helm releases and HAProxy load balancer containers that Zec.rocks hosts on Fly.io.

## Zec.rocks Architecture Overview

### Edge (Fly.io)

Requests are routed to Fly's closest edge reason. Fly internally routes these requests to our containers on their platform, the closest to the requesting user. We host containers on Fly in each city where we have Kubernetes backend clusters. The containers are running, HAProxy which receives inbound user requests and routes them to healthy Kubernetes clusters on the backend.

### Backend

Kubernetes on Vultr Kubernetes Engine and dedicated hardware (k3s). Lightwalletd communicates to Zebra inside each Kubernetes cluster. The cluster receives inbound requests from HAProxy on a Kubernetes load balanced service (an SSL URL managed by Traefik within the cluster), which uses LetsEncrypt to generate certificates.

