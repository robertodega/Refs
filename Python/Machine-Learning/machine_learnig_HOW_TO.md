
#   Installation Checklist

- Doqnload & Install Anaconda

        https://www.anaconda.com/download

        bash Anaconda3-2024.10-1-Linux-x86_64.sh
        eval "$(/home/roby/anaconda3/bin/conda shell.bash hook)"
        conda init
        conda activate
        
        conda install pydotplus
        conda install tensorflow

  - if error try:

        pip install tensorflow

  - if error again:

        conda create -n tf tensorflow pydotplus jupiter
        conda activate tf

- download course material from

        https://sundog-education.com/machine-learnig/

- prompt to course folder

        cd /opt/lampp/htdocs/WWW/PROJECTS/Python/Machine-Learning/Course/MLCourse

- open jupyter navigation and click on desired interactive environment

        jupyter notebook
        - Outliers.ipynb to test installation           => Shift+Enter to test results dinamycal update
        - Python101.ipynb to test Python scripts


- Anaconda Visula mode Run

        anaconda-navigator

