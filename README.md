# dotfiles

### 安装RCM
- https://github.com/thoughtbot/rcm
- 例 Ubuntu
```
sudo apt update
sudo apt install rcm
```
### 常用命令
- rcup: 还原配置
- rcdn: 与rcup相反
- mkrc: 将配置文件交由RCM管理,支持标签
  - 例：mkrc -t zsh .zshrc  标签为zsh 配置文件.zshrc
- lsrc: 显示所有符号连接的到位置

