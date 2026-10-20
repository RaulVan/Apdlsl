# macOS Hello App

- [x] 核实仓库为空、Xcode 和目标团队签名身份。
- [x] 创建最小 SwiftUI App，配置 com.onemanlol.app 和 Xcode 自动签名。
- [x] 本地构建并验证运行后显示 Hello。
- [x] 配置 GitHub Actions、GitHub Secrets 和苹果认证。
- [x] 推送代码并验证远程通用构建、自动导出签名、Apple API 认证与诊断产物。
- [ ] **受阻**：Apple 公证被团队资格错误 7000 拒绝，需要 Apple Developer Program Support 处理。
- [ ] **未执行**：公证票据附加与最终 Gatekeeper 验收，依赖 Apple 返回 Accepted。

## 验证记录（2026-10-20）

- 本地 Debug 自动签名构建成功；codesign 确认 TeamIdentifier=3T9SU9PJ42。
- build_and_run.sh --verify 启动成功；原生 UI 树与截图确认窗口显示 Hello。
- 本地及 CI Release 通用归档包含 arm64 与 x86_64。
- Developer ID 自动导出成功，保留 Hardened Runtime、App Sandbox 和安全时间戳；codesign 严格验证通过。
- plist、shell、工作流 YAML 与内嵌 Python 语法检查通过。
- 5 项 GitHub Secrets 已配置；临时导出的 p12 和密码已删除，CI 临时钥匙串清理成功。代码未包含私钥。
- [远程 CI 验证运行](https://github.com/RaulVan/Apdlsl/actions/runs/39348648851)：构建、证书导入、自动签名与诊断产物上传均成功；整体因 Apple 7000 失败。
- 远程公证提交 ID：4b1b6a4e-3555-4577-a73c-780d1fdf15e9；状态 Rejected；issues=null。
- 下载 CI 已签名产物后，SHA-256、包名、双架构及 codesign 严格检查通过。
- 公证资格恢复后，可手动重跑工作流；尚无通过公证的正式分发产物。
