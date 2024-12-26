local function ProtectGUI(gui)
    if syn and syn.protect_gui then
        syn.protect_gui(gui)
        gui.Parent = game.CoreGui
    else
        gui.Parent = game.CoreGui or game.Players.LocalPlayer:WaitForChild("PlayerGui")
    end
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local TweenService = game:GetService("TweenService")

-- Cria a GUI principal
local OvoHubGUI = Instance.new("ScreenGui")
OvoHubGUI.Name = "OvoHubGUI"
ProtectGUI(OvoHubGUI)

-- Função Tween
local function TweenObject(obj, props, time)
    local twInfo = TweenInfo.new(time, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local tween = TweenService:Create(obj, twInfo, props)
    tween:Play()
    return tween
end

-- Notificação de 5s
local NotificationFrame = Instance.new("Frame")
NotificationFrame.Name = "NotificationFrame"
NotificationFrame.Parent = OvoHubGUI
NotificationFrame.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
NotificationFrame.BorderSizePixel = 0
NotificationFrame.Size = UDim2.new(0, 250, 0, 50)
NotificationFrame.AnchorPoint = Vector2.new(0.5, 0)
NotificationFrame.Position = UDim2.new(0.5, 0, 0, -60)
NotificationFrame.BackgroundTransparency = 0.1

local NotificationCorner = Instance.new("UICorner", NotificationFrame)
NotificationCorner.CornerRadius = UDim.new(0, 10)

local NotificationText = Instance.new("TextLabel")
NotificationText.Parent = NotificationFrame
NotificationText.Size = UDim2.new(1, 0, 1, 0)
NotificationText.BackgroundTransparency = 1
NotificationText.TextColor3 = Color3.new(1,1,1)
NotificationText.Font = Enum.Font.SourceSansBold
NotificationText.TextSize = 18
NotificationText.TextWrapped = true
NotificationText.Text = "OVO abriu; Cartola caiu"

TweenObject(NotificationFrame, {Position = UDim2.new(0.5, 0, 0, 20)}, 0.5)

task.delay(5, function()
    TweenObject(NotificationFrame, {Position = UDim2.new(0.5, 0, 0, -80)}, 0.5).Completed:Connect(function()
        NotificationFrame.Visible = false
    end)
end)

-- Frame principal
local MainFrame = Instance.new("Frame")
MainFrame.Parent = OvoHubGUI
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 0, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Size = UDim2.new(0, 550, 0, 380)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundTransparency = 0.05

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 15)

local BgImage = Instance.new("ImageLabel")
BgImage.Parent = MainFrame
BgImage.Size = UDim2.new(1, 0, 1, 0)
BgImage.Position = UDim2.new(0, 0, 0, 0)
BgImage.BackgroundTransparency = 1
BgImage.ImageTransparency = 0.8
BgImage.Image = "rbxassetid://7135464327"

-- TopBar
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 40)

local TopCorner = Instance.new("UICorner", TopBar)
TopCorner.CornerRadius = UDim.new(0, 15)

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.Size = UDim2.new(1, -80, 1, 0)
TitleLabel.Position = UDim2.new(0, 10, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "OVO HUB"
TitleLabel.TextColor3 = Color3.new(1,1,1)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 24
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Botão Fechar
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TopBar
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 20
CloseButton.TextColor3 = Color3.new(1,1,1)

local CloseCorner = Instance.new("UICorner", CloseButton)
CloseCorner.CornerRadius = UDim.new(0, 15)

local ConfirmFrame = Instance.new("Frame")
ConfirmFrame.Parent = OvoHubGUI
ConfirmFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
ConfirmFrame.BackgroundTransparency = 0.5
ConfirmFrame.Size = UDim2.new(1, 0, 1, 0)
ConfirmFrame.Visible = false

local ConfirmBox = Instance.new("Frame")
ConfirmBox.Parent = ConfirmFrame
ConfirmBox.Size = UDim2.new(0, 220, 0, 120)
ConfirmBox.AnchorPoint = Vector2.new(0.5, 0.5)
ConfirmBox.Position = UDim2.new(0.5, 0, 0.5, 0)
ConfirmBox.BackgroundColor3 = Color3.fromRGB(40, 0, 60)

local ConfirmCorner = Instance.new("UICorner", ConfirmBox)
ConfirmCorner.CornerRadius = UDim.new(0, 10)

local ConfirmText = Instance.new("TextLabel")
ConfirmText.Parent = ConfirmBox
ConfirmText.Size = UDim2.new(1, 0, 0, 60)
ConfirmText.BackgroundTransparency = 1
ConfirmText.TextColor3 = Color3.new(1,1,1)
ConfirmText.Font = Enum.Font.SourceSansBold
ConfirmText.TextSize = 18
ConfirmText.Text = "Fechar Ovo Hub?"
ConfirmText.Position = UDim2.new(0, 0, 0, 10)

local YesBtn = Instance.new("TextButton")
YesBtn.Parent = ConfirmBox
YesBtn.Size = UDim2.new(0.5, 0, 0, 40)
YesBtn.Position = UDim2.new(0, 0, 1, -40)
YesBtn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
YesBtn.Text = "Sim"
YesBtn.Font = Enum.Font.SourceSansBold
YesBtn.TextColor3 = Color3.new(1,1,1)
YesBtn.TextSize = 18

local NoBtn = Instance.new("TextButton")
NoBtn.Parent = ConfirmBox
NoBtn.Size = UDim2.new(0.5, 0, 0, 40)
NoBtn.Position = UDim2.new(0.5, 0, 1, -40)
NoBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 80)
NoBtn.Text = "Não"
NoBtn.Font = Enum.Font.SourceSansBold
NoBtn.TextColor3 = Color3.new(1,1,1)
NoBtn.TextSize = 18

