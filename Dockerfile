# -----------------------------
# Stage 1: Build Stage
# -----------------------------
FROM node:22-alpine AS builder

# Set working directory
WORKDIR /app

#Install Yarn globally if not included in the base image
RUN apk add --no-cache yarn

# Install dependencies
COPY package*.json ./
RUN yarn install

# Copy source code
COPY . .

# Build the application
RUN yarn run build


# # Copy only necessary files from builder
# COPY --from=builder /app/package*.json ./
# RUN npm ci --omit=dev

# COPY --from=builder /app/dist ./dist

# Expose application port
EXPOSE 3009

# Start the application
CMD ["npm", "run", "start:prod"]