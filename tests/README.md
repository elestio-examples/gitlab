<a href="https://elest.io">
  <img src="https://elest.io/images/elestio.svg" alt="elest.io" width="150" height="75">
</a>

[![Discord](https://img.shields.io/static/v1.svg?logo=discord&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=Discord&message=community)](https://discord.gg/4T4JGaMYrD "Get instant assistance and engage in live discussions with both the community and team through our chat feature.")
[![Elestio examples](https://img.shields.io/static/v1.svg?logo=github&color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=github&message=open%20source)](https://github.com/elestio-examples "Access the source code for all our repositories by viewing them.")
[![Blog](https://img.shields.io/static/v1.svg?color=f78A38&labelColor=083468&logoColor=ffffff&style=for-the-badge&label=elest.io&message=Blog)](https://blog.elest.io "Latest news about elestio, open source software, and DevOps techniques.")

# Gitlab, verified and packaged by Elestio

[Gitlab](https://github.com/gitlabhq/gitlabhq) an Open Source code repository and collaborative software development platform.

<img src="https://github.com/elestio-examples/gitlab/raw/main/gitlab.png" alt="gitlab" width="800">

Deploy a <a target="_blank" href="https://elest.io/open-source/gitlab">fully managed Gitlab</a> on <a target="_blank" href="https://elest.io/">elest.io</a> Create your own online database without technical experience. This user-friendly no-code tool gives you the powers of a developer without leaving your browser.

[![deploy](https://github.com/elestio-examples/gitlab/raw/main/deploy-on-elestio.png)](https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/gitlab)

# Why use Elestio images?

- Elestio stays in sync with updates from the original source and quickly releases new versions of this image through our automated processes.
- Elestio images provide timely access to the most recent bug fixes and features.
- Our team performs quality control checks to ensure the products we release meet our high standards.

# Usage

## Git clone

You can deploy it easily with the following command:

    git clone https://github.com/elestio-examples/gitlab.git

Copy the .env file from tests folder to the project directory

    cp ./tests/.env ./.env

Edit the .env file with your own values.

Run the project with the following command

    docker-compose up -d

You can access the Web UI at: `http://your-domain:8080`

## Docker-compose

Here are some example snippets to help you get started creating a container.
version: "2.3"

    services:
    gitlab:
        container_name: gitlab
        image: gitlab/gitlab-ce:latest
        environment:
        GITLAB_OMNIBUS_CONFIG: |
        external_url 'https://DOMAIN';
        nginx['redirect_http_to_https'] = false;
        nginx['listen_https'] = false;
        nginx['listen_port'] = 80;
        gitlab_rails['gitlab_shell_ssh_port'] = 22022;
        gitlab_rails['initial_root_password'] = '[APP_PASSWORD]';
        gitlab_rails['smtp_enable'] = true;
        gitlab_rails['smtp_address'] = '172.17.0.1';
        gitlab_rails['smtp_port'] = 25;
        gitlab_rails['smtp_domain'] = '[DOMAIN]';
        gitlab_rails['smtp_tls'] = false;
        gitlab_rails['smtp_openssl_verify_mode'] = 'none';
        gitlab_rails['smtp_enable_starttls_auto'] = false;
        gitlab_rails['smtp_ssl'] = false;
        gitlab_rails['smtp_force_ssl'] = false;
        gitlab_rails['gitlab_email_from'] = '[DOMAIN]@vm.elestio.app';
        gitlab_rails['gitlab_email_reply_to'] = '[DOMAIN]@vm.elestio.app';
        gitlab_rails['gitlab_signup_enabled'] = false
        volumes:
        - ./config:/etc/gitlab
        - ./logs:/var/log/gitlab
        - ./data:/var/opt/gitlab
        restart: always
        ports:
        - "172.17.0.1:8080:80"
        - "22022:22"

# Maintenance

## Logging

The Elestio Gitlab Docker image sends the container logs to stdout. To view the logs, you can use the following command:

    docker-compose logs -f

To stop the stack you can use the following command:

    docker-compose down

## Backup and Restore with Docker Compose

To make backup and restore operations easier, we are using folder volume mounts. You can simply stop your stack with docker-compose down, then backup all the files and subfolders in the folder near the docker-compose.yml file.

Creating a ZIP Archive
For example, if you want to create a ZIP archive, navigate to the folder where you have your docker-compose.yml file and use this command:

    zip -r myarchive.zip .

Restoring from ZIP Archive
To restore from a ZIP archive, unzip the archive into the original folder using the following command:

    unzip myarchive.zip -d /path/to/original/folder

Starting Your Stack
Once your backup is complete, you can start your stack again with the following command:

    docker-compose up -d

That's it! With these simple steps, you can easily backup and restore your data volumes using Docker Compose.

# Links

- <a target="_blank" href="https://github.com/gitlabhq/gitlabhq">Gitlab Github repository</a>

- <a target="_blank" href="https://docs.gitlab.com/">Gitlab documentation</a>

- <a target="_blank" href="https://github.com/elestio-examples/gitlab">Elestio/Gitlab Github repository</a>
