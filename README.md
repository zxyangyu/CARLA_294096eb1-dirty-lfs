# CARLA_294096eb1-dirty

原始压缩包大小为 7,422,239,565 字节。由于 GitHub Git LFS 的单文件大小限制，文件被拆成 297 个分卷，并全部通过 Git LFS 存储。

## 下载

请先安装 [Git LFS](https://git-lfs.com/)，然后克隆仓库：

```bash
git lfs install
git clone <repository-url>
cd CARLA_294096eb1-dirty-lfs
```

## 合并

Windows PowerShell：

```powershell
.\reconstruct.ps1
```

Linux 或 macOS：

```bash
chmod +x reconstruct.sh
./reconstruct.sh
```

输出文件：`CARLA_294096eb1-dirty.tar.gz`

SHA-256：

```text
739688863a43993334877f28d5be8af90197cbb13c50df3c4e5356dc657b7c35
```

合并脚本会自动验证 SHA-256，显示 `SHA-256 verified` 才表示文件完整。
