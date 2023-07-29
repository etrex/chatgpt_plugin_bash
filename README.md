# chatgpt_plugin_bash

在一個有安裝 ruby 環境的電腦輸入以下指令即可啟動

```
rackup bash.ru
```

# 注意事項

- 在 ai-plugin.json 當中，所有的網址都是以 https://ngrok.etrex.tw/ 為開頭，所以在使用的時候，你必須修改 ai-plugin.json 讓網址指向你的 domain。

- 為了讓本機對外開放，必須把 localhost 對應到正確的網域，否則會出現錯誤，你可以使用類似 ngrok 的工具來達成這點。
