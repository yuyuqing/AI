
//conda command tutorials begin
//-----------------------------------------------------------------------------------------------

conda config --set auto_activate_base false

conda env list
conda info --env

conda env remove d2l-zh
conda create -n -y d2l-zh python=3.8 pip
conda activate d2l-zh

pip install jupyter d2l torch torchvision


wget https://zh-v2.d2l.ai/d2l-zh.zip
unzip d2l-zh.zip
jupyter notebook

//-----------------------------------------------------------------------------------------------
//conda command tutorials end


//git command tutorials begin
//-----------------------------------------------------------------------------------------------

git config --global user.name "Your Name"
git config --global user.email "email@example.com"

mkdir xxx
cd xxx
git init

git add file_xxx
git commit -m "Wrote or Updated a file"

git status
git diff file_xxx

git log --pretty=oneline
git reset --hard HEAD^
git reset --hard xxxx
git reset --hadr HEAD~num
git reflog

git checkout -- file_xxx
git rm file_xxx

git remote add Origin-AI git@github.com:yuyuqing/AI.git
git push -u Origin-AI master
git push Origin-AI master
git remote -v

//-----------------------------------------------------------------------------------------------
//git command tutorials end

