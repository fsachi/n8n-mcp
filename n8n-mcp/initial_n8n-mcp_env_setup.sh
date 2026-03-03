#!/bin/bash
echo "AUTH_TOKEN=$(openssl rand -base64 32)" > .env