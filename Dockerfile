FROM golang:1.20 AS builder

# Clone the repository
RUN apt-get update && apt-get install -y git \
    && git clone https://github.com/imgix/prometheus-am-executor.git

WORKDIR /go/prometheus-am-executor

# Build the Go application
RUN go build

FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates

WORKDIR /go/prometheus-am-executor

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl \
    && rm kubectl

# Copy the binary and default script
COPY --from=builder /go/prometheus-am-executor/prometheus-am-executor /usr/bin/

# Expose default port
#EXPOSE 8088

# Set the default entrypoint
#ENTRYPOINT ["/usr/bin/prometheus-am-executor"]

