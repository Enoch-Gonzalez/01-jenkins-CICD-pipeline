# Jenkins Pipeline for Java Application

This project is a demonstration of setting up a Jenkins Pipeline for a Java application. It includes stages for building, testing, pushing Docker images, and deploying the application.

## Prerequisites

- Docker installed in your local.
- Docker Compose installed in your local.
- DockerHub account.
- VirtualBox .
- Please review the Gitlab system requirments (https://docs.gitlab.com/ee/install/requirements.html) for the Gitlab server used in this project.

## Jenkins Pipeline

The Jenkins pipeline is defined in the `jenkins/pipeline/Jenkinsfile`. It consists of the following stages:

1. **Build**: Compiles the Java application using Maven.
2. **Test**: Executes unit tests using Maven and generates a JUnit XML report.
3. **Push**: Pushes Docker images to a registry.
4. **Deploy**: Deploys the application to a virtual machine.

## Jenkins Configuration

The Jenkins instance is configured using the `Dockerfile` to install required tools such as Maven, Docker, Docker Compose, and Ansible.

## Docker Compose Configuration

The `docker-compose.yml` file defines services for Jenkins and a GitLab server.

## Post-receive Hook

The `post-receive` script is a Git hook used to trigger Jenkins builds automatically upon changes pushed to the master branch. A pipeline repository inside the gitlab server has to be created prior the following steps, let's name this "pipeline-maven".

This must be copied inside the git container:

1. Once the container is running get inside the git container:

´´´bash
docker exec -ti git-server bash
´´´

2. Move to the repository created

´´´bash
cd /var/opt/gitlab/git-data/repository/jenkins/pipeline-maven.git
´´´

3. Create a hook directory and move to it

´´´bash
mkdir custom_hook

cd custom_hook
´´´

4. Create a file named post-receive file and copy the content in it

´´´
vi post-receive
´´´

## Usage

To use this project:

1. Set up a Jenkins instance with Docker and Docker Compose installed.
2. Configure Jenkins with necessary credentials and plugins.
3. Create a pipeline job in Jenkins, pointing to the `Jenkinsfile` in this repository.
4. Configure webhook in your Git repository to trigger Jenkins builds on push events.

## Notes

- Make sure to customize scripts and configurations according to your environment and requirements.
- Ensure all necessary plugins and credentials are configured in your Jenkins instance, such as the DockerHub registry password, configure the Pipeline to be SCM so that it can be used wit hthe gitlab server.


