local BAF = BetterDungonFinder
--Let Controls Group for every dungeon in right position
function BAF.WindowPositionSet()
  local TopLevel = WINDOW_MANAGER:GetControlByName("BAFTopLevel")
  local Left = -665
  local Top = -360
  for i = 1, 12 do
    BAF.BDC[i]:SetAnchor(CENTER, TopLevel, CENTER, Left, Top + 60*i)
    BAF.BDC[i+12]:SetAnchor(CENTER, TopLevel, CENTER, Left + 240, Top + 60*i)
    BAF.DDC[i]:SetAnchor(CENTER, TopLevel, CENTER, Left + 500, Top + 60*i)
    BAF.DDC[i+12]:SetAnchor(CENTER, TopLevel, CENTER, Left + 740, Top + 60*i)
  end
  for i = 1, 12 do
    if BAF.DDC[i+24] ~= nil then 
      BAF.DDC[i+24]:SetAnchor(CENTER, TopLevel, CENTER, Left + 980, Top + 60*i)
    end
  end
  -- UnduantedControl
  for i = 1, 3 do
    BAF.UDC[i]:SetAnchor(CENTER, TopLevel, CENTER, Left + 1240, Top + 60*i)
  end
end
--When the position of the window and button changes, recorded various position information.
-- Point and relativePoint may change when control moved, so GetLEFT/TOP() not enough to reset control position.
function BAF.WindowPosition()
  -- GetAnchor() 
  -- boolean isValidAnchor, number point, object relativeTo, number relativePoint, 
  -- number offsetX, number offsetY, number AnchorConstrains anchorConstrains
  local _
  _, BAF.savedVariables.Window_Point, _, BAF.savedVariables.Window_rPoint, BAF.savedVariables.Window_OffsetX, BAF.savedVariables.Window_OffsetY = BAFTopLevel:GetAnchor()
  _, BAF.savedVariables.Button_Point, _, BAF.savedVariables.Button_rPoint, BAF.savedVariables.Button_OffsetX, BAF.savedVariables.Button_OffsetY = BAFTriggle_Button:GetAnchor()
end

--Open or close the mainwindow, and triggle controls update
function BAF.ShowWindow()
  --Update dungeon and windows info
  BAF.DungeonUpdate()
  BAF.WindowUpdate()
  --Show window
  SCENE_MANAGER:ToggleTopLevel(BAFTopLevel)
end

--Try to change the role in LFG
function BAF.RoleChange(Number)
  if CanUpdateSelectedLFGRole() == false then
    d(BAFLang_SI.WARNING_ChangRole)
    return
  end
  UpdateSelectedLFGRole(Number)
  BAF.RoleRefresh()
end

--The function of empty button, reset every buttons of dungeon and update
function BAF.EmptyDungeon()
  BAF.SD = {}
  BAFWindow_Empty:SetText(BAFLang_SI.BUTTON_Empty_Clear)
  for i = 1, #BAF.BDC do  -- check dlc dungeon button state
    local Norm = BAF.BDC[i]:GetNamedChild("_N")
    local Vera = BAF.BDC[i]:GetNamedChild("_V")
    Norm:SetState(BSTATE_NORMAL)
    Vera:SetState(BSTATE_NORMAL)
  end
  for i = 1, #BAF.DDC do  -- check dlc dungeon button state
    local Norm = BAF.DDC[i]:GetNamedChild("_N")
    local Vera = BAF.DDC[i]:GetNamedChild("_V")
    Norm:SetState(BSTATE_NORMAL)
    Vera:SetState(BSTATE_NORMAL)
  end
  for i = 1, #BAF.UDC do  -- check dlc dungeon button state
    local Norm = BAF.UDC[i]:GetNamedChild("_N")
    local Vera = BAF.UDC[i]:GetNamedChild("_V")
    Norm:SetState(BSTATE_NORMAL)
    Vera:SetState(BSTATE_NORMAL)
  end
  if GetActivityFinderStatus() ~= 0 then
    CancelGroupSearches()
  end
  BAF.WindowUpdate()
