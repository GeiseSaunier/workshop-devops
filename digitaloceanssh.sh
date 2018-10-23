sshpass  -p $1 ssh -o StrictHostKeyChecking=no root@$2 <<-'ENDSSH'   
    cd project/docker/
    docker-compose down
    docker rmi $(docker images -q) -f
    docker network prune -f
    docker-compose up -d
ENDSSH