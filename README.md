
# 寻仙纪

一款基于 PHP + MySQL 开发的文字修仙类网页游戏（Text-based MUD）。玩家在游戏中扮演修仙者，通过打怪升级、完成任务、收集装备、修炼突破等方式提升境界，最终追求大道成仙。

游戏采用纯文字交互方式，页面适配移动端，整体风格为经典的文字MUD（Multi-User Dungeon）。

---

## 基础功能

- 状态
- 包裹
- 聊天
- 符箓（技能）
- 排行
- 修炼
- 兑换
- 宠物
- 门派
- 好友
- 自动战斗
- 自动寻怪
- 血池（自动回血道具）
- pk


### 门派功能

- 签到
- 贡献
- 商店（购买特殊道具）
- 仓库（由帮主等加入物品用贡献值兑换）
- 虚境（副本地图）
- 审核（申请加入的审核）
- 踢出成员
- 任职（为成员增加职位）
- 修改（用于修改门派介绍）
- 升级（用于升级门派）
- 自动审核
- 解散门派

---

## 技术架构

| 层级 | 技术 |
|------|------|
| 后端 | PHP（原生，无框架） |
| 数据库 | MySQL 5.7 |
| 前端 | HTML + CSS + JavaScript |
| 编码 | UTF-8 |
| 会话 | PHP Session |

### 目录结构

```
xunxian/
├── index.php          # 登录页面
├── reguser.php        # 注册页面
├── game.php           # 游戏主控制器（路由分发中心）
├── pdo.php            # 数据库连接配置
├── footer.php         # 公共页脚
├── class/             # 核心类库
│   ├── player.php     # 玩家/怪物/装备/NPC等实体类与操作
│   └── encode.php     # URL参数加密/解密类
├── game/              # 游戏各功能模块
│   ├── nowmid.php     # 主场景/地图展示
│   ├── pve.php        # 玩家vs怪物战斗
│   ├── pvp.php        # 玩家vs玩家战斗
│   ├── zhuangtai.php  # 角色状态面板
│   ├── cj.php         # 角色创建
│   ├── bagzb.php      # 背包-装备
│   ├── bagdj.php      # 背包-道具
│   ├── bagyp.php      # 背包-药品
│   ├── bagjn.php      # 背包-符箓/技能
│   ├── zbinfo.php     # 装备详情
│   ├── djinfo.php     # 道具详情
│   ├── ypinfo.php     # 药品详情
│   ├── jninfo.php     # 技能详情
│   ├── xiulian.php    # 修炼系统
│   ├── tupo.php       # 境界突破
│   ├── task.php       # 任务接取/提交
│   ├── playertask.php # 任务列表
│   ├── bossinfo.php   # BOSS信息
│   ├── boss.php       # BOSS战斗
│   ├── chongwu.php    # 宠物系统
│   ├── fangshi.php    # 坊市/交易系统
│   ├── club.php       # 门派管理
│   ├── clublist.php   # 门派列表
│   ├── duihuan.php    # 兑换码系统
│   ├── liaotian.php   # 公共聊天
│   ├── im.php         # 好友私聊
│   ├── paihang.php    # 排行榜
│   ├── allmap.php     # 全图查看
│   ├── ginfo.php      # 怪物信息
│   ├── setting.php    # 设置页面
│   └── ...
├── npc/               # NPC交互模板
│   └── muban/         # NPC功能模板（商店、治疗、兑换等）
├── renwu/             # 任务相关文件
├── pay/               # 充值支付相关
├── css/               # 样式文件
├── js/                # 脚本文件
├── images/            # 图片资源
└── xunxian.sql        # 数据库初始结构
```

---

## 核心系统详解

### 用户认证系统

- **注册**：`reguser.php` -> 创建 `userinfo` 账号 + `game1` 角色数据
- **登录**：`index.php` -> 验证账号密码 -> 生成加密 `cmd` 参数跳转至 `game.php`
- **会话验证**：通过 `sid`（Session ID，MD5生成）标识玩家，每次请求校验在线状态
- **离线检测**：超过10分钟无操作自动判定离线，超过5分钟的其他玩家显示为离线

