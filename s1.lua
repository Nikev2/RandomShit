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
local UIS=game:GetService("UserInputService")
local Key=function()
    return UIS:IsKeyDown(Enum.KeyCode.M)
end
local plr=game.Players.LocalPlayer

local Casino=game:GetService("Workspace").Map.Casino

function GetAllCash(SlotCash)
    local Main=SlotCash.Parent
    while true do 
    task.wait()
    if SlotCash then
        if SlotCash:FindFirstChild("Robux") then
            local robux=SlotCash:FindFirstChild("Robux")
            
            fireproximityprompt(robux.Attachment.ProximityPrompt,100)
        else
            print("Exit")
            break 
        end
    end
    end
   
end

function Input(v_1,v_2)
if v_2 then return false end 
if v_1.KeyCode==Enum.KeyCode.M then
    
   
for i,v in pairs(Casino:GetChildren()) do
    if v.Name=="Slot Machine" then
        
        for i,vv in pairs(v.Main:GetChildren()) do
            if vv.Name=="SlotCash" then
                
                
               GetAllCash(vv)
                end
            end
        end
    end
end
end
NoSameConnection(UIS.InputBegan:Connect(Input),"h1")
