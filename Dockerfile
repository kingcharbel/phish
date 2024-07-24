# Use an official Golang runtime as a parent image
FROM golang:alpine

# Set the working directory
WORKDIR /go/src/app

# Download GoPhish
RUN wget https://github.com/gophish/gophish/releases/download/v0.11.0/gophish-v0.11.0-linux-64bit.zip && \
    unzip gophish-v0.11.0-linux-64bit.zip -d /go/src/app && \
    rm gophish-v0.11.0-linux-64bit.zip

# Expose the ports GoPhish uses
EXPOSE 3333 80

# Run GoPhish
CMD ["./gophish"]
