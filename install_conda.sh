mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.12.0-MacOSX-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init bash

# set up the base environment
conda install -n base mamba

# set up jupyterlab 3 env
conda create -n jlab jupyterlab=3 nb_conda_kernel ipywidgets

# set up ML env
conda create -n ml python=3.7 ipykernel 
conda install -n ml numpy scipy pandas scikit-learn
conda install -n ml matplotlib seaborn