end

--Change the text of queue button/Auto confirm/BG Sound
local CallId = nil
function BAF.QueueStatus()
  local QState = GetActivityFinderStatus()
  -- Ready check
  if QState == 4 then
    BAFWindow_Queue:SetText(BAFLang_SI.BUTTON_Queue_Status_Ready)
    --Background sound
    if BAF.savedVariables.BGSound and GetSetting(SETTING_TYPE_AUDIO, 12) == "0" then
      SetSetting(SETTING_TYPE_AUDIO, 12, 1)
      BAF.savedVariables.BGSoundC = true
      EVENT_MANAGER:RegisterForUpdate("BAFBGSound", 100,
        function()
          local Status = GetActivityFinderStatus()
          if Status == 4 or (not DoesGameHaveFocus() and Status == 2) then --Keep it when Ready-check/Not focus + in dungeon
            return
          end
          SetSetting(SETTING_TYPE_AUDIO, 12, 0)
          BAF.savedVariables.BGSoundC = false
          EVENT_MANAGER:UnregisterForUpdate("BAFBGSound")
        end
        )
    end
    --Auto Confirm
    if BAF.savedVariables.AutoConfirm ~= 0 and not CallId then
      CallId = zo_callLater(function()
        AcceptLFGReadyCheckNotification()
        PlaySound(BAF.AlertSound[BAF.savedVariables.AlertSound])
        end, (45.3 - BAF.savedVariables.AutoConfirm)*1000)
    end
    --Alert when not focus game at check ready
    EVENT_MANAGER:RegisterForUpdate("BAFAlert", 1500,
      function()
        local Status = GetActivityFinderStatus()
        if not DoesGameHaveFocus() then
         PlaySound(BAF.AlertSound[BAF.savedVariables.AlertSound])
        end
        if Status == 4 or (not DoesGameHaveFocus() and Status == 2) then --Keep it when Ready-check/Not focus + in dungeon
          return
        end
        EVENT_MANAGER:UnregisterForUpdate("BAFAlert")
      end
    )
    return
  end 
  -- Cancel auto confirm
  if CallId then 
    zo_removeCallLater(CallId)
    CallId = nil
  end
  -- Queuing
  if QState == 1 then BAFWindow_Queue:SetText(BAFLang_SI.BUTTON_Queue_Status_Cancel) return end 
  -- In progress
  if QState == 2 then BAFWindow_Queue:SetText(BAFLang_SI.BUTTON_Queue_Status_Fight) return end 
  BAFWindow_Queue:SetText(BAFLang_SI.BUTTON_Queue_Status_Queue) -- Other State（OK for queue）
end

local ActivitySet = {
    ["50Solo"]  = {67, 97, 98, 99, 100, 101},
    ["50Group"] = {1 , 92, 93, 94,  95,  96},
    ["49Solo"]  = {68, 87, 88, 89,  90,  91},
    ["49Group"] = {2 , 82, 83, 84,  85,  86},
  }
--Start group research
function BAF.Queue(ActivitySetId)
	ClearGroupFinderSearch()
  
-- none, 0；Queuing, 1; In progress, 2; Dungeon complete, 3; Ready Check, 4
  local QState =  GetActivityFinderStatus()
  if QState == 1 then  --Queuing
    CancelGroupSearches()
    BAF.WindowUpdate()
    return
  end
  if QState == 2 then return end  --In progress
  if QState == 4 then return end  --Ready check
  
  --DungeonSelected
  if ActivitySetId then
    --62 nD, 61 vD
    if ActivitySetId == 0 then
      local Tep = {}
      if GetGroupSize() > 1 then
        --Group
        if GetUnitLevel("player") > 49 then
          Tep = ActivitySet["50Group"]
        else
          Tep = ActivitySet["49Group"]
        end
      else
        --Solo
        if GetUnitLevel("player") > 49 then
          Tep = ActivitySet["50Solo"]
        else
          Tep = ActivitySet["49Solo"]
        end
      end
      for i = 1, #Tep do
        if DoesActivitySetPassAvailablityRequirementList(Tep[i]) then
          AddActivityFinderSetSearchEntry(Tep[i])
          break
        end
      end
    else
      AddActivityFinderSetSearchEntry(ActivitySetId)
    end
  else
    --CheckList
    if BAF.SD[1] == nil then
      d(BAFLang_SI.WARNING_NoSelect)
      return
    end
    --Fill Dungeon to list
    for i = 1, #BAF.SD do
      if BAF.SD[i] ~= nil then
        AddActivityFinderSpecificSearchEntry(BAF.SD[i])
      end
    end
  end
  --Queue！
	StartGroupFinderSearch()
  --Close UI
  BAF.ShowWindow()
