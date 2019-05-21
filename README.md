# dojo

Scripts/configuration for repeatably running [jupyter/scipy notebooks](https://hub.docker.com/r/jupyter/scipy-notebook) locally. I originally built out a bigger Docker image scaffold for doing light data work using raw pip so as not to wind up with a cocked-up local machine, then recycled the scripts later when I gave up and migrated everything to anaconda, somewhat defeating the purpose. Finally, I realized I coudl do _even less work_ by just using the official jupyter/scipy notebook image and customizing it a bit. 

At this point, there are only three differences:
1. The `WORKDIR` is set to a project-specific directory mapped to a Docker Volume created by `./setup` and attached by `./run`. This means that you can run the notebook, save to the working dir, kill the notebook's container, bring it up again with `./run`, and your notebook [source] won't be lost
1. `/data` is mapped the local user's `$HOME/data` directory. I keep a lot of datasets here on my machine
1. `./run` emits the URL/token for Jupyte notebook's auth

# Setup

## 1. Update `env-vars`

Earlier versions optionally pushed to Docker Hub (which is why I specify user name and image name), but I didn't wind up using this feature much, so it didn't make the migration. This basically just defines the Docker Volume name and the user/image tag.

## 2. Run `./setup`

This ensures the Docker Volume is set up, the `/data` target exists locally, and then builds and tags the image.

## 3. Run `./run`

This starts a container, attaches it to port `8888` locally, then gets the URL (with auth token) of the now-running container. The container is set up with `--rm`, so you can just kill it without leaving detritus around in a stopped state. The Docker Volume ensures your notebooks aren't lost.
