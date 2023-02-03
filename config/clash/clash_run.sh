echo "---设置代理---";
export https_proxy=http://127.0.0.1:19527 http_proxy=http://127.0.0.1:19527 all_proxy=socks5://127.0.0.1:19527;
echo "---启动---";
~/.config/clash/clash-linux-amd64-v1.13.0 > clash.log &
