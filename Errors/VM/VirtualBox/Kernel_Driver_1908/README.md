## Kernel driver not installed (rc=-1908)

1. **execute** no terminal:
   ```bash
   sudo dnf install make time perl gcc dkms kernel-devel kernel-headers
   /sbin/vboxconfig
   ```
2. **Espere** o vbox terminar de buildar.
2. Em seguida, atualize o sistema para aplicar as alterações. **Execute**:
   ```bash
   sudo dnf update
   ```
4. Em seguida reinicie o sistema.
5. Ao iniciar o sistema, **execute** no terminal:
   ```bash
   /sbin/vboxconfig
   ```
6. Novamente, **espere** terminar o vbox build.
7. Abra o VirtualBox e o erro deve desaparecer.
