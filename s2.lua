local Players = game:GetService("Players")
local Names={"ATM", "BIG ATM"}
local plr=game.Players.LocalPlayer
function GetBigAtmCash(Folder)
    local Atms=game:GetService("Workspace").Map.ATM:GetChildren()
    while true do
        
        task.wait()
        if Folder then
            
            if Folder:FindFirstChild("Robux") then
                local c=Folder:FindFirstChild("Robux")
                c.CFrame=plr.Character.HumanoidRootPart.CFrame
                c.CanCollide=false
                fireproximityprompt(c.Attachment.ProximityPrompt, 100)

            else break
            end
            
        end
    end
end
function GetSmallAtmCash(Folder)
    local Atms=game:GetService("Workspace").Map.ATM:GetChildren()
    while true do
        task.wait()
            if Folder:FindFirstChild("Robux") then
                local c=Folder:FindFirstChild("Robux")
                c.CFrame=plr.Character.HumanoidRootPart.CFrame
                c.CanCollide=false
                fireproximityprompt(c.Attachment.ProximityPrompt, 100)

            else break
                
            end
        end
    
end
function NoSameConnection(Connection,valname)---- Function Prevents Double Connections
    local g = getgenv()
    if g[valname]==nil then
    g[valname]=Connection
    print("Connected")
    else
    if typeof(g[valname])=="RBXScriptConnection" then
    g[valname]:Disconnect()
    g[valname]=nil--Just In Case 
    g[valname]=Connection
    print("Reconnected")
    else error([[Needs "RBXScriptConnection" got: ]]..typeof(g[valname])) return
        end
    end    
end


NoSameConnection(game:GetService("UserInputService").InputBegan:Connect(function(v1,v2)
    local Atms=game:GetService("Workspace").Map.ATM:GetChildren()
if v2 then return end    
if v1.KeyCode==Enum.KeyCode.M then
for i,ATM in pairs(Atms) do
    if ATM.Name==Names[2]  then
        print("Big ATM")
        if ATM:FindFirstChild("Cash") then
            if ATM:FindFirstChild("Cash"):FindFirstChild("Robux") then
                
            
            GetBigAtmCash(ATM:FindFirstChild("Cash"))
            print("called")
            end
        end
    elseif ATM.Name==Names[1] then
        if workspace:FindFirstChild("Robux") then
            GetSmallAtmCash(workspace)
            
        end
    end
end
end
end),"h2")
