# 终末启动器 · Terminus Launcher

<div align="center">
  <img src="./apps/app/icons/128x128.png" width="128" alt="Terminus Launcher" />
</div>

**终末启动器（Terminus Launcher）** 是一个免费的 Minecraft Java 版第三方启动器，支持 Windows、macOS 与 Linux。

- 在启动器里搜索、安装、更新来自 Modrinth 与 CurseForge 的模组、整合包、资源包与光影
- 多实例管理、多账户登录、离线皮肤与主题自定义
- 内置「实验室」：种子地图、投影工坊、配方生成、皮肤编辑器等工具

## 关于本项目

本项目基于开源项目 [Modrinth App](https://github.com/modrinth/code) 改造，遵循 GPL-3.0-only 许可证。
原始版权归 Rinth, Inc. 及各位贡献者所有，详见 `COPYING.md` 与各包的 `LICENSE`。

Minecraft 是 Mojang Synergies AB 的商标，本项目与 Mojang、Microsoft 均无关联。

## 构建

```bash
pnpm install
pnpm --filter @modrinth/app-frontend build
cargo build --release --package theseus_gui
```

或者直接打包安装程序：

```bash
pnpm --filter @modrinth/app tauri build
```