local YesCorner = Instance.new("UICorner", YesBtn)
YesCorner.CornerRadius = UDim.new(0, 8)
local NoCorner = Instance.new("UICorner", NoBtn)
NoCorner.CornerRadius = UDim.new(0, 8)

CloseButton.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = true
end)

YesBtn.MouseButton1Click:Connect(function()
    OvoHubGUI:Destroy()
end)

NoBtn.MouseButton1Click:Connect(function()
    ConfirmFrame.Visible = false
end)

-- Minimizar
local MinButton = Instance.new("TextButton")
MinButton.Parent = TopBar
MinButton.Size = UDim2.new(0, 40, 0, 40)
MinButton.Position = UDim2.new(1, -80, 0, 0)
MinButton.BackgroundColor3 = Color3.fromRGB(80, 0, 100)
MinButton.Text = "-"
MinButton.Font = Enum.Font.SourceSansBold
MinButton.TextSize = 20
MinButton.TextColor3 = Color3.new(1,1,1)

local MinCorner = Instance.new("UICorner", MinButton)
MinCorner.CornerRadius = UDim.new(0, 15)

local EggIcon = Instance.new("ImageButton")
EggIcon.Parent = OvoHubGUI
EggIcon.Size = UDim2.new(0, 50, 0, 50)
EggIcon.AnchorPoint = Vector2.new(0.5, 0.5)
EggIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
EggIcon.BackgroundTransparency = 1
EggIcon.Image = "rbxassetid://1865943639"
EggIcon.Visible = false

local Minimizado = false
local function Minimize()
    Minimizado = true
    TweenObject(MainFrame, {Size = UDim2.new(0, 0, 0, 0)}, 0.3).Completed:Connect(function()
        MainFrame.Visible = false
        EggIcon.Visible = true
    end)
end

local function Restore()
    Minimizado = false
    MainFrame.Visible = true
    EggIcon.Visible = false
    TweenObject(MainFrame, {Size = UDim2.new(0, 550, 0, 380)}, 0.3)
end

MinButton.MouseButton1Click:Connect(function()
    if not Minimizado then
        Minimize()
    end
end)

EggIcon.MouseButton1Click:Connect(function()
    if Minimizado then
        Restore()
    end
end)

-- Tabs
local TabsHolder = Instance.new("Frame")
TabsHolder.Parent = MainFrame
TabsHolder.BackgroundColor3 = Color3.fromRGB(20, 0, 40)
TabsHolder.BorderSizePixel = 0
TabsHolder.Position = UDim2.new(0, 0, 0, 40)
TabsHolder.Size = UDim2.new(1, 0, 1, -40)

local TabsCorner = Instance.new("UICorner", TabsHolder)
TabsCorner.CornerRadius = UDim.new(0, 15)

local TabBar = Instance.new("Frame")
TabBar.Parent = TabsHolder
TabBar.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
TabBar.Size = UDim2.new(1, 0, 0, 40)

local TabBarCorner = Instance.new("UICorner", TabBar)
TabBarCorner.CornerRadius = UDim.new(0, 15)

