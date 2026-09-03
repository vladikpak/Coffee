#!/bin/bash
echo "🏥 Checking health..."
curl -s http://localhost:8080/actuator/health | python3 -m json.tool