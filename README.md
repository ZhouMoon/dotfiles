My dotfiles 
[TOC]
---
###  安装RCM
- [GitHub](https://github.com/thoughtbot/rcm)
- [Gitee](https://gitee.com/mirrors/rcm)
  - 例 Ubuntu
  ```
  sudo apt install rcm
  ```
### 常用命令
#### lsrc
**列出当前所有通过 rcm 管理的 dotfile ，以及其对应的符号链接位置**
`lsrc [-FhqVv] [-B HOSTNAME] [-d DIR] [-I EXCL_PAT] [-S EXCL_PAT] [-s EXCL_PAT] [-t TAG] [-U EXCL_PAT] [-u EXCL_PAT] [-x EXCL_PAT] [files ...]`

#### mkrc
将指定的 dotfile 移动至集中存储目录(默认 `~/.dotfiles`)，并在原下创建相应的软链接
`mkrc [-ChoqSsVvUu] [-t TAG] [-d DIR] [-B HOSTNAME] files ...`

#### rcup
更新或创建由 rcm 管理的 dotfile 的软链接
`rcup [-CfhiKkqVv] [-B HOSTNAME] [-d DIR] [-g] [-I EXCL_PAT] [-S EXCL_PAT] [-s EXCL_PAT] [-t TAG] [-U EXCL_PAT] [-u EXCL_PAT] [-x EXCL_PAT] [files ...]`

#### rcdn
删除通过 rcm 创建的 dotfile 的软链接
`rcdn [-hKkqVv] [-B HOSTNAME] [-d DIR] [-I EXCL_PAT] [-S EXCL_PAT] [-s EXCL_PAT] [-t TAG] [-U EXCL_PAT] [-u EXCL_PAT] [-x EXCL_PAT] [files ...]`

#### 命令参数含义
*   `-B HOSTNAME`: 指定特定主机的目录,而不是使用计算机的主机名对其进行操作。
*   `-C`: 复制文件而不是创建软链接。
*   `-d DIR`: 指定 dotfiles 目录，可以指定多个。
*   `-F`: 在文件旁显示指示符号，`@` (文件软链接) ，`$` (目录软链接)，`x`(副本文件)。更多详细信息参考 rcrc 中的 `COPY_ALWAYS` 和 `SYMLINK_DIRS` 。
*   `-f`: 如果rc文件已经存在于配置目录中，但与 dotfiles 目录中的文件不匹配，删除rc文件，然后创建软链接。
*   `-g`: 仅显示 `rcup` 命令脚本的执行过程，不会修改文件系统上的任何内容。
*   `-h`: 显示用法说明
*   `-I EXCL_PAT`: 指定不被 `-x` 排除的文件。 该项在 `-x` 选项之后应用,使用与 `-x` 相同的语法格式。可能需要用引号使其不被 Shell 忽略。更多详细信息参考 `EXCLUDE PATTERN`。
*   `-i`: 如果rc文件已经存在于配置目录中，但是与dotfiles目录中的文件不匹配，提示如何处理它。这是默认选项。
*   `-K`: 跳过 pre-hooks 和 post-hooks
*   `-k`: 运行 pre-hooks 和 post-hooks , 这是默认选项。
*   `-o`: 将 dotfiles 安装到主机特定的目录中。
*   `-q`: 减少详细信息。更多详细信息参考 `DIRECTORY LAYOUT`。
*   `-S EXCL_PAT`: 指定以软链接形式创建的目录。此选项可重复使用，需要用引号使其不被 Shell 忽略。更多详细信息参考 `EXCLUDE PATTERN`。
*   `-s EXCL_PAT`: 指定递归创建的目录而不是软链接式的目录。与 `-S` 选项相反，可用于撤消它或 `rcrc` 中的 `SYMLINK_DIRS` 设置。 此选项可重复使用，需要用引号使其不被 Shell 忽略。更多详细信息参考 `EXCLUDE PATTERN`。
*   `-t TAG`: 指定标签
*   `-U EXCLUDE`: 指定不创建软链接和以点 (`.`) 开头命名的rc文件或目录。此选项可重复使用，需要用引号使其不被 Shell 忽略。更多详细信息参考 `EXCLUDE PATTERN`。
*   `-u EXCL_PAT`: 指定必须使用点 (`.`) 开头命名的 rc 文件或目录。 与 `-U` 选项相反，可用于撤消它或 rcrc 中 `UNDOTTED` 设置。 此选项可重复使用，需要用引号使其不被 Shell 忽略。更多详细信息参考 `EXCLUDE PATTERN`。
*   `-V`: 显示版本号。
*   `-v`: 添加详细信息。 可以重复此操作以获取更多的详细信息。
*   `-x EXCL_PAT`: 指定排除的文件。此选项可重复使用，需要用引号使其不被 Shell 忽略。更多详细信息参考 `EXCLUDE PATTERN`。
*   `files ...`: 指定的文件列表。
### 配置
####  ~/.rcrc
可以使用主目录中的 `.rcrc` 文件配置rcm dotfile 管理器。 可通过设置 `RCRC` 环境变量来更改此位置。

支持以下变量:
*   `COPY_ALWAYS`: 复制列表中的glob相匹配的文件，而非使用软链接。
*   `DOTFILES_DIRS`: dotfile 的源目录。列表中的第一个将被 `mkrc` 用于创建 `dotfile` 目录，默认值为: `~/.dotfiles` 。
*   `EXCLUDES`: 排除列表。
*   `HOSTNAME`: 计算机的主机名。 通常通过 `hostname` 命令获得，但此命令并非标准的，获取的主机名或许会有差异，因此使用 `HOSTNAME` 变量强制使用已知的主机名。
*   `TAGS`: 默认标签表。
*   `SYMLINK_DIRS`: 列表中目录是软链接，而不是源文件。
*   `UNDOTTED`: 列表中的文件是软链接且不用点 (`.`) 开头命名。如果是 `SYMLINK_DIRS` 中含有的目录，则该目录将为软链接且不用点 (`.`) 开头命名。

**`.rcrc` 样例**:
```Text
COPY_ALWAYS="ssh/id_* weechat/* netrc"
COPY_ALWAYS="*"
DOTFILES_DIRS="/home/mike/.dotfiles /usr/share/dotfiles"
EXCLUDES="irbrc *:*emacs* dotfiles:python*"
HOSTNAME="ubutu-22"
TAGS="freebsd development email git laptop gmail notmuch"
SYMLINK_DIRS="zprezto texmf"
UNDOTTED="texmf"

```

####  EXCLUDE PATTERN (排除列表)
使用冒号 (`:`) 分隔 dotfile 目录和 glob (由普通字符、通配字符组成的字符串，用于匹配文件路径) 。可选择带 dotfile 目录，如果省略则默认为 `*` ，代表从所有 dotfile 目录匹配。 glob 是相对于 dotfile 目录的相对路径。

例如，要忽略 `Thoughtbot-dotfiles` 目录中所有与 `emacs` 相关的项目，使用：

`thoughtbot-dotfiles:*emacs*`


要忽略所有 `bash_profile` 文件使用：
`*:bash_profile`
或者简写为:
`bash_profile`

注意,通常通过 `hostname` 命令获得主机名，但此命令并非标准的，获取的主机名或许会有差异，在macOS上，主机名是不可预测的，甚至可能在 `DHCP` 握手被更改,强烈建议在 `rcrc` 中,因此使用 `HOSTNAME` 变量强制使用已知的主机名。

#### DIRECTORY LAYOUT (目录布局)

dotfiles 目录下的任何非点 (`.`) 开头的、非元文件或目录都将作为点 (`.`) 开头的文件安装。 例如，`.dotfiles/zshrc` 将安装到 `~/.zshrc` 。 文件安装为软链接。 目录通过建立目录来安装。`-C` 选项指定文件通过复制安装而不是软链接。 `rcrc` 中的 `COPY_ALWAYS` 可用于列出只能复制的文件。

支持三个元文件: host-specific (特定主机文件), tagged (标记文件), hooks 。

*   `host-specific`: 以 `host-` 前缀加主机名命名的目录，存放特定主机的文件，如，`.dotfiles/host-scarlett` 包含主机名为 scarlett 的计算机 dotfile 文件，且这些文件将仅安装在主机名为scarlett的计算机上。
*   `tagged`: 以 `tag-` 前缀加标签名命名的目录，存放标记该标签的文件，如，仅在指定使用 `git` 标签时安装 `.dotfiles/tag-git` 下的文件。
*   `hooks`: 名为hooks的目录，存放 hooks 。 rcup 支持两个hooks：`pre-up` 和 `post-up` 。它们存放到预设文件名的文件或目录中：`.dotfiles/hooks/pre-up` 和 `.dotfiles/hooks/post-up` ，或 `.dotfiles/hooks/pre-up/*` 和 `.dotfiles/hooks/post-up/*` 。 这些文件必须是可执行文件。 它们在每次 `rcup` 运行时都运行，因此必须是幂等(执行后结果还为本身)的。hooks 按字母顺序排序,一次只执行一次。 如，`hooks/pre-up/animals` 将在 `hooks / pre-up/aquariums` 之前运行，`hooks/pre-up/4-eyes` 将在 `hooks/post-up/2-u-nothing-compares` 之前运行。

### 日常使用
```Text
# 创建管理(管理.vimrc配置)
mkrc .vimrc 

# 打标签方式创建管理
mkrc -t git xxx

# 安装 dotfiles 中的 dotfile 文件
rcup

# 安装指定标签的 dotfile 文件
rcup -t git

# 安装指定标签的 dotfile 文件，并显示过程
rcup -t git -v

# 查询被管理的 dotfile 文件
lsrc

# 查询指定标签的 dotfile 文件
lsrc -t git

# 查询指定 dotfiles 中的 dotfile 文件
lsrc -d ~/.dotfiles


# 取消指定标签的安装，并显示过程
rcdn -t git -v

```