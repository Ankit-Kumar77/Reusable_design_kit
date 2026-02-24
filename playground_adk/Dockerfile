# Stage 1: Build Phase
FROM debian:latest AS build-env

# Install Flutter dependencies
RUN apt-get update && apt-get install -y \
    curl git unzip xz-utils libglu1-mesa \
    python3 ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Clone Flutter
RUN git clone https://github.com/flutter/flutter.git /usr/local/flutter
ENV PATH="/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin:${PATH}"

# Switch to stable channel and Pin a specific version for reproducibility
RUN flutter channel stable && \
    flutter upgrade && \
    flutter doctor

# Set working directory
WORKDIR /app

# Copy both the main app and the local package dependency
# Note: This assumes the build context is the 'Internship' directory
COPY design_kit /design_kit
COPY playground_adk /app

# Change back to the app directory and get dependencies
RUN flutter pub get
RUN flutter build web --release

# Stage 2: Serve Phase
FROM nginx:alpine
COPY --from=build-env /app/build/web /usr/share/nginx/html
COPY playground_adk/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