end

local RewardType = {
  [1] = GetString(SI_GROUPFINDERCATEGORY_SINGLESELECTDEFAULT0).." ("..GetString(SI_DUNGEONDIFFICULTY1)..")\r\n|t25:25:esoui/art/icons/quest_letter_001.dds|t |c9932CC"..GetString(SI_ACTIVITY_FINDER_DAILY_REWARD_HEADER).."|r",
  [2] = GetString(SI_GROUPFINDERCATEGORY_SINGLESELECTDEFAULT0).." ("..GetString(SI_DUNGEONDIFFICULTY1)..")\r\n|t25:25:esoui/art/icons/quest_letter_001.dds|t |c6495ED"..GetString(SI_ACTIVITY_FINDER_STANDARD_REWARD_HEADER).."|r",
  [3] = GetString(SI_GROUPFINDERCATEGORY_SINGLESELECTDEFAULT0).." ("..GetString(SI_DUNGEONDIFFICULTY2)..")\r\n|t25:25:esoui/art/icons/quest_letter_001.dds|t |c9932CC"..GetString(SI_ACTIVITY_FINDER_DAILY_REWARD_HEADER).."|r",
  [4] = GetString(SI_GROUPFINDERCATEGORY_SINGLESELECTDEFAULT0).." ("..GetString(SI_DUNGEONDIFFICULTY2)..")\r\n|t25:25:esoui/art/icons/quest_letter_001.dds|t |c6495ED"..GetString(SI_ACTIVITY_FINDER_STANDARD_REWARD_HEADER).."|r",
  [5] = GetString(SI_BATTLEGROUND_FINDER_RANDOM_FILTER_TEXT).."\r\n|t25:25:esoui/art/icons/quest_letter_001.dds|t |c9932CC"..GetString(SI_ACTIVITY_FINDER_DAILY_REWARD_HEADER).."|r",
  [6] = GetString(SI_BATTLEGROUND_FINDER_RANDOM_FILTER_TEXT).."\r\n|t25:25:esoui/art/icons/quest_letter_001.dds|t |c6495ED"..GetString(SI_ACTIVITY_FINDER_STANDARD_REWARD_HEADER).."|r",
}
--InfoTooltip for DailyReward
function BAF.DailyInfo(Control, Type)
  local String = ""
  InitializeTooltip(InformationTooltip, Control, BOTTOM, 0, 0, TOP)
  if Type == 1 then
    if IsActivityEligibleForDailyReward(LFG_ACTIVITY_DUNGEON) then
      String = RewardType[1]
    else
      String = RewardType[2]
    end
  end
  if Type == 2 then
    if IsActivityEligibleForDailyReward(LFG_ACTIVITY_DUNGEON) then
      String = RewardType[3]
    else
      String = RewardType[4]
    end
  end
  if Type == 3 then
    if IsActivityEligibleForDailyReward(LFG_ACTIVITY_BATTLE_GROUND_CHAMPION) 
      or IsActivityEligibleForDailyReward(LFG_ACTIVITY_BATTLE_GROUND_LOW_LEVEL) 
      or IsActivityEligibleForDailyReward(LFG_ACTIVITY_BATTLE_GROUND_NON_CHAMPION) 
    then
      String = RewardType[5]
    else
      String = RewardType[6]
    end
  end
  SetTooltipText(InformationTooltip, String)
end