--========================================================--
-- Z7X ANIME GRUNGE UI
-- UI ONLY
-- ระบบจริงอยู่ใน features.lua
--========================================================--

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer

--========================================================--
-- LOAD FEATURES
--========================================================--

-- สำคัญ:
-- ไฟล์ features.lua ต้องอยู่ตำแหน่งเดียวกับ ui.lua
-- และต้องเป็น ModuleScript

local Features = require(script.Parent:WaitForChild("features"))

--========================================================--
-- SETTINGS
--========================================================--

local WIDTH = 520
local HEIGHT = 455

local YELLOW = Color3.fromRGB(255, 210, 48)
local WHITE = Color3.fromRGB(238, 238, 240)
local GRAY = Color3.fromRGB(125, 125, 132)
local DARK_GRAY = Color3.fromRGB(48, 48, 53)

local BLACK = Color3.fromRGB(7, 7, 9)
local SIDEBAR_COLOR = Color3.fromRGB(11, 11, 14)
local PANEL = Color3.fromRGB(17, 17, 21)
local PANEL_HOVER = Color3.fromRGB(31, 29, 22)

--========================================================--
-- GUI
--========================================================--

local Gui = Instance.new("ScreenGui")
Gui.Name = "Z7X_AnimeUI"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = Player:WaitForChild("PlayerGui")

--========================================================--
-- BOOT SOUND
--========================================================--

local BootSound = Instance.new("Sound")
BootSound.Name = "BootSound"

-- ใส่ SoundId ตรงนี้
-- BootSound.SoundId = "rbxassetid://ใส่ไอดีเสียง"

BootSound.Volume = 0.5
BootSound.Parent = Gui

--========================================================--
-- MAIN
--========================================================--

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(WIDTH, HEIGHT)
Main.Position = UDim2.new(
    0.5,
    -WIDTH / 2,
    0.5,
    -HEIGHT / 2
)
Main.BackgroundColor3 = BLACK
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 18)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = YELLOW
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.25
MainStroke.Parent = Main

--========================================================--
-- DECORATION
--========================================================--

local Glow = Instance.new("Frame")
Glow.Size = UDim2.fromOffset(300, 300)
Glow.Position = UDim2.new(1, -150, 0, -140)
Glow.BackgroundColor3 = YELLOW
Glow.BackgroundTransparency = 0.94
Glow.BorderSizePixel = 0
Glow.Rotation = 25
Glow.Parent = Main

local GlowCorner = Instance.new("UICorner")
GlowCorner.CornerRadius = UDim.new(1, 0)
GlowCorner.Parent = Glow

local Slash = Instance.new("Frame")
Slash.Size = UDim2.fromOffset(240, 3)
Slash.Position = UDim2.new(1, -230, 0, 77)
Slash.BackgroundColor3 = YELLOW
Slash.BackgroundTransparency = 0.15
Slash.Rotation = -8
Slash.BorderSizePixel = 0
Slash.Parent = Main

--========================================================--
-- SIDEBAR
--========================================================--

local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 82, 1, 0)
Sidebar.BackgroundColor3 = SIDEBAR_COLOR
Sidebar.BorderSizePixel = 0
Sidebar.Parent = Main

local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, -32)
SidebarLine.Position = UDim2.new(1, -1, 0, 16)
SidebarLine.BackgroundColor3 = YELLOW
SidebarLine.BackgroundTransparency = 0.45
SidebarLine.BorderSizePixel = 0
SidebarLine.Parent = Sidebar

--========================================================--
-- LOGO
--========================================================--

local Logo = Instance.new("TextLabel")
Logo.Size = UDim2.new(1, 0, 0, 40)
Logo.Position = UDim2.fromOffset(0, 18)
Logo.BackgroundTransparency = 1
Logo.Text = "Z7X"
Logo.TextColor3 = YELLOW
Logo.TextSize = 25
Logo.Font = Enum.Font.GothamBlack
Logo.Parent = Sidebar

local LogoSub = Instance.new("TextLabel")
LogoSub.Size = UDim2.new(1, 0, 0, 16)
LogoSub.Position = UDim2.fromOffset(0, 55)
LogoSub.BackgroundTransparency = 1
LogoSub.Text = "SYSTEM"
LogoSub.TextColor3 = GRAY
LogoSub.TextSize = 7
LogoSub.Font = Enum.Font.GothamBold
LogoSub.Parent = Sidebar

