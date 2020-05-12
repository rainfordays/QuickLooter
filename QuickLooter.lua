local A = CreateFrame("Frame")


A:RegisterEvent("LOOT_READY")

A:SetScript("OnEvent", function(self, event, ...)
	return self[event] and self[event](self, ...)
end)


function A:LOOT_READY(autoloot)
	if autoloot then
		local method, masterPartyID = GetLootMethod()
		if method == "master" and masterPartyID == 0 then return end
		for i = GetNumLootItems(), 1, -1 do
			LootSlot(i)
		end
		CloseLoot()
	end
end