### 游戏主控制器

游戏采用单入口模式，`game.php` 作为中央控制器：

1. 接收 `cmd` 参数（经过自定义加密）
2. 解密后通过 `switch-case` 分发到对应的功能模块
3. 加载 `game/xxx.php` 子页面渲染
4. 统一输出 HTML 结构

核心路由映射：

| cmd 值 | 功能模块 | 文件 |
|--------|---------|------|
| login | 登录后跳转 | - |
| gomid | 地图场景 | nowmid.php |
| pve / pvegj | PVE战斗 | pve.php |
| pvp | PVP战斗 | pvp.php |
| zhuangtai | 角色状态 | zhuangtai.php |
| getbagzb/dj/yp/jn | 背包 | bag*.php |
| task / mytask | 任务 | task.php |
| chongwu | 宠物 | chongwu.php |
| xiulian | 修炼 | xiulian.php |
| tupo | 突破 | tupo.php |
| fangshi | 坊市 | fangshi.php |
| club / clublist | 门派 | club.php |
| liaotian / im | 聊天 | liaotian.php / im.php |
| duihuan | 兑换码 | duihuan.php |
| paihang | 排行 | paihang.php |
| setting | 设置 | setting.php |

### 地图与场景系统

- **地图表**：`mid`，存储场景名称、连接关系（上下左右）、怪物配置、NPC、区域归属
- **区域表**：`qy`，地图所属大区
- **移动**：通过方向链接（北/南/西/东）切换场景
- **怪物刷新**：每个地图按配置的 `mgid` 定时刷新怪物（`midguaiwu` 表）
- **PVP区域**：`ispvp` 字段标记，安全区不可PK
- **玩家可见**：同场景在线玩家实时显示，支持点击查看信息

### 战斗系统

#### PVE（玩家vs怪物）
- 文件：`game/pve.php`
- 机制：回合制，点击"攻击"进行一轮交锋
- 伤害公式：
  - 玩家伤害 = 攻击 - 怪物防御*0.75（保底15%攻击）
  - 怪物伤害 = 怪物攻击 - 玩家防御*0.75（保底15%怪物攻击）
  - 暴击：概率触发，伤害*1.72
  - 吸血：按吸血百分比回复气血
- 宠物参战：宠物独立计算伤害并叠加
- 战斗结果：胜利获得经验、灵石、掉落装备/道具/药品；失败返回安全区

#### PVP（玩家vs玩家）
- 文件：`game/pvp.php`
- 机制：类似PVE的回合制
- 限制：只能在PVP区域发起，双方必须在线且同地图
- 击杀播报：公共聊天频道广播击杀信息

#### BOSS战
- 文件：`game/bossinfo.php`、`game/boss.php`
- 特定地图配置BOSS，独立战斗逻辑

### 角色属性与境界系统

#### 基础属性
- 气血（HP）、攻击、防御、暴击率、吸血率
- 装备加成实时计算到面板

#### 境界体系（8大境界）

| 境界 | 等级范围 |
|------|---------|
| 练气 | 1-29 |
| 筑基 | 30-49 |
| 金丹 | 50-69 |
| 元婴 | 70-79 |
| 化神 | 80-89 |
| 炼虚 | 90-99 |
| 合体 | 100-109 |
| 大乘 | 110+ |

每个境界分十层（一~十层）。

#### 升级机制
- 获取经验 -> 达到经验上限 -> 自动升级
- 升级自动增加气血、攻击、防御、五行属性
- 跨境界或跨层次时需要**突破**

#### 突破系统
- 文件：`game/tupo.php`
- 大境界突破：50%成功率，消耗大量灵石
- 小层次突破：更高成功率，消耗较少灵石
- 突破成功额外获得属性加成
- 未突破时经验达到上限后不再增长

### 装备系统

#### 装备部位（6件）
1. 武器  2. 头饰  3. 衣服  4. 腰带  5. 首饰  6. 鞋子

#### 装备属性
- 攻击、防御、气血、暴击、吸血

#### 装备来源
- 打怪掉落
- 任务奖励
- 坊市购买