--========================================================--
-- HEADER
--========================================================--

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, -104, 0, 66)
Header.Position = UDim2.fromOffset(94, 0)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -110, 0, 30)
Title.Position = UDim2.fromOffset(0, 12)
Title.BackgroundTransparency = 1
Title.Text = "HOME"
Title.TextColor3 = WHITE
Title.TextSize = 23
Title.Font = Enum.Font.GothamBlack
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1, -110, 0, 18)
Subtitle.Position = UDim2.fromOffset(1, 41)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "ANIME GRUNGE INTERFACE"
Subtitle.TextColor3 = YELLOW
Subtitle.TextSize = 8
Subtitle.Font = Enum.Font.GothamBold
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

--========================================================--
-- MINIMIZE
--========================================================--

local Minimize = Instance.new("TextButton")
Minimize.Name = "Minimize"
Minimize.Size = UDim2.fromOffset(38, 38)
Minimize.Position = UDim2.new(1, -92, 0, 14)
Minimize.BackgroundColor3 = PANEL
Minimize.BorderSizePixel = 0
Minimize.Text = "—"
Minimize.TextColor3 = GRAY
Minimize.TextSize = 20
Minimize.Font = Enum.Font.GothamBold
Minimize.AutoButtonColor = false
Minimize.Parent = Header

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 11)
MinCorner.Parent = Minimize

--========================================================--
-- CLOSE
--========================================================--

local Close = Instance.new("TextButton")
Close.Name = "Close"
Close.Size = UDim2.fromOffset(38, 38)
Close.Position = UDim2.new(1, -48, 0, 14)
Close.BackgroundColor3 = PANEL
Close.BorderSizePixel = 0
Close.Text = "×"
Close.TextColor3 = GRAY
Close.TextSize = 24
Close.Font = Enum.Font.GothamBold
Close.AutoButtonColor = false
Close.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 11)
CloseCorner.Parent = Close

--========================================================--
-- PAGE CONTAINER
--========================================================--

local PageContainer = Instance.new("Frame")
PageContainer.Name = "Pages"
PageContainer.Size = UDim2.new(1, -104, 1, -92)
PageContainer.Position = UDim2.fromOffset(94, 78)
PageContainer.BackgroundTransparency = 1
PageContainer.ClipsDescendants = true
PageContainer.Parent = Main

local Pages = {}

local function CreatePage(Name)

    local Page = Instance.new("ScrollingFrame")
    Page.Name = Name
    Page.Size = UDim2.new(1, 0, 1, 0)
    Page.BackgroundTransparency = 1
    Page.BorderSizePixel = 0
    Page.ScrollBarThickness = 2
    Page.ScrollBarImageColor3 = YELLOW
    Page.CanvasSize = UDim2.new(0, 0, 0, 0)
    Page.Visible = false
    Page.Parent = PageContainer

    local Padding = Instance.new("UIPadding")
    Padding.PaddingRight = UDim.new(0, 8)
    Padding.PaddingBottom = UDim.new(0, 15)
    Padding.Parent = Page

    local Layout = Instance.new("UIListLayout")
    Layout.Padding = UDim.new(0, 9)
    Layout.SortOrder = Enum.SortOrder.LayoutOrder
    Layout.Parent = Page

    Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()

        Page.CanvasSize = UDim2.new(
            0,
            0,
            0,
            Layout.AbsoluteContentSize.Y + 20
        )

    end)

    Pages[Name] = Page

    return Page
end

--========================================================--
-- SECTION
--========================================================--

local function AddSection(Page, Text)

    local Section = Instance.new("TextLabel")
    Section.Size = UDim2.new(1, 0, 0, 23)
    Section.BackgroundTransparency = 1
    Section.Text = "// " .. Text
    Section.TextColor3 = YELLOW
    Section.TextSize = 9
    Section.Font = Enum.Font.GothamBold
    Section.TextXAlignment = Enum.TextXAlignment.Left
    Section.Parent = Page

    return Section
end

--========================================================--
-- FEATURE BUTTON
--========================================================--
--
-- ระบบจริงทั้งหมดอยู่ใน features.lua
--
-- UI จะส่ง Enabled ให้ features.lua
--
-- true  = เปิด
-- false = ปิด
--
--========================================================--

