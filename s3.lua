
function NoSameConnection(Connection,valname)---- Function Prevents Double Connections
    local g = getgenv()
    if g[valname]==nil then
    g[valname]=Connection
    print("Connected")
    else
    if typeof(g[valname])=="RBXScriptConnection" then
    g[valname]:Disconnect()
    g[valname]=Connection
    print("Reconnected")
    else error([[Needs "RBXScriptConnection" got: ]]..typeof(g[valname])) return
        end
    end    
end

local RS=game:GetService("RunService")

---["Safety Deposit"].Main.SafetyEarning

function RobDeposit(SafetyEarning)
    
    while true do
        game:GetService("RunService").RenderStepped:Wait()
        if SafetyEarning then
           for i,v in pairs(SafetyEarning:GetChildren()) do
               if v.Name~="PRIMARY" then
                   fireproximityprompt(v.Attachment.ProximityPrompt)
                end
            end
        else print("Exit") break
        end
        
        
    end

end


local UIS=game:GetService("UserInputService")
local plr=game.Players.LocalPlayer
local M=function() 
return UIS:IsKeyDown(Enum.KeyCode.M)    
end

function IB(loc1,loc2)
    if loc2 then return end
    
    if M() then
       local Deposits=game:GetService("Workspace").Map.CITY.Bank:GetChildren()
       for i,Safety_Deposit in pairs(Deposits) do
           if Safety_Deposit.Name=="Safety Deposit" then
               if Safety_Deposit.Main:FindFirstChild("SafetyEarning") then
                   local tar=Safety_Deposit.Main:FindFirstChild("SafetyEarning") 
                   RobDeposit(tar)
                   
                else print("NoStuff")
                end
            end
        end
       
        
    end
    
    
end
NoSameConnection(UIS.InputBegan:Connect(IB),"ic_7")




