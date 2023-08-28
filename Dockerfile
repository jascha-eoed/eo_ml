# Use the gdal:ubuntu-small base image
FROM ghcr.io/osgeo/gdal:ubuntu-small-3.7.1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the container
COPY requirements.txt .

# Install Python dependencies from requirements.txt
RUN apt-get update && \
    apt-get install -y python3-pip

RUN pip3 install -r requirements.txt --trusted-host pypi.org --trusted-host files.pythonhosted.org

# Install Jupyter
RUN pip3 install jupyter

# Expose port for Jupyter Hub
EXPOSE 8888

# Create a folder for notebooks and map it to a host folder
# RUN mkdir /app/notebooks
# VOLUME ["/app/notebooks"]

# Start Jupyter Hub when the container is run
# ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser"]
ENTRYPOINT ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token="]