local Tab1Button = Instance.new("TextButton")
Tab1Button.Parent = TabBar
Tab1Button.BackgroundColor3 = Color3.fromRGB(70, 0, 120)
Tab1Button.Size = UDim2.new(0.5, 0, 1, 0)
Tab1Button.Text = "OVO ADM"
Tab1Button.Font = Enum.Font.SourceSansBold
Tab1Button.TextSize = 18
Tab1Button.TextColor3 = Color3.new(1,1,1)

local Tab1Corner = Instance.new("UICorner", Tab1Button)
Tab1Corner.CornerRadius = UDim.new(0, 15)

local Tab2Button = Instance.new("TextButton")
Tab2Button.Parent = TabBar
Tab2Button.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
Tab2Button.Size = UDim2.new(0.5, 0, 1, 0)
Tab2Button.Position = UDim2.new(0.5, 0, 0, 0)
Tab2Button.Text = "OVO TROLL"
Tab2Button.Font = Enum.Font.SourceSansBold
Tab2Button.TextSize = 18
Tab2Button.TextColor3 = Color3.new(1,1,1)

local Tab2Corner = Instance.new("UICorner", Tab2Button)
Tab2Corner.CornerRadius = UDim.new(0, 15)

local Tab1Frame = Instance.new("ScrollingFrame")
Tab1Frame.Parent = TabsHolder
Tab1Frame.BackgroundColor3 = Color3.fromRGB(30, 0, 60)
Tab1Frame.Position = UDim2.new(0, 0, 0, 40)
Tab1Frame.Size = UDim2.new(1, 0, 1, -40)
Tab1Frame.Visible = true
Tab1Frame.ScrollBarThickness = 6
Tab1Frame.BorderSizePixel = 0

local Layout1 = Instance.new("UIListLayout", Tab1Frame)
Layout1.Padding = UDim.new(0, 5)
Layout1.HorizontalAlignment = Enum.HorizontalAlignment.Center

local Tab1FrameCorner = Instance.new("UICorner", Tab1Frame)
Tab1FrameCorner.CornerRadius = UDim.new(0, 15)

local Tab2Frame = Instance.new("ScrollingFrame")
Tab2Frame.Parent = TabsHolder
Tab2Frame.BackgroundColor3 = Color3.fromRGB(30, 0, 60)
Tab2Frame.Position = UDim2.new(0, 0, 0, 40)
Tab2Frame.Size = UDim2.new(1, 0, 1, -40)
Tab2Frame.Visible = false
Tab2Frame.ScrollBarThickness = 6
Tab2Frame.BorderSizePixel = 0

local Layout2 = Instance.new("UIListLayout", Tab2Frame)
Layout2.Padding = UDim.new(0, 5)
Layout2.HorizontalAlignment = Enum.HorizontalAlignment.Center

local Tab2FrameCorner = Instance.new("UICorner", Tab2Frame)
Tab2FrameCorner.CornerRadius = UDim.new(0, 15)

local function ShowTab1()
    Tab1Button.BackgroundColor3 = Color3.fromRGB(70, 0, 120)
    Tab2Button.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    Tab1Frame.Visible = true
    Tab2Frame.Visible = false
end

local function ShowTab2()
    Tab1Button.BackgroundColor3 = Color3.fromRGB(50, 0, 80)
    Tab2Button.BackgroundColor3 = Color3.fromRGB(70, 0, 120)
    Tab1Frame.Visible = false
    Tab2Frame.Visible = true
end

Tab1Button.MouseButton1Click:Connect(ShowTab1)
Tab2Button.MouseButton1Click:Connect(ShowTab2)

-- Função de criar botões
local function CreateButton(parent, text, callback)
    local B = Instance.new("TextButton")
    B.Parent = parent
    B.Size = UDim2.new(0, 500, 0, 40)
    B.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
    B.Text = text
    B.Font = Enum.Font.SourceSansBold
    B.TextSize = 18
    B.TextColor3 = Color3.new(1,1,1)
    B.BorderSizePixel = 0
    local BC = Instance.new("UICorner", B)
    BC.CornerRadius = UDim.new(0, 10)
    B.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
    parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y + 20)
    parent.UIListLayout.Changed:Connect(function()
        parent.CanvasSize = UDim2.new(0, 0, 0, parent.UIListLayout.AbsoluteContentSize.Y + 20)
    end)
end

