workflows=(quick-face youdao-translator launcher)
workflows_dir=$PWD 

cd ~/Library/Application\ Support/Alfred\ 3/Alfred.alfredpreferences/workflows
for workflow in ${workflows[@]}
do
  ln -s ${workflows_dir}/${workflow}
done

