local BAF = BetterDungonFinder
--[[
For translation, you have to copy this file and rename it in xx.lua, and translated the strings below. 
you can get the xx for your language by typing following line in game chat
/script d(GetCVar("language.2"))
]]

--[[
If the font size of dungeon in your language is ok, let it empty.
you can set it with my pre-made settings.
"BAFWinH3"  20KB size
"BAFWinH4"  18KB size default setting
"BAFWinH5"  15KB size

Or you can define your own font.
Take a look at https://wiki.esoui.com/Fonts

For example:
local MyFont = string.format(
      "$(%s)|$(KB_%s)|%s",    --you don't need to understand this
      fontStyle,              --like "MEDIUM_FONT" (it's more complex to use other fonts not provided by eso)
      fontSize,               --like 12
      fontWeight              --like "soft-shadow-thin"
    )
BAFFontSize = MyFont
]]

BAFFontSize = ""

--String Used in addon.
BAFLang_SI = {
  FirstTime = "[BetterDungeonFinder] 检测到初次加载\r\n- 通过回车键唤出鼠标拖动|t30:30:esoui/art/lfg/lfg_indexicon_dungeon_up.dds|t图标\r\n- 推荐在控制中为BDF添加快捷键\r\n- 更多选项请查看BDF插件设置界面",
  
  TITLE = "地下城查找器+",
  TITLE_BaseDungeon = "本体地下城 (n/v)",
  TITLE_DLCDungeon = "DLC地下城 (n/v)",
  TITLE_Undauted = "无畏者誓约",
  
  Caption_SK = "技能点",
  Caption_HM = "困难",
  Caption_SR = "限时",
  Caption_ND = "不死",
  Caption_TR = "三合一",
  
  BUTTON_Empty = "清空",
  BUTTON_Empty_Clear = "清空(0)",
  
  BUTTON_Queue_Status_Queue = "排本!",
  BUTTON_Queue_Status_Cancel = "取消",
  BUTTON_Queue_Status_Ready = "确认?",
  BUTTON_Queue_Status_Fight = "战斗中",
  BUTTON_BG_Tooltip = "(左键) 4v4 (右键) 8v8",
  
  DIALOG_TITLE = "[BDF] 保存地下城列表",
  DIALOG_TEXT = "为该列表输入一个名称",
  
  SETTING_Finder_Header = "排本UI",
  SETTING_Finder_Lock = "锁定排本UI",
  SETTING_Finder_Lock_Info = "固定排本UI的当前位置",
  SETTING_Finder_Pure = "纯黑界面背景",
  SETTING_Finder_Pure_Info = "将排本界面设置为纯黑，增强清晰度",
  SETTING_Finder_Title = "地下城名称左侧对齐显示",
  SETTING_Finder_Title_Info = "默认为居中显示",
  SETTING_Finder_TitleV = "地下城名称显示位置微调",
  SETTING_Finder_Alpha_Low = "地下城背景图透明度（未选时）",
  SETTING_Finder_Alpha_High = "地下城背景图透明度（选择时）",
  SETTING_Finder_Alpha_Tooltip = "关闭 - 0 ~ 1 - 不透明",
  
  SETTING_Trigger_Header = "排本按钮",
  SETTING_Trigger_Lock = "锁定排本按钮",
  SETTING_Trigger_Lock_Info = "固定排本按钮的当前位置",
  SETTING_Trigger_Hide = "隐藏排本按钮",
  SETTING_Trigger_Hide_Info = "隐藏排本按钮后，可设置快捷键呼出排本界面",
  
  SETTING_Other_Header = "其他功能",
  SETTING_Other_AutoUDQ = "自动交接无畏者任务",
  SETTING_Other_AutoUDQ_Info = "在与npc互动时，自动接取或提交无畏者任务",
  SETTING_Other_AutoUDQ_Delay = "交互延迟(ms)",
  SETTING_Other_AutoSwitchQuest = "自动切换无畏者任务",
  SETTING_Other_AutoSwitchQuest_Info = "在进入地下城时，自动切换至当前地下城对应的无畏者任务",
  SETTING_Other_AutoConfirm = "剩余X秒时自动确认",
  SETTING_Other_BGSound = "临时后台音频播放",
  SETTING_Other_BGSound_Info = "在准备倒计时期间，临时启用后台音频播放",
  
  SETTING_Sort_Header = "自定义地下城排序",
  SETTING_Sort_AZ_Info = "按字母排序，与官方顺序相同",
  
  KEYBIND = "开关UI界面",
  
  WARNING_ChangRole = "[BDF] 目前无法更换职能",
  WARNING_NoSelect = "[BDF] 没有选取任何地下城",
  WARNING_ReloadUI = "需要重新加载UI",
}
--Waring: Every line in BAFLang_SI should be ended with ,