#### 强化系统
- 消耗强化石提升装备属性
- 强化等级越高，成功概率越低
- 强化失败不降级

### 道具系统

- **强化石**：装备强化材料
- **符箓残页**：兑换技能材料
- 各类任务物品、材料

### 药品系统

- 战斗中或平时可使用
- 恢复气血、临时提升攻击/防御等属性
- 3个快捷药品栏位（yp1/yp2/yp3）

### 技能/符箓系统

- 文件：`game/bagjn.php`、`game/jninfo.php`
- 符箓在战斗中一次性使用，提供临时属性加成
- 通过残页兑换获得
- 3个快捷技能栏位（jn1/jn2/jn3）

### 宠物系统

- 文件：`game/chongwu.php`
- 抽取方式：消耗50极品灵石随机抽取
- 宠物名称池：十二生肖系列、四凶、四神兽、上古神等
- 品质分级：普通 -> 优秀 -> 卓越 -> 非凡 -> 完美 -> 逆天
- 属性：气血、攻击、防御、暴击、吸血
- 成长率：品质影响升级时的属性加成比例
- 可装备6件装备
- 宠物吸血属性会附加给主人（宠物自身不受伤害）

### 修炼系统

- 文件：`game/xiulian.php`
- 消耗灵石或极品灵石开始修炼
- 离线挂机获得经验（最多24小时）
- 每分钟收益 = 等级 * 1.2

### 任务系统

- 文件：`game/task.php`、`game/playertask.php`
- 任务类型：
  1. **收集类**：收集指定道具
  2. **打怪类**：击杀指定怪物N只
  3. **对话类**：与指定NPC对话
- 任务品质：主线、日常等
- 任务状态：未接 -> 进行中 -> 可提交 -> 已完成

### 坊市/交易系统

- 文件：`game/fangshi.php`
- 玩家可挂单出售道具和装备
- 使用灵石作为交易货币
- 交易采用数据库事务保证一致性

### 门派/帮派系统

- 文件：`game/club.php`、`game/clublist.php`
- 创建/加入门派
- 门派资金（灵石、极品灵石）
- 成员管理

### 聊天系统

- **公共聊天**：`game/liaotian.php` + `ggliaotian` 表
- **好友私聊**：`game/im.php` + `imliaotian` 表
- 击杀播报、系统通知通过公共频道广播

### 兑换码系统

- 文件：`game/duihuan.php`
- 支持兑换装备、道具、药品、灵石、经验等
- 可设置一次性或永久兑换码

### 排行榜

- 文件：`game/paihang.php`
- 按等级、修为等维度排名

---

## 数据库设计

### 核心表清单

| 表名 | 说明 |
|------|------|
| userinfo | 账号信息（登录用） |
| game1 | 玩家角色主数据 |
| gameconfig | 游戏配置（初始地图等） |
| mid | 地图/场景定义 |
| qy | 区域定义 |
| guaiwu | 怪物模板库 |
| midguaiwu | 地图实时怪物实例 |
| npc | NPC定义 |
| zhuangbei | 装备模板库 |
| playerzhuangbei | 玩家持有的装备 |
| daoju | 道具模板库 |
| playerdaoju | 玩家持有的道具 |
| yaopin | 药品模板库 |
| playeryaopin | 玩家持有的药品 |
| jineng | 技能/符箓模板库 |
| playerjineng | 玩家持有的技能 |
| playerchongwu | 玩家宠物 |
| renwu | 任务模板 |
| playerrenwu | 玩家任务进度 |
| boss | BOSS模板 |
| club | 门派信息 |
| clubplayer | 门派成员 |
| fangshi_dj | 坊市道具挂单 |
| fangshi_zb | 坊市装备挂单 |
| duihuan | 兑换码配置 |
| duihuan_son | 兑换记录 |
| ggliaotian | 公共聊天记录 |
| im / imliaotian | 好友关系 / 私聊记录 |
| setting | 玩家设置 |

### 关键表结构

**game1（玩家角色表）**

