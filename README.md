# Apdlsl

最小原生 macOS SwiftUI App。启动后窗口中央显示 `Hello`。

- Bundle ID：`com.onemanlol.app`
- Apple Developer 团队：Boztepe BÜKE (`3T9SU9PJ42`)
- 最低系统：macOS 14.0
- Xcode 签名：Automatically manage signing
- 发布架构：Apple Silicon (`arm64`) + Intel (`x86_64`)

## 本地开发

打开 `Apdlsl.xcodeproj`，选择 `Apdlsl` Scheme 后运行。Xcode 的 Accounts 中需要有该团队的开发权限；工程已经配置 `CODE_SIGN_STYLE = Automatic` 和团队 ID。

也可使用：

```sh
./script/build_and_run.sh --verify
```

工程文件已提交，正常构建不依赖 XcodeGen。修改 `project.yml` 后，可使用 XcodeGen 2.45 或以上版本执行 `xcodegen generate` 更新工程。

## GitHub Actions 与苹果公证

工作流：`.github/workflows/macos.yml`。

- 推送 `main` 或手动触发：构建通用归档 → Xcode 自动导出 Developer ID 签名 App → Apple 公证 → 附加公证票据 → Gatekeeper 校验 → 上传 ZIP 与 SHA-256。
- Pull Request：仅构建，不读取签名与公证 Secrets。
- 成功产物：Actions 运行页面中的 `Apdlsl-macOS`，保留 14 天。
- 公证诊断：`Apdlsl-notarization`。苹果未返回 `Accepted` 时不会生成可分发产物。
- 此流程使用 Developer ID 站外分发，不上传 App Store Connect / TestFlight，不创建 GitHub Release。

仓库的 Actions Secrets：

| Secret | 用途 |
| --- | --- |
| `APPLE_CERTIFICATE_P12_BASE64` | 该团队 Developer ID Application 证书及私钥 |
| `APPLE_CERTIFICATE_PASSWORD` | 上述 p12 的密码 |
| `ASC_KEY_ID` | Apple API Key ID |
| `ASC_ISSUER_ID` | Apple API Issuer ID |
| `ASC_PRIVATE_KEY` | Apple API p8 内容 |

证书仅导入 GitHub 临时 Runner 的专用钥匙串，任务结束时清理。不要将 p8、p12、私钥或密码提交至 Git。证书到期或吊销后，需要更新对应 Secrets。

Apple 公证说明：[Developer ID](https://developer.apple.com/developer-id/)。
