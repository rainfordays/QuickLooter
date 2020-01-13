local addon = CreateFrame("Frame")


addon:RegisterEvent("LOOT_READY")

addon:SetScript("OnEvent", function(self, event, ...)
  return self[event] and self[event](self, ...)
end)


function addon:LOOT_READY(autoloot)
	if autoloot then
    local lootmethod, lootmasterPartyID = GetLootMethod()
    if lootmethod == "master" and lootmasterPartyID == 0 then return end
		for i = 1, GetNumLootItems() do
			LootSlot(i)
		end
	end
end
