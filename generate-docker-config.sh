mkdir -p /root/.docker

cat << EOF > /root/.docker/config.json

{
        "credHelpers": {
                "${hub_endpoint}": "ecr-login"
        }
}
 
EOF

