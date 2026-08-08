--========================================================--
-- Z7X FEATURES
-- ระบบทั้งหมดของ Feature อยู่ไฟล์นี้
-- UI จะเรียกใช้ผ่าน Features.xxx()
--========================================================--

local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer

local Features = {}

--========================================================--
-- ORIGINAL SETTINGS
--========================================================--

local OriginalSettings = {}

local BoostEnabled = false
local FpsEnabled = false

local FpsGui
local FpsLabel
local FpsStroke

local FpsRenderConnection
local FpsColorConnection

--========================================================--
-- SAVE ORIGINAL INSTANCE PROPERTY
--========================================================--

local function SaveProperty(Object, Property)

    if not Object then
        return
    end

    OriginalSettings[Object] = OriginalSettings[Object] or {}

    if OriginalSettings[Object][Property] == nil then

        local Success, Value = pcall(function()
            return Object[Property]
        end)

        if Success then
            OriginalSettings[Object][Property] = Value
        end

    end

end

--========================================================--
-- RESTORE SETTINGS
--========================================================--

local function RestoreSettings()

    for Object, Properties in pairs(OriginalSettings) do

        if Object and Object.Parent then

            for Property, Value in pairs(Properties) do

                pcall(function()
                    Object[Property] = Value
                end)

            end

        end

    end

end

--========================================================--
-- BOOST FPS
--========================================================--

function Features.ToggleBoostFPS(Enabled)

    BoostEnabled = Enabled

    if Enabled then

        --================================================--
        -- LIGHTING
        --================================================--

        SaveProperty(Lighting, "FogEnd")
        SaveProperty(Lighting, "FogStart")
        SaveProperty(Lighting, "GlobalShadows")
        SaveProperty(Lighting, "Brightness")

        pcall(function()
            Lighting.FogEnd = 100000
        end)

        pcall(function()
            Lighting.FogStart = 0
        end)

        pcall(function()
            Lighting.GlobalShadows = false
        end)

        --================================================--
        -- REMOVE POST EFFECTS
        --================================================--

        for _, Object in ipairs(Lighting:GetChildren()) do

            if Object:IsA("BloomEffect")
            or Object:IsA("BlurEffect")
            or Object:IsA("ColorCorrectionEffect")
            or Object:IsA("DepthOfFieldEffect")
            or Object:IsA("SunRaysEffect") then

                SaveProperty(Object, "Enabled")

                pcall(function()
                    Object.Enabled = false
                end)

            end

        end

        --================================================--
        -- TERRAIN
        --================================================--

        local Terrain = Workspace:FindFirstChildOfClass("Terrain")

        if Terrain then

            SaveProperty(Terrain, "WaterWaveSize")
            SaveProperty(Terrain, "WaterWaveSpeed")
            SaveProperty(Terrain, "WaterReflectance")
            SaveProperty(Terrain, "WaterTransparency")

            pcall(function()
                Terrain.WaterWaveSize = 0
                Terrain.WaterWaveSpeed = 0
                Terrain.WaterReflectance = 0
            end)

        end

        --================================================--
        -- MATERIAL
        --================================================--

        for _, Object in ipairs(Workspace:GetDescendants()) do

            if Object:IsA("BasePart") then

                SaveProperty(Object, "Material")

                pcall(function()
                    Object.Material = Enum.Material.SmoothPlastic
                end)

            end

        end

    else

        RestoreSettings()

        -- เก็บค่าที่คืนแล้วออก
        OriginalSettings = {}

    end

end

--========================================================--
-- FPS GUI
--========================================================--

local function CreateFpsGui()

    if FpsGui and FpsGui.Parent then
        return
    end

    FpsGui = Instance.new("ScreenGui")
    FpsGui.Name = "Z7X_FPS"
    FpsGui.ResetOnSpawn = false
    FpsGui.IgnoreGuiInset = true
    FpsGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    FpsGui.Parent = Player:WaitForChild("PlayerGui")

    local Holder = Instance.new("Frame")
    Holder.Name = "Holder"
    Holder.Size = UDim2.fromOffset(145, 42)
    Holder.Position = UDim2.new(1, -160, 0, 18)
    Holder.BackgroundColor3 = Color3.fromRGB(8, 8, 10)
    Holder.BackgroundTransparency = 0.12
    Holder.BorderSizePixel = 0
    Holder.Parent = FpsGui

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Holder

    FpsStroke = Instance.new("UIStroke")
    FpsStroke.Thickness = 2
    FpsStroke.Transparency = 0.05
    FpsStroke.Parent = Holder

    FpsLabel = Instance.new("TextLabel")
    FpsLabel.Size = UDim2.new(1, -20, 1, 0)
    FpsLabel.Position = UDim2.fromOffset(10, 0)
    FpsLabel.BackgroundTransparency = 1
    FpsLabel.Text = "FPS: --"
    FpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    FpsLabel.TextSize = 14
    FpsLabel.Font = Enum.Font.GothamBold
    FpsLabel.TextXAlignment = Enum.TextXAlignment.Center
    FpsLabel.Parent = Holder

end

--========================================================--
-- FPS COUNTER
--========================================================--

function Features.ToggleFpsCounter(Enabled)

    FpsEnabled = Enabled

    if Enabled then

        CreateFpsGui()

        local Frames = 0
        local LastUpdate = os.clock()

        if FpsRenderConnection then
            FpsRenderConnection:Disconnect()
        end

        if FpsColorConnection then
            FpsColorConnection:Disconnect()
        end

        --================================================--
        -- FPS UPDATE
        --================================================--

        FpsRenderConnection = RunService.RenderStepped:Connect(function()

            Frames += 1

            local Now = os.clock()

            if Now - LastUpdate >= 0.5 then

                local FPS = math.floor(
                    Frames / (Now - LastUpdate)
                )

                Frames = 0
                LastUpdate = Now

                if FpsLabel and FpsLabel.Parent then
                    FpsLabel.Text = "FPS: " .. FPS
                end

            end

        end)

        --================================================--
        -- RGB ANIMATION
        --================================================--

        FpsColorConnection = RunService.Heartbeat:Connect(function()

            if FpsStroke and FpsStroke.Parent then

                local Hue = (os.clock() * 0.35) % 1

                FpsStroke.Color = Color3.fromHSV(
                    Hue,
                    0.85,
                    1
                )

            end

        end)

    else

        if FpsRenderConnection then
            FpsRenderConnection:Disconnect()
            FpsRenderConnection = nil
        end

        if FpsColorConnection then
            FpsColorConnection:Disconnect()
            FpsColorConnection = nil
        end

        if FpsGui then
            FpsGui:Destroy()
            FpsGui = nil
        end

        FpsLabel = nil
        FpsStroke = nil

    end

end

--========================================================--
-- CLEANUP
--========================================================--

function Features.Destroy()

    if FpsRenderConnection then
        FpsRenderConnection:Disconnect()
        FpsRenderConnection = nil
    end

    if FpsColorConnection then
        FpsColorConnection:Disconnect()
        FpsColorConnection = nil
    end

    if FpsGui then
        FpsGui:Destroy()
        FpsGui = nil
    end

    if BoostEnabled then
        RestoreSettings()
        BoostEnabled = false
    end

    OriginalSettings = {}

end

--========================================================--
-- RETURN
--========================================================--

return Features
