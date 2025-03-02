## Start Failed
Solução:
1. Precisamos remover o arquivo .lock que impede a inicialização do Launcher. **Execute** no terminal:
```bash
    sudo rm /home/morim/.var/app/com.jetbrains.IntelliJ-IDEA-Ultimate/config/JetBrains/IntelliJIdea2024.3/.lock

   ```
2. O Erro deverá desaparecer ao tentar abrir novamente o intellij.