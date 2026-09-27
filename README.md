# FoxShootingMiniGame

一个用 [Godot 4.5](https://godotengine.org/) 制作的 2D 射击小游戏。控制一只小狐狸，躲避从右侧不断刷出的史莱姆，站在安全位置自动射击它们来获取分数——被史莱姆碰到就会游戏结束。

## 🎮 玩法

- 史莱姆会从屏幕右侧随机位置不断出现，并向左移动。
- 角色**站立不动时会自动向前发射子弹**，击中史莱姆即可击杀并 +1 分。
- 随着时间推移，史莱姆刷新的速度会越来越快（刷新间隔从 3 秒逐渐缩短到 1 秒）。
- 一旦被史莱姆碰到，游戏结束；3 秒后自动重新开始。

## 🕹️ 操作方式

| 按键 | 功能 |
| ---- | ---- |
| `W` / `A` / `S` / `D` | 上下左右移动 |
| （自动） | 角色静止时自动射击 |

## ✨ 特性

- 像素风格角色与场景
- 动态难度：刷怪速度随时间加快
- 实时分数显示
- 完整的音效与背景音乐（射击、奔跑、敌人死亡、游戏结束）
- 游戏结束后自动重新开始

## 🚀 运行项目

1. 安装 [Godot 4.5](https://godotengine.org/download/)（使用 Forward Plus 渲染器）。
2. 用 Godot 打开项目：选择 `project.godot`。
3. 点击右上角的 **运行** 按钮（或按 `F5`）即可开始游戏。

> 首次打开项目时，Godot 会自动导入资源（.png / .ogg / .ttf 等），需要等待导入完成。

## 📁 项目结构

```
.
├── Scenes/             # 场景文件（.tscn）
│   ├── Game.tscn       # 主场景
│   ├── player.tscn     # 玩家角色
│   ├── slime.tscn      # 敌人（史莱姆）
│   └── bullet.tscn     # 子弹
├── Scripts/            # GDScript 脚本
│   ├── GameManager.gd  # 刷怪与计分逻辑
│   ├── player.gd       # 玩家移动 / 射击 / 死亡
│   ├── enemy.gd        # 敌人移动 / 碰撞检测
│   └── bullet.gd       # 子弹移动与生命周期
├── AssetBundle/        # 美术与音频资源
│   ├── Sprites/        # 精灵图
│   ├── Audio/          # 音效与背景音乐
│   └── *.ttf           # 字体
├── icon.svg            # 项目图标
└── project.godot       # 项目配置文件
```

## 🛠️ 技术要点

- **玩家**：`CharacterBody2D` + `AnimatedSprite2D`，使用 `Input.get_vector()` 实现移动，`move_and_slide()` 处理碰撞。
- **敌人**：`Area2D`，使用信号 `body_entered` / `area_entered` 检测与玩家、子弹的碰撞。
- **子弹**：`Area2D`，通过 `queue_free()` 自动销毁，超时（3 秒）后自行清理。
- **刷怪**：`Timer` 定时生成史莱姆，生成间隔随时间动态缩短。
- **计分**：击杀敌人时累加分数并实时更新 UI Label。

## 📦 资源来源

本项目是学习练习项目，场景与素材（精灵图、音效、字体）均来自 B 站博主 **码客二十二** 的 Godot 教程：

- 教程视频：[BV1fuCrYFEoG](https://www.bilibili.com/video/BV1fuCrYFEoG)
- 主页 / 资源库：[GodotArchive](https://merxon22.github.io/GodotArchive/zh/)

感谢博主的开源分享 🙏

## 📝 许可证

- **代码**：本项目为学习练习，`Scripts/` 下的 GDScript 代码可自由参考使用，未指定具体许可证。
- **素材**：版权归博主 **码客二十二** 所有。博主以「开源分享」方式提供素材，但未明确标注可商用 / 可再分发的许可证，因此这些素材**仅供学习交流使用**；如需商用或二次分发，建议先联系博主确认授权。
