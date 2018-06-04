# Alfred Workflows

There are some workflows for alfred written by myself, in order to improve the work efficiency, for fun at the same time.

# Initialize

You can download them from directory `workflows`, double click the workflow then it will be imported into alfred automatically.

In the meanwhile, you can execute the shell script named `initialize.sh`, it will create some soft links into the alfred project, and all workflows can be used immediately.

```shell
./initialize.sh
```

I recommend the second way, because you can not only use the workflow, but also manage your code if you want to modify them.

# Workflow List

## Quick Face

When you are chatting with your friends, maybe you want to use some expressions to describe your feelings, use this workflow! With the help of the workflow, you can search private expressions as soon as possible.

### Search Face

Usage: `face smile`

Use the command on the top, it will list all the matching expressions accroding to your input, just choose your prefer, and click the enter key, the Preview app will be opened, copy the expression to your clipboard, all the process is automatic, then you can use `command + v` to paste the expression here and there.

### Add Path

Usage: `face-add example-folder-or-iamge-names`

If you use this workflow for the first time, it's necessary for you to add some images paths, it's a file-filter which built in by workflow, choose folders or image files, after that you can search them. You can also modify the file named `paths` in the working directory directly.

## iTerm.scpt

When you are using the combination of "iTerm + oh-my-zsh + tmux", maybe you want to replace the alfred's default terminal with "iTerm", choose the custom option, and then copy the content of file named "iTerm.scpt".

It's written by applescript, you can learn applescript's grammer and refer to the [document of "iTerm"](http://www.iterm2.com/documentation-scripting.html)

## Youdao Translator

> Use youdao api to translate

### Prepare

If you want to use this workflow to transalte quickly, you should register and apply for a service at youdao, [http://ai.youdao.com/index.s](http://ai.youdao.com/index.s), and then copy `config.template.json` to `config.json`, modify with your own `appKey`、`secretKey`.

### Usage

`yd hello` or `tr hello`

Choose the item which you want, click `enter` to copy to your clipboard.

## Launcher

> Open some files by certain program in alfred

Alfred provides a `open` command to open different files by macos softwares, such as use `Finder` to open folder and files, or `Preview` to open pdf.

But sometimes we want to open by certain programs, this workflow may help you.

In fact, it is achieved by a `file filter` and single shell command.

### Vimpdf

`vimpdf example.pdf`

Preview pdf files in vim mode, you should download the executable program named `Cocoa-mupdf`, you can find it in [https://github.com/dean-wong/Cocoa-mupdf](https://github.com/dean-wong/Cocoa-mupdf).

### SublimeText

`st alfred-workflows`

Open project in sublime text by alfred, at first, you should install sublime text on your machine, and then it will provide a command line `subl`, you can use it in a terminal. I just move it into a workflow.

`sta alfred-workflows`

Append file/folder to current sublime text window.
