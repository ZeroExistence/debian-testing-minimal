# debian-testing-minimal
This repository is used to create a minimal live build of Debian Testing/Bullseye. The main purpose of this is to quickly test some package installations and some complex hooks during build stage. This will reduce the build time, instead of directly testing on the larger builds.

# Specification:
- Debian Version: Testing/Bullseye with Unstable Repository
- Desktop Environment: None
- Build: Minimal (disabled installation of additional packages recommended by apt, disabled apt indices, no memtest)
- Included Packages: usertools, sudo
- Persistence: Not set
- Estimated Image Size: ~300MB
- Apt Support: Supports https apt repositories (with installed apt-transport-https and ca-certificates)

# Building
1. The image will be built by using container. Use the Dockerfile to generate a container for live build. Buildah is used in creating the container image.
```
buildah bud -f Dockerfile -t debian-testing-minimal .
```
2. Run the container using podman. The container needs privilaged access to the host system. You also need to use persistent storage for the image file, with exec,dev flags.
```
podman run -ti --privileged --name debian-testing-minimal -v vdebian:/app:exec,dev debian-testing-minimal
```
3. Go to /app directory. Clone this repository, and go inside the repository's directory.
```
cd /app;
git clone https://github.com/ZeroExistence/debian-testing-minimal.git;
cd debian-testing-minimal
```
4. Add your custom configurations.
5. Run the live build command.
```
lb build
```