-- Mini-botões no TopBar (pra desligar scripts)
local function CreateToggleInTopBar(n, dc)
    local TB = Instance.new("TextButton")
    TB.Name = n.."Toggle"
    TB.Parent = TopBar
    TB.Size = UDim2.new(0, 60, 0, 30)
    TB.AnchorPoint = Vector2.new(1, 0)
    local c = #TopBar:GetChildren()
    local offset = 40*c
    TB.Position = UDim2.new(1, -80-offset, 0, 5)
    TB.BackgroundColor3 = Color3.fromRGB(100, 0, 100)
    TB.Text = "-"..n
    TB.Font = Enum.Font.SourceSansBold
    TB.TextSize = 14
    TB.TextColor3 = Color3.new(1,1,1)
    local TBC = Instance.new("UICorner", TB)
    TBC.CornerRadius = UDim.new(0, 8)
    TB.MouseButton1Click:Connect(function()
        pcall(dc)
        TB:Destroy()
    end)
    return TB
end

-- BOTÕES DA ABA OVO ADM
CreateButton(Tab1Frame, "Imprimir Mensagem", function()
    print("Olá Mundo! (Ovo Hub)")
end)

CreateButton(Tab1Frame, "Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    CreateToggleInTopBar("InfYield", function() end)
end)

local superSpeed = false
CreateButton(Tab1Frame, "Toggle Velocidade 100/16", function()
    superSpeed = not superSpeed
    local H = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if H then
        H.WalkSpeed = superSpeed and 100 or 16
    end
    if superSpeed then
        CreateToggleInTopBar("SuperSpeed", function()
            superSpeed = false
            if H then
                H.WalkSpeed = 16
            end
        end)
    end
end)

CreateButton(Tab1Frame, "Pulo Super (100)", function()
    local H = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if H then
        H.JumpPower = 100
    end
    CreateToggleInTopBar("SuperJump", function()
        if H then
            H.JumpPower = 50
        end
    end)
end)

CreateButton(Tab1Frame, "Velocidade 50", function()
    local H = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if H then
        H.WalkSpeed = 50
    end
end)

CreateButton(Tab1Frame, "Velocidade 16", function()
    local H = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if H then
        H.WalkSpeed = 16
    end
end)

CreateButton(Tab1Frame, "Gravidade Baixa (50)", function()
    workspace.Gravity = 50
    CreateToggleInTopBar("Grav50", function()
        workspace.Gravity = 196.2
    end)
end)

CreateButton(Tab1Frame, "Gravidade Normal (196.2)", function()
    workspace.Gravity = 196.2
end)

CreateButton(Tab1Frame, "Invisibilidade", function()
    local C = LocalPlayer.Character
    if C then
        for _, p in pairs(C:GetChildren()) do
            if p:IsA("BasePart") then
                p.Transparency = 1
            end
        end
    end
    CreateToggleInTopBar("Invisible", function()
        if C then
            for _, p in pairs(C:GetChildren()) do
                if p:IsA("BasePart") then
                    p.Transparency = 0
                end
            end
        end
    end)
end)

CreateButton(Tab1Frame, "Cor Bright pink", function()
    local C = LocalPlayer.Character
    if C then
        for _, p in pairs(C:GetChildren()) do
            if p:IsA("BasePart") then
                p.BrickColor = BrickColor.new("Bright pink")
            end
        end
    end
    CreateToggleInTopBar("PinkSkin", function()
        if C then
            for _, p in pairs(C:GetChildren()) do
                if p:IsA("BasePart") then
                    p.BrickColor = BrickColor.new("Medium stone grey")
                end
            end
        end
    end)
end)

-- BOTÕES DA ABA OVO TROLL
CreateButton(Tab2Frame, "Fling", function()
    local C = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HRP = C:WaitForChild("HumanoidRootPart")
    HRP:ApplyImpulse(Vector3.new(0, 100, 0)*500)
    CreateToggleInTopBar("Fling", function() end)
end)

CreateButton(Tab2Frame, "Fling All", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
    CreateToggleInTopBar("FlingAll", function() end)
end)

CreateButton(Tab2Frame, "Anti-Fling", function()
    local C = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local H = C:WaitForChild("Humanoid")
    H.PlatformStand = true
    CreateToggleInTopBar("AntiFling", function()
        H.PlatformStand = false
    end)
end)

CreateButton(Tab2Frame, "Carro Voador Drift", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()
    CreateToggleInTopBar("CarDrift", function() end)
end)