local function AddButton(Page, Text, FeatureFunction)

    local Button = Instance.new("TextButton")
    Button.Name = Text
    Button.Size = UDim2.new(1, 0, 0, 53)
    Button.BackgroundColor3 = PANEL
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.Parent = Page

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 11)
    Corner.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = Color3.fromRGB(45,45,50)
    Stroke.Thickness = 1
    Stroke.Parent = Button

    local Accent = Instance.new("Frame")
    Accent.Size = UDim2.new(0, 3, 0, 30)
    Accent.Position = UDim2.new(0, 9, 0.5, -15)
    Accent.BackgroundColor3 = YELLOW
    Accent.BackgroundTransparency = 0.35
    Accent.BorderSizePixel = 0
    Accent.Parent = Button

    local AccentCorner = Instance.new("UICorner")
    AccentCorner.CornerRadius = UDim.new(1, 0)
    AccentCorner.Parent = Accent

    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -100, 1, 0)
    Label.Position = UDim2.fromOffset(25, 0)
    Label.BackgroundTransparency = 1
    Label.Text = Text
    Label.TextColor3 = WHITE
    Label.TextSize = 13
    Label.Font = Enum.Font.GothamSemibold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Button

    local Status = Instance.new("TextLabel")
    Status.Size = UDim2.fromOffset(45, 18)
    Status.Position = UDim2.new(1, -72, 0.5, -9)
    Status.BackgroundTransparency = 1
    Status.Text = "OFF"
    Status.TextColor3 = GRAY
    Status.TextSize = 8
    Status.Font = Enum.Font.GothamBold
    Status.Parent = Button

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.fromOffset(7, 7)
    Dot.Position = UDim2.new(1, -22, 0.5, -3)
    Dot.BackgroundColor3 = DARK_GRAY
    Dot.BorderSizePixel = 0
    Dot.Parent = Button

    local DotCorner = Instance.new("UICorner")
    DotCorner.CornerRadius = UDim.new(1, 0)
    DotCorner.Parent = Dot

    local Enabled = false

    Button.MouseEnter:Connect(function()

        TweenService:Create(Button, TweenInfo.new(0.15), {
            BackgroundColor3 = PANEL_HOVER
        }):Play()

        TweenService:Create(Stroke, TweenInfo.new(0.15), {
            Color = YELLOW,
            Transparency = 0.2
        }):Play()

    end)

    Button.MouseLeave:Connect(function()

        TweenService:Create(Button, TweenInfo.new(0.15), {
            BackgroundColor3 = PANEL
        }):Play()

        if not Enabled then

            TweenService:Create(Stroke, TweenInfo.new(0.15), {
                Color = Color3.fromRGB(45,45,50),
                Transparency = 0
            }):Play()

        end

    end)

    Button.MouseButton1Click:Connect(function()

        Enabled = not Enabled

        if Enabled then

            Status.Text = "ON"
            Status.TextColor3 = YELLOW

            TweenService:Create(Dot, TweenInfo.new(0.16), {
                BackgroundColor3 = YELLOW
            }):Play()

            TweenService:Create(Stroke, TweenInfo.new(0.16), {
                Color = YELLOW,
                Transparency = 0.05
            }):Play()

        else

            Status.Text = "OFF"
            Status.TextColor3 = GRAY

            TweenService:Create(Dot, TweenInfo.new(0.16), {
                BackgroundColor3 = DARK_GRAY
            }):Play()

            TweenService:Create(Stroke, TweenInfo.new(0.16), {
                Color = Color3.fromRGB(45,45,50),
                Transparency = 0
            }):Play()

        end

        --================================================--
        -- ส่งคำสั่งไปยัง features.lua
        --================================================--

        if FeatureFunction then
            FeatureFunction(Enabled)
        end

    end)

    return Button
end

--========================================================--
-- CREATE PAGES
--========================================================--

local Home = CreatePage("Home")
local PlayerPage = CreatePage("Player")
local Visual = CreatePage("Visual")
local Settings = CreatePage("Settings")

--========================================================--
-- HOME
--========================================================--

AddSection(Home, "MAIN")