| 字段 | 说明 |
|------|------|
| uid | 用户ID |
| sid | 会话ID（MD5生成） |
| token | 账号Token |
| uname | 角色名 |
| ulv | 等级 |
| uexp | 当前经验 |
| uhp/umaxhp | 气血 |
| ugj | 攻击 |
| ufy | 防御 |
| ubj | 暴击 |
| uxx | 吸血 |
| uyxb | 灵石（游戏币） |
| uczb | 极品灵石（充值币） |
| nowmid | 当前地图ID |
| tool1~tool6 | 6件装备的装备栏 |
| yp1~yp3 | 3个药品快捷栏 |
| jn1~jn3 | 3个技能快捷栏 |
| cw | 出战宠物ID |
| sfzx | 是否在线 |
| ispvp | PVP目标UID |

---

## 核心类说明

### player.php（class/player.php）

包含所有游戏实体的类定义和数据访问函数：

| 类/函数 | 说明 |
|---------|------|
| `player` 类 | 玩家角色实体 |
| `getplayer($sid)` | 根据sid获取玩家完整数据（含装备加成） |
| `guaiwu` 类 | 怪物实体 |
| `getguaiwu($gid)` | 获取地图中的怪物实例 |
| `clmid` 类 / `getmid()` | 地图实体 |
| `npc` 类 / `getnpc()` | NPC实体 |
| `zhuangbei` 类 | 装备实体 |
| `getzb()` / `getzbkzb()` / `addzb()` | 装备查询与添加 |
| `daoju` 类 / `adddj()` / `getdaoju()` | 道具操作 |
| `yaopin` 类 / `addyaopin()` | 药品操作 |
| `task` 类 / `gettask()` | 任务操作 |
| `boss` 类 / `getboss()` | BOSS操作 |
| `chongwu` 类 / `getchongwu()` | 宠物操作 |
| `jineng` 类 / `addjineng()` | 技能操作 |
| `club` 类 / `getclub()` | 门派操作 |
| `changeexp()` / `upplayerlv()` | 经验与升级 |
| `istupo()` | 判断是否需突破 |
| `changeyxb()` / `changeczb()` | 货币操作 |
| `changeplayersx()` | 修改玩家属性 |

### encode.php（class/encode.php）

自定义URL参数加密类：
- 基于 Base64 + 字符穿插 + 符号替换
- 用于隐藏真实的 `cmd` 参数，防止直接篡改URL
- 密钥：`cxphp`

---

## 安全机制

| 机制 | 说明 |
|------|------|
| URL参数加密 | 通过 `encode` 类加密/解密 `cmd` 参数 |
| XSS防护 | 部分输入使用 `htmlspecialchars()` 过滤 |
| 在线验证 | 10分钟离线自动踢出，5分钟不活跃判定离线 |
| 防连点 | 代码中有防连点机制（当前被注释） |

### 已知安全问题

1. **SQL注入**：大量SQL语句直接拼接字符串，未全部使用预处理语句
2. **XSS**：部分输出未做HTML转义
3. **CSRF**：无CSRF Token保护
4. **密码明文存储**：`userinfo` 表中密码以明文形式存储
5. **权限校验薄弱**：部分操作缺少严格的权限验证

---

## 部署说明

### 环境要求
- PHP 7.0+
- MySQL 5.7+
- Web服务器（Nginx/Apache）

### 部署步骤
1. 导入 `xunxian.sql` 到MySQL数据库
2. 修改 `pdo.php` 中的数据库连接信息：
   - 数据库地址、端口
   - 用户名、密码
   - 数据库名
3. 将代码部署到Web服务器根目录
4. 访问 `index.php` 即可进入游戏

### 默认配置
- 初始地图ID：`225`（村广场）
- 新玩家初始：等级1、气血35、攻击12、防御5、灵石2000、极品灵石100

---

## 游戏特色总结

1. **经典文字MUD体验**：纯文字描述，低带宽消耗，适合移动端
2. **完整修仙体系**：8大境界、层层突破、修炼挂机
3. **丰富养成线**：角色升级、装备强化、宠物培养、技能收集
4. **社交互动**：公共聊天、好友私聊、门派系统、PVP竞技
5. **经济系统**：打怪掉落、坊市交易、兑换码、双货币体系
6. **任务驱动**：主线+日常任务引导玩家成长
