# macOS Hello App

- [x] 核实仓库为空、Xcode 和目标团队签名身份。
- [x] 创建最小 SwiftUI App，配置 com.onemanlol.app 和 Xcode 自动签名。
- [x] 本地构建并验证运行后显示 Hello。
- [x] 配置 GitHub Actions、GitHub Secrets 和苹果认证。
- [ ] 推送代码并验证远程 CI、公证及产物。

## 验证记录

- 本地 Debug 自动签名构建成功；codesign 确认 TeamIdentifier=3T9SU9PJ42。
- 通过 build_and_run.sh --verify 启动，进程检查通过；原生 UI 树及截图确认窗口显示 Hello。
- Release 通用归档成功，包含 arm64 与 x86_64。
- plist 与 shell 语法检查通过。
- 已配置 5 项 GitHub Secrets，临时导出私钥文件已清理。
- 待验证：Xcode Developer ID 导出、GitHub CI、Apple 公证结果。
