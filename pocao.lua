macro(100, "CURA AMIGO", function()
  for _, creature in pairs(getSpectators(posz())) do
    local heal_player = creature:getName();
    local friends = storage.uhFriends and storage.uhFriends:split("\n") or {}
    for _, friend in ipairs(friends) do
      if (heal_player == friend) then
        if (creature:getHealthPercent() < tonumber(storage.uhFriendPercent)) then
          useWith(tonumber(storage.uhHealItemId), creature);
          return;
        end
      end
    end
  end
end)

cole = UI.Button("Lista de Amigos", function()
    UI.MultilineEditorWindow(storage.uhFriends or "", {title="Amigos", description="Coloque o nome dos amigos, 1 por linha", width=250, height=200}, function(text)
        storage.uhFriends = text
    end)
end)

addLabel("uhpercent", "HP %")
addTextEdit("uhfriendpercent", storage.uhFriendPercent or "", function(widget, text)
  storage.uhFriendPercent = text
end) 

addLabel("uhealitem", "Item ID") 
addTextEdit("uhhealitemid", storage.uhHealItemId, function(widget, text) 
  storage.uhHealItemId = text
end)
