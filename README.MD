YOU MUST HAVE DOCKER
-
-

This repository provides an easy way to launch and configure `code-server` (a web-based IDE) using Docker. Follow the instructions below to clone the repository, run the script, and access `code-server` on your local machine.
-

- Docker installed on your machine
- A terminal/command-line interface

## Steps to Get Started

### 1. Clone the Repository

To clone the repository, run the following command in your terminal:

```bash
git clone https://github.com/wsp-123/code-server-starter.git
````

### 2. Navigate to the Project Directory

After cloning the repository, navigate into the project directory:

```bash
cd code-server-starter
```

### 3. Make the Bash Script Executable

Make the provided script executable by running the following command:

```bash
chmod +x run_code_server.sh
```

### 4. Run the Script

Now, run the script to pull the latest Docker image for `code-server` and start the container on port `8080`:

```bash
./run_code_server.sh
```

### 5. Access code-server

Once the script has completed, open your browser and go to:

```
http://localhost:8080
```

You will be prompted for a password to access the IDE.

### 6. Retrieve the Password

* The script will display the password directly if it is successfully retrieved.
* If the password is not shown, the script will provide instructions on how to manually find it in the Docker container's `config.yaml` file.

To retrieve the password manually, you can run:

```bash
cat /var/lib/docker/overlay2/$(docker inspect --format '{{.GraphDriver.Data.LowerDir}}' tender_dhawan | cut -d/ -f4-)/merged/home/coder/.config/code-server/config.yaml
```

If you encounter any issues, the above command will provide the password for accessing `code-server`.

## Troubleshooting

* If `code-server` is not starting, ensure that Docker is running and the image has been pulled correctly.
* If you can't access the web interface, make sure that port `8080` is not being blocked by any firewall or other services.

### Breakdown:
- **Cloning & Setup Instructions**: Clear step-by-step guidance for users.
- **Running the Bash Script**: Shows how to execute the setup.
- **Password Retrieval**: Provides a fallback for when the password isn’t shown directly.
- **Troubleshooting**: Offers support for common issues.
```
