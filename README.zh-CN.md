# theoretical-physics-teach

[English README](README.md) · 简体中文

[![validate](https://github.com/jiangweiqi001/theoretical-physics-teach/actions/workflows/validate.yml/badge.svg)](https://github.com/jiangweiqi001/theoretical-physics-teach/actions/workflows/validate.yml)

> 读原文，守符号，补推导，从上次真正停下的位置继续。

`theoretical-physics-teach` 是由 [jiangweiqi001](https://github.com/jiangweiqi001) 独立创建、维护和发布的 Agent Skill。它面向需要长期精读理论物理论文、教材和讲义的人，而不是用一段摘要替代原文。

它把教学结果写进真实的 Obsidian 学习工作区：每篇材料保留自己的符号体系；跨材料关系写清成立条件；长推导不跳步；你在对话里说“这一步没懂”以后，解释会被整合回原 Note 第一个依赖它的位置；下一次从精确公式、证明步骤或代码操作继续。

Codex 不会自动调用本 Skill。必须显式写出 `$theoretical-physics-teach`。`agents/openai.yaml` 中保留了 explicit-only 策略。

## 导航

- [五分钟开始](#五分钟开始)
- [它解决什么问题](#它解决什么问题)
- [断点续学](#断点续学)
- [对话回写与全文连贯性](#对话回写与全文连贯性)
- [符号、多材料与完整推导](#符号多材料与完整推导)
- [诊断与掌握证据](#诊断与掌握证据)
- [可选的代码—理论桥接](#可选的代码理论桥接)
- [安装与升级](#安装与升级)
- [工作区结构](#工作区结构)
- [验证与发布包](#验证与发布包)
- [兼容性与限制](#兼容性与限制)

## 五分钟开始

1. 在 Obsidian vault 里选一个可写的学习目录；不要放在 Skill 安装目录内。
2. 把论文、教材、讲义或对应代码的本地路径交给 Codex。
3. 显式调用 Skill，并说明物理目标、材料、语言和希望最终能够独立完成的事情。

最小提示词：

```text
$theoretical-physics-teach

学习工作区：D:\Obsidian\UEG场论\学习
材料：D:\papers\paper-A.pdf 和 D:\papers\paper-B.pdf
目标：理解两篇文章的理论推导，并能解释它们的符号和近似如何对应。
请保留每篇文章的原符号，从基础诊断开始，每次只考一个知识点。
```

第一次运行会初始化缺失的 canonical 文档，但不会覆盖已有文件。之后的每次运行先读取 `MISSION.md`、`CURRENT-STATE.md`、当前课程 Note 和最近的学习证据，再决定下一步。

## 它解决什么问题

理论物理材料的难点通常不在某一个孤立公式，而在连续依赖：前文的 Fourier 约定、一个被省略的积分步骤、不同论文对同一字母的不同定义、调节参数的取极限顺序，以及代码中某个数组究竟代表哪个物理量。

普通摘要可以描述结论，却不能可靠保存：

- 你已经独立会到哪一步；
- 哪个等号仍然不懂；
- 这次解释应该插入原 Note 的哪里；
- 不同材料的符号什么时候等价；
- 下一次应该先问哪一个问题。

这个 Skill 把上述状态变成可检查、可链接、可恢复的 Markdown 文件。

完整工作流和示例见 [端到端学习演示](https://github.com/jiangweiqi001/theoretical-physics-teach/blob/main/docs/walkthrough.md)，canonical 所有权见 [架构说明](https://github.com/jiangweiqi001/theoretical-physics-teach/blob/main/docs/architecture.md)。

## 断点续学

`CURRENT-STATE.md` 只保存当前原子快照，不保存聊天流水账。它记录：

- 当前 Lesson ID 与 Obsidian 链接；
- 最后完成的公式或推理步骤；
- 第一个未完成的 heading 或 block 深链接；
- 当前卡点；
- 继续所需的来源锚点；
- 最近的学习证据；
- 一个可观察的下一步动作。

因此“继续学习”不是重新概括章节，而是重新打开类似下面的精确对象：

```markdown
[[lessons/L-000004-free-retarded-propagator#^resume-regulated-integral]]
```

仓库中的 [retarded-propagator 示例](https://github.com/jiangweiqi001/theoretical-physics-teach/blob/main/examples/retarded-propagator/CURRENT-STATE.md) 展示了完整状态。

## 对话回写与全文连贯性

当你说“这一步没懂”时，解释不能只留在对话里。Skill 必须：

1. 读取完整的当前 Note；
2. 找到第一个依赖缺失知识的句子、等号、证明步骤或代码操作；
3. 先补 Note 开头的符号定义；
4. 在依赖点原位整合解释；
5. 重写解释前后的过渡；
6. 去掉已经失效的卡点文字、重复内容和局部矛盾；
7. 修复编号、来源、Obsidian 链接和课末检查；
8. 更新精确恢复点。

回写不是在 Note 末尾追加对话记录。完成后的 Note 应当像这段解释从一开始就被设计在那里一样连贯。

## 符号、多材料与完整推导

每个 learner-facing Note 的第一个 H2 必须是：

```markdown
## Notation and conventions
```

新符号必须在第一次出现在正文、公式、表格或另一个符号的定义之前完成说明，包括：字形和读法、数学类型、定义域、指标范围、物理意义、单位或量纲、来源与精确锚点、本地符号约定，以及上下标、帽子、横线、星号和粗体的含义。

多篇材料不会被强行统一成一个记号。每篇材料保留原符号，`NOTATION-CROSSWALK.md` 记录逐项翻译，`SYNTHESIS.md` 记录关系类型、成立假设、适用区域、近似和冲突。

推导没有 Note 长度上限。所有非平凡变换都要说明使用的恒等式、假设、近似、边界条件或 convention，并展示中间代数、积分、求和、指标缩并、符号变化和极限顺序。物理结果还要做适用的单位、极限、对称性、守恒、符号、归一化和边界检查。

## 诊断与掌握证据

初始水平定位、普通知识检查和每个 Note 的课末检查，默认一次只问一个选择题或判断题。干扰项对应具体误解，而不是凑数。

但是“选对”只证明识别，不自动证明会推导。目标能力是证明、计算、跨来源翻译或代码解释时，Skill 会追加最小必要的简答或演算，并把以下证据分开保存：

- 未提示回答；
- 学习者自述；
- 提示顺序；
- 辅助后的回答；
- 当前能证明的能力边界；
- 仍未完成的边界。

Mission、Roadmap 或概念节点只有在链接的学习证据真正满足对应标准时才能标为完成。

## 可选的代码理论桥接

只有当代码理解属于学习目标并且存在可信的对应材料时，代码环节才启用。可信材料包括：

- 官方或作者关联的开源仓库，并固定到精确 commit；
- 用户提供的不可变快照；
- 具有可重新定位锚点、足以完成映射的伪代码。

没有可靠对应代码时可以省略这个环节；不会为了“显得完整”而编造代码。

启用后先讲理论，再依次解释：

```text
来源公式 → 假设与近似 → 离散化 → 物理量 → 代码变量
→ 单位/定义域/shape/指标 → 初始化与更新 → 输出 → 验证量
```

新建 Code Map 使用独立的 `assets/templates/CODE-MAP.md`，真实执行记录使用 `assets/templates/RUN-RECORD.md`。Lesson 只保留学习者需要的物理解释和 canonical 链接。没有 Run 记录和检查过的输出时，Skill 不会声称代码已经运行、结果吻合或计算收敛。

## 安装与升级

### Codex 个人安装

PowerShell：

```powershell
$skillsDirectory = Join-Path $env:USERPROFILE ".agents\skills"
New-Item -ItemType Directory -Force -Path $skillsDirectory | Out-Null
git clone https://github.com/jiangweiqi001/theoretical-physics-teach.git (Join-Path $skillsDirectory "theoretical-physics-teach")
```

macOS 或 Linux：

```sh
mkdir -p "$HOME/.agents/skills"
git clone https://github.com/jiangweiqi001/theoretical-physics-teach.git "$HOME/.agents/skills/theoretical-physics-teach"
```

也可以使用 `$skill-installer` 从本仓库安装，或下载 GitHub Release 中的 runtime-only ZIP。发布包把运行时文件直接放在压缩包根部：请先创建 `theoretical-physics-teach` 文件夹，再把压缩包中的全部内容直接解压到该文件夹，并将它放入个人 skills 目录。

### 升级 Git clone

```powershell
git -C "$env:USERPROFILE\.agents\skills\theoretical-physics-teach" pull --ff-only
```

从 `v0.3.0` 升级到 `v0.4.0` 不会迁移或改写学习工作区。旧 Lesson 内嵌的 Code Map 继续有效；以后新建的 Code Map 使用独立文件。

## 工作区结构

| 路径 | 作用 |
| --- | --- |
| `MISSION.md` | 物理目标、范围与可观察完成标准 |
| `CURRENT-STATE.md` | 精确断点、当前卡点与一个下一步 |
| `MATERIALS.md` | 来源、版本、路径、角色与可用性 |
| `ROADMAP.md` | 前置依赖、来源锚点与退出证据 |
| `lessons/*.md` | 符号优先、完整推导、课末检查 |
| `learning-records/EV-*.md` | 不可变学习证据与能力判断 |
| `NOTATION-CROSSWALK.md` | 各来源符号与条件化翻译 |
| `SYNTHESIS.md` | 跨来源关系、假设、方法、区域和冲突 |
| `OPEN-QUESTIONS.md` | 缺失证据、歧义和下一验证动作 |
| `reference/code-maps/*.md` | 可选的 canonical 公式—代码映射 |
| `execution-records/RUN-*.md` | 可选的不可变真实运行记录 |

## 验证与发布包

在开发仓库克隆中，Windows 和 Ubuntu 都会运行静态合同、bootstrap 合同、行为场景、规范示例、文档链接、workspace validator 和 runtime package 测试。

本地验证：

```powershell
./tests/static-contract.ps1
./tests/bootstrap-contract.ps1
./tests/scenario-contract.ps1
./tests/green-contract.ps1
./tests/example-contract.ps1
python -X utf8 -m unittest discover -s tests -v
```

只读检查一个学习工作区：

```powershell
python -X utf8 scripts/validate_workspace.py "D:\Obsidian\UEG场论\学习"
```

runtime-only 发布包保留这个只读 workspace validator，但有意不包含开发测试和发布包构建脚本。

构建干净发布包：

```powershell
python -X utf8 scripts/build_skill_package.py --output dist/theoretical-physics-teach-v0.4.0.zip
```

## 兼容性与限制

- canonical 教学产物只使用 Obsidian 兼容 `.md`；不创建 HTML、CSS、JavaScript 或依赖浏览器的课程。
- 本 Skill 补充而不替代原始材料、独立计算和专家审查；输出不是正确性保证。
- 不编造缺失的公式、引用、约定、代码行为、运行结果或来源锚点。
- 不静默调和冲突的符号、假设、近似或结论。
- Python 只用于可选的只读验证和发布包构建；核心教学文件是 Markdown。
- 仍然是 explicit-only；只谈到理论物理不会自动激活。

## 许可与来源说明

本项目由 [jiangweiqi001](https://github.com/jiangweiqi001) 独立维护并采用 MIT License。早期材料基于 Matt Pocock 的 MIT-licensed [`teach` skill](https://github.com/mattpocock/skills/tree/84fdeffd12f2ee307994d1eb6feb48173b6e0502/skills/productivity/teach) 衍生；上游版权和许可声明按要求保留。

这不表示本项目由上游维护或得到 Matt Pocock 背书。详见 [NOTICE.md](NOTICE.md) 和 [LICENSE](LICENSE)。

当前版本：`v0.4.0`。完整变更见 [CHANGELOG.md](https://github.com/jiangweiqi001/theoretical-physics-teach/blob/main/CHANGELOG.md)。
