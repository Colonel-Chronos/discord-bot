docker exec faasd cat /var/lib/faasd/secrets/basic-auth-password | faas-cli login -s -g http://0.0.0.0:8282  