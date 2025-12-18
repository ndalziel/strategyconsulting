# Use Ruby slim (Debian-based) to avoid Alpine musl issues
FROM ruby:3.1-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    nodejs npm \
    build-essential \
    git \
    curl \
  && rm -rf /var/lib/apt/lists/*

# Set working directory inside container
WORKDIR /srv/jekyll

# Copy Gemfile and install gems
COPY Gemfile .
RUN gem install bundler:2.3.25
RUN bundle install

# Copy the rest of the project
COPY . .

# Install Node dependencies (Sass)
RUN npm install

# Expose Jekyll port
EXPOSE 4000

# Default command: serve Jekyll + watch for Sass changes
CMD ["sh", "-c", "bundle exec jekyll serve --watch --force_polling --host 0.0.0.0 & npm run sass-dev"]


