# Sophon simple node

## Setup and run

```bash
git clone https://github.com/coinblitz-pro/sophon-sn
cd sophon-sn
./manage start
```

## Images

By default, the image `lagunovsky/sophon-sn` is used. You can build your own image from the source code using the command `./manage build`, or use the original image `sophonhub/sophon-light-node` (in this case, you will need to specify `SOPHON_SN_PUBLIC_DOMAIN` in the `.env` file).

## Available commands

| Command            | Description                                                          |
|--------------------|----------------------------------------------------------------------|
| `./manage start`   | Start a node                                                         |
| `./manage stop`    | Stop the node                                                        |
| `./manage restart` | Restart the node                                                     |
| `./manage logs`    | Show logs of the node                                                |
| `./manage prepare` | Prepare an environment for running node (install dependencies, etc.) |
| `./manage build`   | Build the Docker images                                              |
| `./manage reset`   | Reset the node                                                       |


