#!/bin/bash
echo "🔨 Building Coffee Application..."
./mvnw clean package -DskipTests
echo "✅ Build complete!"