CreateButton(Tab2Frame, "F para tu", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_5wpM7bBcOPspmX7lQ3m75SrYNWqxZ858ai3tJdEAId6jSI05IOUB224FQ0VSAswH.lua.txt'))()
    CreateToggleInTopBar("F_tu", function() end)
end)

-- Aimbot
local AimActive = false
local aimCircle = nil
local hue = 0
CreateButton(Tab2Frame, "AimSilence (Oco)", function()
    if not Drawing then return end
    AimActive = true
    aimCircle = Drawing.new("Circle")
    aimCircle.Visible = true
    aimCircle.Radius = 45
    aimCircle.Thickness = 2
    aimCircle.Filled = false
    local centerPos = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    aimCircle.Position = centerPos

    local rsConn
    rsConn = RunService.RenderStepped:Connect(function()
        centerPos = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        aimCircle.Position = centerPos
        hue = (hue + 0.5) % 360
        aimCircle.Color = Color3.fromHSV(hue/360, 0.5, 1)
    end)

    local function getClosest()
        local cdist = math.huge
        local cchar = nil
        for _,plr in pairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = plr.Character.HumanoidRootPart
                local pos,onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local dist=(Vector2.new(pos.X,pos.Y)-centerPos).magnitude
                    if dist<45 and dist<cdist then
                        cdist=dist
                        cchar=plr.Character
                    end
                end
            end
        end
        return cchar
    end

    local abConn
    abConn = RunService.Stepped:Connect(function()
        if not AimActive then abConn:Disconnect() end
        local tgt = getClosest()
        if tgt and tgt:FindFirstChild("HumanoidRootPart") then
            local hrp = tgt.HumanoidRootPart
            local newCF = CFrame.lookAt(Camera.CFrame.Position, hrp.Position)
            Camera.CFrame = Camera.CFrame:Lerp(newCF, 0.3)
        end
    end)

    CreateToggleInTopBar("Aimbot", function()
        AimActive=false
        if aimCircle then
            aimCircle.Visible=false
            aimCircle:Remove()
        end
        if rsConn then rsConn:Disconnect() end
    end)
end)

-- WALL / ESP
local espActive=false
local espObjects={}

local function createLine()
    local L = Drawing.new("Line")
    L.Thickness = 2
    L.Visible = true
    L.Transparency = 0.7
    return L
end

local function rainbowColor(h)
    return Color3.fromHSV(h/360,0.4,1)
end

-- Precisamos criar um "dummyPart" caso o HRP suma
local function createDummyPart(pos)
    local part = Instance.new("Part")
    part.Name = "OvoDummyPart"
    part.Size = Vector3.new(0.1,0.1,0.1)
    part.Anchored = true
    part.CanCollide = false
    part.Transparency = 1
    part.CFrame = CFrame.new(pos)
    part.Parent = workspace
    return part
end

