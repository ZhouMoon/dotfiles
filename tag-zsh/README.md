# 安装
---
## oh-my-zsh
- https://github.com/ohmyzsh/ohmyzsh
- curl
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- wget
```
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
- fetch
```
sh -c "$(fetch -o - https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## 插件
- zsh-autosuggestions 它会根据历史记录和完成情况在您键入时建议命令
- https://github.com/zsh-users/zsh-autosuggestions
- oh-my-zsh 安装
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```
- zsh-syntax-highlighting 语法突出显示。 
- https://github.com/zsh-users/zsh-syntax-highlighting
- oh-my-zsh 安装
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```
- Powerlevel10k 主题
- https://github.com/romkatv/powerlevel10k
- oh-my-zsh 安装
GitHub
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
Gitee
```
git clone --depth=1 https://gitee.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```
