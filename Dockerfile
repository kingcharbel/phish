# Use an official Golang runtime as a parent image
FROM golang:alpine

# Set the working directory
WORKDIR /go/src/app

# Download GoPhish
RUN wget https://github.com/gophish/gophish/releases/download/v0.11.0/gophish-v0.11.0-linux-64bit.zip && \
    unzip gophish-v0.11.0-linux-64bit.zip -d /go/src/app && \
    rm gophish-v0.11.0-linux-64bit.zip

# Ensure the GoPhish binary has execution permissions
RUN chmod +x /go/src/app/gophish

# Expose the ports GoPhish uses
EXPOSE 3333 80

# Add debug info to check environment and directory contents
RUN env
RUN ls -la /go/src/app

# Run GoPhish
CMD ["./gophish"]
