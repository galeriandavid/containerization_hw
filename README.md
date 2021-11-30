# StarSpace docker

In order to build StarSpace docker image on Linux, use the following:

```sh
git clone https://github.com/galeriandavid/containerization_hw.git
cd containerization_hw
docker build -t starspace --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g) .
```

Run container using the follow:

```sh
docker run -it --rm --mount "type=bind,src=$(pwd)/volume,dst=/Starspace/volume" starspace
```

In order process start space input file, use the follow:

```sh
./starspace train -trainFile ./volume/starspace_input_file.txt -model ./volume/modelSaveFile
```

Result will appear in ***volume*** directory

If you want to process your own file, put it in ***volume*** directory and use the previous command replacing starspace_input_file.txt with your file name

