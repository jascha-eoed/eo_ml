### Machine learning code challenge: Sybrand Jacobus (Jascha) Muller


I have included a dockerfile which, if you wish, you can build and run. The container will expose port 8888 after which a jupyter lab instance can be accessed through `http://localhost:8888`.
This will guarentee a seamless run and you would not have to change/create a new python environment.

This is the folder structure that I have used (since I use relative paths in the notebook)

/d/full/path/to/eo_ml/
- notebook (folder)
    - eoml_preds.zarr (THIS IS NOT IN THE GIT REPO)
    - eoml_response_croptypes.gpkg
    - eoml_task.ipynb
- Dockerfile
- requirements.txt
- full_env_requirements.txt
- README.md

In your cmd and, with docker installed on your PC, (either docker desktop for windows of docker for linux) follow these steps:
 - navigate to the folder containing the `Dockerfile` and `requirements.txt` (in this example the path would be `/d/full/path/to/eo_ml/`)
 - run `docker build -t ml_task .` - builds the docker image in local directory (in linux, make sure its `sudo docker`)
 - run `docker run --rm -p 8888:8888 -v /d/full/path/to/eo_ml/notebook:/app ml_task`
 - open any web browser and go to `http://localhost:8888`

If docker does not work, I have also included a full_env_reqiorements.txt file which details the exact environment used and the library versions.