AddButton(Home, "Feature 01", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

AddButton(Home, "Feature 02", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

AddButton(Home, "Feature 03", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

--========================================================--
-- PLAYER
--========================================================--

AddSection(PlayerPage, "PLAYER")

AddButton(PlayerPage, "Feature 04", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

AddButton(PlayerPage, "Feature 05", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

AddButton(PlayerPage, "Feature 06", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

--========================================================--
-- VISUAL
--========================================================--

AddSection(Visual, "VISUAL")

AddButton(Visual, "Feature 07", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

AddButton(Visual, "Feature 08", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

AddButton(Visual, "Feature 09", function(Enabled)

    -- ยังไม่มีระบบ
    -- กำลังพัฒนา

end)

--========================================================--
-- SETTINGS
--========================================================--

AddSection(Settings, "SETTINGS")

--========================================================--
-- FEATURE FROM features.lua
--========================================================--

AddButton(Settings, "Boost FPS", function(Enabled)

    if Features.ToggleBoostFPS then
        Features.ToggleBoostFPS(Enabled)
    end

end)

AddButton(Settings, "Show RGB FPS", function(Enabled)

    if Features.ToggleFpsCounter then
        Features.ToggleFpsCounter(Enabled)
    end

end)

--========================================================--
-- FUTURE FEATURES
--========================================================--

AddButton(Settings, "Feature 10", function(Enabled)

    -- กำลังพัฒนา

end)

AddButton(Settings, "Feature 11", function(Enabled)

    -- กำลังพัฒนา

end)

--========================================================--
-- SIDEBAR
--========================================================--

local SidebarButtons = {}

local function CreateSidebarButton(Icon, Name, Y)

    local Button = Instance.new("TextButton")
    Button.Name = Name
    Button.Size = UDim2.fromOffset(50, 46)
    Button.Position = UDim2.new(0.5, -25, 0, Y)
    Button.BackgroundColor3 = SIDEBAR_COLOR
    Button.BorderSizePixel = 0
    Button.Text = Icon
    Button.TextColor3 = GRAY
    Button.TextSize = 16
    Button.Font = Enum.Font.GothamBold
    Button.AutoButtonColor = false
    Button.Parent = Sidebar

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Button

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = DARK_GRAY
    Stroke.Transparency = 0.5
    Stroke.Parent = Button

    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0, 3, 0, 22)
    Indicator.Position = UDim2.new(0, 0, 0.5, -11)
    Indicator.BackgroundColor3 = YELLOW
    Indicator.BackgroundTransparency = 1
    Indicator.BorderSizePixel = 0
    Indicator.Parent = Button

    local IndicatorCorner = Instance.new("UICorner")
    IndicatorCorner.CornerRadius = UDim.new(1, 0)
    IndicatorCorner.Parent = Indicator

    SidebarButtons[Name] = {
        Button = Button,
        Indicator = Indicator
    }

    return Button
end

local HomeButton = CreateSidebarButton("⌂", "Home", 105)
local PlayerButton = CreateSidebarButton("♙", "Player", 160)
local VisualButton = CreateSidebarButton("◈", "Visual", 215)
local SettingsButton = CreateSidebarButton("⚙", "Settings", 270)

--========================================================--
-- PAGE SWITCH
--========================================================--

local CurrentPage
local Switching = false

local function SelectPage(Name)

    if Switching then
        return
    end

    if CurrentPage == Name then
        return
    end

    local Target = Pages[Name]

    if not Target then
        return
    end

    Switching = true

    local Old = CurrentPage and Pages[CurrentPage]

    if Old then

        local Out = TweenService:Create(
            Old,
            TweenInfo.new(
                0.18,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                Position = UDim2.new(0, -16, 0, 0)
            }
        )

        Out:Play()
        Out.Completed:Wait()

        Old.Visible = false
        Old.Position = UDim2.new(0, 0, 0, 0)

    end

    Target.Visible = true
    Target.Position = UDim2.new(0, 16, 0, 0)

    TweenService:Create(
        Target,
        TweenInfo.new(
            0.3,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.Out
        ),
        {
            Position = UDim2.new(0, 0, 0, 0)
        }
    ):Play()

    Title.Text = string.upper(Name)

    for PageName, Data in pairs(SidebarButtons) do

        local Active = PageName == Name

        TweenService:Create(
            Data.Button,
            TweenInfo.new(0.18),
            {
                BackgroundColor3 = Active
                    and Color3.fromRGB(34, 32, 22)
                    or SIDEBAR_COLOR,

                TextColor3 = Active
                    and YELLOW
                    or GRAY
            }
        ):Play()

        TweenService:Create(
            Data.Indicator,
            TweenInfo.new(0.18),
            {
                BackgroundTransparency = Active and 0 or 1
            }
        ):Play()

    end

    CurrentPage = Name

    task.wait(0.08)

    Switching = false
end

HomeButton.MouseButton1Click:Connect(function()
    SelectPage("Home")
end)

PlayerButton.MouseButton1Click:Connect(function()
    SelectPage("Player")
end)

VisualButton.MouseButton1Click:Connect(function()
    SelectPage("Visual")
end)

SettingsButton.MouseButton1Click:Connect(function()
    SelectPage("Settings")
end)

--========================================================--
-- MINIMIZE
--========================================================--

local Minimized = false

local FullSize = UDim2.fromOffset(WIDTH, HEIGHT)
local MiniSize = UDim2.fromOffset(WIDTH, 66)

Minimize.MouseButton1Click:Connect(function()

    Minimized = not Minimized

    if Minimized then

        PageContainer.Visible = false
        Sidebar.Visible = false

        Minimize.Text = "+"

        TweenService:Create(
            Main,
            TweenInfo.new(
                0.4,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                Size = MiniSize
            }
        ):Play()

    else

        Minimize.Text = "—"

        TweenService:Create(
            Main,
            TweenInfo.new(
                0.45,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                Size = FullSize
            }
        ):Play()

        task.wait(0.22)

        Sidebar.Visible = true
        PageContainer.Visible = true

    end

end)

--========================================================--
-- DRAG
--========================================================--

local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(Input)

    if Input.UserInputType == Enum.UserInputType.MouseButton1
    or Input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = Input.Position
        StartPosition = Main.Position

        Input.Changed:Connect(function()

            if Input.UserInputState == Enum.UserInputState.End then
                Dragging = false
            end

        end)

    end

end)

UIS.InputChanged:Connect(function(Input)

    if not Dragging then
        return
    end

    if Input.UserInputType == Enum.UserInputType.MouseMovement
    or Input.UserInputType == Enum.UserInputType.Touch then

        local Delta = Input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,

            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )

    end

end)

--========================================================--
-- CLOSE
--========================================================--

Close.MouseButton1Click:Connect(function()

    TweenService:Create(
        Main,
        TweenInfo.new(
            0.35,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.In
        ),
        {
            Size = UDim2.fromOffset(
                WIDTH * 0.82,
                HEIGHT * 0.82
            ),
            BackgroundTransparency = 1
        }
    ):Play()

    task.wait(0.35)

    Gui:Destroy()

end)

--========================================================--
-- BOOT ANIMATION
--========================================================--

local OriginalSize = Main.Size
local OriginalPosition = Main.Position

Main.Size = UDim2.fromOffset(
    WIDTH * 0.82,
    HEIGHT * 0.82
)

Main.Position = UDim2.new(
    0.5,
    -WIDTH * 0.41,

    0.5,
    -HEIGHT * 0.41 + 12
)

Main.BackgroundTransparency = 1

for _, Object in ipairs(Main:GetDescendants()) do

    if Object:IsA("TextLabel")
    or Object:IsA("TextButton") then

        Object.TextTransparency = 1

    elseif Object:IsA("UIStroke") then

        Object.Transparency = 1

    end

end

if BootSound.SoundId ~= "" then
    BootSound:Play()
end

TweenService:Create(
    Main,
    TweenInfo.new(
        0.72,
        Enum.EasingStyle.Quint,
        Enum.EasingDirection.Out
    ),
    {
        Size = OriginalSize,
        Position = OriginalPosition,
        BackgroundTransparency = 0
    }
):Play()

task.wait(0.12)

for _, Object in ipairs(Main:GetDescendants()) do

    if Object:IsA("TextLabel")
    or Object:IsA("TextButton") then

        TweenService:Create(
            Object,
            TweenInfo.new(
                0.45,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                TextTransparency = 0
            }
        ):Play()

    elseif Object:IsA("UIStroke") then

        TweenService:Create(
            Object,
            TweenInfo.new(
                0.45,
                Enum.EasingStyle.Quint,
                Enum.EasingDirection.Out
            ),
            {
                Transparency = 0.35
            }
        ):Play()

    end

end

task.wait(0.35)

SelectPage("Home")
