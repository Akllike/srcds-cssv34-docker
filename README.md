# Image for Counter-Strike: Source v34

This image for running a Counter-Strike: Source v34 game server. The server runs inside a screen session, making it easy to manage and connect to the server console when needed.

Link to the Docker Hub image - https://hub.docker.com/r/phenom1337/cssold_srcds_cssv34
- :latest image - [phenom1337/cssold_srcds_cssv34:latest](https://hub.docker.com/layers/phenom1337/cssold_srcds_cssv34/latest/images/sha256-9bfe93a539fb504afa6939c650d75bca7a6969c67805d28e491990d5f7471cb2?tab=layers)
- :ru Russian Locale image - [phenom1337/cssold_srcds_cssv34:ru](https://hub.docker.com/layers/phenom1337/cssold_srcds_cssv34/ru/images/sha256-a8884e84b5e7be8ad7dfdd10a4288071972fbdfe7874eed8863e6b4817e9605a)

## Features:
- Russian Localization Support: The server is configured to support the Russian language, including texts and messages.
- Using screen: The server runs inside a screen session, allowing easy access to its console and management.
- Optimized Image: A minimal base image with only the necessary dependencies for the server to run.
- Easy to Use: Ready-to-use commands for starting and stopping the server.

## How to Run
Create a ```docker-compose.yaml``` file with the following content:

```yaml
services:
  srcds-cssv34:
    image: phenom1337/cssold_srcds_cssv34:latest
    restart: unless-stopped
    deploy:
      resources:
        limits:
          cpus: '1.0'
          memory: 2048M
    ports:
      - "27015:27015"
      - "27015:27015/udp"
    volumes:
      - ./server:/home/container
    command: >
      sh -c "screen -A -m -d -S srv ./srcds_run -game cstrike +map de_dust2 -ip 0.0.0.0 -port 27015 +tv_port 27016 -maxplayers 13 +sv_pure 2 -insecure -debug -condebug -localcser -nomaster -tickrate 100 -fps_max 500 -usercon;
      while true; do sleep 1; done"
```

## Start the server using Docker Compose:

```bash
docker-compose up -d
```

## Access the server:
- Connect to the server using the game client at ```your-server-ip:27015```.
- Server logs and configurations are stored in the ```./server``` directory on your host machine.

## Stop the server:

```bash
docker-compose down
```
## Configuration Details

- Ports:
    - ```27015```: The server listens on this port for both TCP and UDP traffic.

- Volumes:
    - ```./server:/home/container```: Maps the ```./server``` directory on your host to the container's working directory for persistent storage.

- Resource Limits:
    - CPU: Limited to 1 core.
    - Memory: Limited to 2048 MB.

- Command:
    The server runs inside a ```screen``` session for easy management.

- Key server parameters:
    - ```+map de_dust2```: Starts the server with the de_dust2 map.
    - ```-maxplayers 13```: Sets the maximum number of players to 13.
    - ```-tickrate 100```: Sets the server tickrate to 100.
    - ```-fps_max 500```: Limits the server FPS to 500.
    - ```-insecure```: Disables VAC (Valve Anti-Cheat) for compatibility with certain mods.
    - ```-nomaster```: Prevents the server from appearing in the public server list.

## Customization

Change the Map: Replace ```de_dust2``` with another map in the ```command``` section.
Adjust Player Limit: Modify the ```-maxplayers``` value.
Modify Server Configuration: Edit the files in the ```./server``` directory after the first run.

## Notes
Ensure Docker and Docker Compose are installed on your system.
Replace your-server-ip with the actual IP address of your server.
For advanced configurations, refer to the [Counter-Strike: Source documentation](https://developer.valvesoftware.com/wiki/Counter-Strike:_Source).

This setup provides a simple and efficient way to run a Counter-Strike: Source v34 server with Docker. Enjoy your gaming experience! 🎮