local function createESP(pl)
    if pl==LocalPlayer then return end

    local bill = Instance.new("BillboardGui")
    bill.AlwaysOnTop=true
    bill.Size=UDim2.new(0,200,0,50)
    bill.StudsOffset=Vector3.new(0,3,0)

    local txt = Instance.new("TextLabel")
    txt.Size=UDim2.new(1,0,1,0)
    txt.BackgroundTransparency=1
    txt.Font=Enum.Font.SourceSansBold
    txt.TextSize=14
    txt.TextColor3=Color3.new(1,1,1)
    txt.Text=""
    txt.RichText=true
    txt.Parent=bill

    local arrow=Instance.new("Frame")
    arrow.Size=UDim2.new(0,10,0,10)
    arrow.Position=UDim2.new(0.5,-5,1,-10)
    arrow.BackgroundColor3=Color3.fromRGB(170,0,170)
    arrow.BorderSizePixel=0
    arrow.Parent=bill

    local arrowCorner=Instance.new("UICorner", arrow)
    arrowCorner.CornerRadius=UDim.new(1,0)

    local line = createLine()
    local hue2=0
    local lastPos=nil
    local dummyPart=nil

    local data={
        player=pl,
        billboard=bill,
        text=txt,
        arrow=arrow,
        line=line,
        hue=hue2,
        dummyPart=dummyPart,
        update=function(self)
            local character = pl.Character
            local hrp = character and character:FindFirstChild("HumanoidRootPart")
            local hum = character and character:FindFirstChild("Humanoid")

            if hrp then
                lastPos = hrp.Position
                -- Se tem HRP, parenta a billboard a ele
                self.billboard.Adornee = hrp
                self.billboard.Parent = hrp
                if self.dummyPart then
                    self.dummyPart:Destroy()
                    self.dummyPart=nil
                end
            else
                -- Se não tem HRP, cai no fallback
                -- Precisamos criar um dummyPart se não existir
                if not self.dummyPart then
                    local fallbackPos = lastPos or Vector3.new(0,0,0)
                    self.dummyPart=createDummyPart(fallbackPos)
                    self.billboard.Adornee=self.dummyPart
                    self.billboard.Parent=self.dummyPart
                end
            end

            local dist=0
            local lhrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if lhrp then
                if hrp then
                    dist=(lhrp.Position-hrp.Position).Magnitude
                else
                    dist=(lhrp.Position-(lastPos or Vector3.new())).Magnitude
                end
            end

            local HP=0
            if hum then
                HP=hum.Health
            end
            local HPfmt=string.format("%07.2f", HP)
            self.text.Text=string.format("%s\nHP:%s\nDist:%07.2f", pl.Name, HPfmt, dist)

            -- Arco-íris suave
            self.hue=(self.hue+0.5)%360
            local c=rainbowColor(self.hue)
            local str=self.text.Text
            local final=""
            local h2=0
            for i=1,#str do
                local ch=str:sub(i,i)
                h2=(h2+20)%360
                local ccol=Color3.fromHSV(h2/360,0.4,1)
                local hex=string.format("%02X%02X%02X", math.floor(ccol.R*255), math.floor(ccol.G*255), math.floor(ccol.B*255))
                final=final.."<font color='#"..hex.."'>"..ch.."</font>"
            end
            self.text.Text=final

            arrow.BackgroundColor3=c

            if lhrp then
                local me = lhrp.Position - Vector3.new(0,3,0)
                local them
                if hrp then
                    them=hrp.Position-Vector3.new(0,3,0)
                else
                    them=(lastPos or Vector3.new())-Vector3.new(0,3,0)
                end

                local pt1 = Camera:WorldToViewportPoint(me)
                local pt2 = Camera:WorldToViewportPoint(them)
                self.line.From=pt1
                self.line.To=pt2
                self.line.Color=c
                self.line.Visible=true
            else
                self.line.Visible=false
            end
        end
    }
    table.insert(espObjects,data)

    -- Se o player tem HRP, parenta
    if pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") then
        bill.Adornee=pl.Character.HumanoidRootPart
        bill.Parent=pl.Character.HumanoidRootPart
    else
        local fallbackPos = pl.Character and pl.Character:FindFirstChild("HumanoidRootPart") and pl.Character.HumanoidRootPart.Position or Vector3.new()
        data.dummyPart = createDummyPart(fallbackPos)
        bill.Adornee=data.dummyPart
        bill.Parent=data.dummyPart
    end
end

local function removeESP(pl)
    for i,v in pairs(espObjects) do
        if v.player==pl then
            if v.billboard then
                v.billboard:Destroy()
            end
            if v.line then
                v.line.Visible=false
                v.line:Remove()
            end
            if v.dummyPart then
                v.dummyPart:Destroy()
            end
            table.remove(espObjects,i)
            break
        end
    end
end

local espActive=false

local function enableESP()
    espActive=true
    for _,p in pairs(Players:GetPlayers()) do
        if p~=LocalPlayer then
            createESP(p)
        end
    end
    Players.PlayerAdded:Connect(function(plr)
        if espActive and plr~=LocalPlayer then
            createESP(plr)
        end
    end)
    Players.PlayerRemoving:Connect(function(plr)
        removeESP(plr)
    end)
    RunService.Heartbeat:Connect(function()
        if not espActive then return end
        for _,o in pairs(espObjects) do
            o:update()
        end
    end)
end

local function disableESP()
    espActive=false
    for _,v in pairs(espObjects) do
        if v.billboard then
            v.billboard:Destroy()
        end
        if v.line then
            v.line.Visible=false
            v.line:Remove()
        end
        if v.dummyPart then
            v.dummyPart:Destroy()
        end
    end
    espObjects={}
end

CreateButton(Tab2Frame, "Ativar Wall (Permanece após morte)", function()
    enableESP()
    CreateToggleInTopBar("ESP", function()
        disableESP()
    end)
end)

print("OVO Hub Carregado! Wall (ESP) agora permanece mesmo após a morte do alvo.")
