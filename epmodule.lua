--Created by Ch0nky#9785

local LP = game:GetService("Players").LocalPlayer
EspPlrs = {}
function IsPartVisible(Part1, Part2)
    local CheckPart = Instance.new("Part", game:GetService("Workspace"))
    CheckPart.Name = "CheckVisWall"
    CheckPart.Anchored = true
    CheckPart.CanCollide = false
    CheckPart.Transparency = 1
    CheckPart.Size = Vector3.new(3, 3, 3)
    CheckPart.CFrame = Part2.CFrame
    local Ray = Ray.new(Part1.Position, (Part2.Position - Part1.Position).unit * 9999)
    local part, position = workspace:FindPartOnRay(Ray, Part1.Parent)
    if part then
        if part.Name == CheckPart.Name then
            CheckPart:Destroy()
            return true
        end
    end
    CheckPart:Destroy()
    return false
end
local function GetPartCorners(Part)
    local Size = Part.Size * Vector3.new(1, 1.5)
    return {
        TR = (Part.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).Position,
        BR = (Part.CFrame * CFrame.new(-Size.X, Size.Y, 0)).Position,
        TL = (Part.CFrame * CFrame.new(Size.X, -Size.Y, 0)).Position,
        BL = (Part.CFrame * CFrame.new(Size.X, Size.Y, 0)).Position
    }
end
function GetEspPlrs()
    for k, v in pairs(game:GetService("Workspace").Level.Actors:GetChildren()) do
        if LP.Team then
            if v.Team.Name ~= LP.Team.Name then
                table.insert(EspPlrs, v)
            end
        else
            if v.Name ~= LP.Name then
                table.insert(EspPlrs, v)
            end
        end
    end
end
function tocam(pos)
    local PosChar, withinScreenBounds = workspace.Camera:WorldToViewportPoint(pos)
    return Vector2.new(PosChar.X, PosChar.Y)
end
getgenv().Drawings = {}
function UpdateTracer()
    for i, v in pairs(Drawings) do
        v:Remove()
    end
    getgenv().Drawings = {}
    EspPlrs = {}
    GetEspPlrs()
    for i, v in pairs(EspPlrs) do
        local a, b =
            pcall(
            function()
                if not v or not v.Character then
                    return
                end
                Head = v.Character:FindFirstChild("Head")
                if Head ~= nil then
                    local PosChar, withinScreenBounds = workspace.Camera:WorldToViewportPoint(Head.Position)
                    if withinScreenBounds then
                        if not LP.Character:FindFirstChild("Head") then
                            return
                        end
                        local IsVisible = IsPartVisible(LP.Character:FindFirstChild("Head"), Head)
                        local Mag = (LP.Character:FindFirstChild("Head").Position - Head.Position).Magnitude
                        local DrawColor = Color3.fromRGB(255 / Mag * 255, 255 / 255 * Mag, 0)
                        local Line = Drawing.new("Line")
                        Line.Visible = true
                        Line.From = Vector2.new(workspace.Camera.ViewportSize.X / 2, workspace.Camera.ViewportSize.Y)
                        Line.To = Vector2.new(PosChar.X, PosChar.Y)
                        Line.Color = DrawColor
                        Line.Thickness = 2
                        Line.Transparency = 1
                        Drawings[#Drawings + 1] = Line
                        local Text = Drawing.new("Text")
                        Text.Text =
                            "Name: " ..
                            v.Name ..
                                "\n" ..
                                    "Dist: " ..
                                        math.floor(Mag) ..
                                            " " ..
                                                "Visible: " ..
                                                    tostring(IsVisible) ..
                                                        " " .. "Health: " .. v.Character.Humanoid.Health
                        Text.Color = DrawColor
                        Text.Center = true
                        Text.Outline = true
                        Text.Visible = true
                        Text.Size = 16
                        Text.Position = Vector2.new(PosChar.X, PosChar.Y - 50)
                        Drawings[#Drawings + 1] = Text
                        local LineColor
                        local LineThicc = 1
                        if IsVisible then
                            LineColor = Color3.fromRGB(0, 255, 0)
                            LineThicc = 3
                        else
                            LineColor = Color3.fromRGB(255, 255, 255)
                        end
                        local LinePosChar = GetPartCorners(v.Character.HumanoidRootPart)
                        local Quad = Drawing.new("Quad")
                        Quad.Visible = true
                        Quad.Thickness = 1
                        Quad.Color = LineColor
                        Quad.PointA = tocam(LinePosChar["TR"])
                        Quad.PointB = tocam(LinePosChar["TL"])
                        Quad.PointC = tocam(LinePosChar["BL"])
                        Quad.PointD = tocam(LinePosChar["BR"])
                        Drawings[#Drawings + 1] = Quad
                    end
                end
            end
        )
        if b then
            warn(b)
        end
    end
end
while true do
    UpdateTracer()
    game:GetService("RunService").RenderStepped:Wait()
end
