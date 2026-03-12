--[[
     _      ___         ____  ______
    | | /| / (_)__  ___/ / / / /  _/
    | |/ |/ / / _ \/ _  / /_/ // /  
    |__/|__/_/_//_/\_,_/\____/___/
    
    v1.6.53  |  2025-09-28  |  Roblox UI Library for scripts
    
    This script is NOT intended to be modified.
    To view the source code, see the `src/` folder on the official GitHub repository.
    
    Author: Footagesus (Footages, .ftgs, oftgs)
    Github: https://github.com/Footagesus/WindUI
    Discord: https://discord.gg/ftgs-development-hub-1300692552005189632
    License: MIT
]]
	
local a = (cloneref or clonereference or function(a: any)
	return a
end)

if not shared.VoidwareInkGame or shared.CLONEREF_BACKUP_MODE then
	if shared.VoidDev then
		warn("clone backup mode")
	end
	a = function(b: any)
		return b
	end
end
local b
pcall(function()
	b = a(game:GetService("CoreGui"))
end)
local d: Players = a(game:GetService("Players"))
local e: RunService = a(game:GetService("RunService"))
local f: UserInputService = a(game:GetService("UserInputService"))
local g: TweenService = a(game:GetService("TweenService"))
a(game:GetService("TextService"))
local h: Workspace = a(game:GetService("Workspace"))
a(game:GetService("SoundService"))
a(game:GetService("Teams"))
a(game:GetService("TouchInputService"))
local i: LocalizationService = a(game:GetService("LocalizationService"))
local j: HttpService = a(game:GetService("HttpService"))
local l: Lighting = a(game:GetService("Lighting"))
local m: GuiService = a(game:GetService("GuiService"))

local p = d.LocalPlayer or d.PlayerAdded:Wait()
local r

if shared.CLONEREF_BACKUP_MODE then
	r = setmetatable({}, {
		__tostring = function()
			return tostring(f:GetMouseLocation() - m:GetGuiInset())
		end,
		__index = function(u, v)
			if v == "X" or v == "Y" then
				local x = f:GetMouseLocation() - m:GetGuiInset()
				return x[v]
			elseif v == "Position" then
				return f:GetMouseLocation() - m:GetGuiInset()
			end
		end,
	})
else
	r = a(p:GetMouse())
end

local u = setclipboard or nil
local v = protectgui or (syn and syn.protect_gui) or function() end
local x = gethui or function()
	return b
end

local z
z = {
	cache = {},
	load = function(A)
		if not z.cache[A] then
			z.cache[A] = { c = z[A]() }
		end
		return z.cache[A].c
	end,
}
do
	function z.a()
		local A = e
		local B = A.Heartbeat
		local C = f
		local F = g
		local G = i
		local H = j

		local J = "https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua"

		local L = loadstring(game.HttpGetAsync and game:HttpGetAsync(J) or H:GetAsync(J))()
		L.SetIconsType("lucide")

		local M

		local N = {
			Font = "rbxassetid://12187365364",
			Localization = nil,
			CanDraggable = true,
			Theme = nil,
			Themes = nil,
			Icons = L,
			Signals = {},
			Objects = {},
			LocalizationObjects = {},
			FontObjects = {},
			Language = string.match(G.SystemLocaleId, "^[a-z]+"),
			Request = http_request or (syn and syn.request) or request,
			DefaultProperties = {
				ScreenGui = {
					ResetOnSpawn = false,
					ZIndexBehavior = "Sibling",
				},
				CanvasGroup = {
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.new(1, 1, 1),
				},
				Frame = {
					BorderSizePixel = 0,
					BackgroundColor3 = Color3.new(1, 1, 1),
				},
				TextLabel = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Text = "",
					RichText = true,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 14,
				},
				TextButton = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					Text = "",
					AutoButtonColor = false,
					TextColor3 = Color3.new(1, 1, 1),
					TextSize = 14,
				},
				TextBox = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderColor3 = Color3.new(0, 0, 0),
					ClearTextOnFocus = false,
					Text = "",
					TextColor3 = Color3.new(0, 0, 0),
					TextSize = 14,
				},
				ImageLabel = {
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
				},
				ImageButton = {
					BackgroundColor3 = Color3.new(1, 1, 1),
					BorderSizePixel = 0,
					AutoButtonColor = false,
				},
				UIListLayout = {
					SortOrder = "LayoutOrder",
				},
				ScrollingFrame = {
					ScrollBarImageTransparency = 1,
					BorderSizePixel = 0,
				},
				VideoFrame = {
					BorderSizePixel = 0,
				},
			},
			Colors = {
				Red = "#e53935",
				Orange = "#f57c00",
				Green = "#43a047",
				Blue = "#039be5",
				White = "#ffffff",
				Grey = "#484848",
			},
		}

		function N.Init(O)
			M = O
		end

		function N.AddSignal(O, P)
			local Q = O:Connect(P)
			table.insert(N.Signals, Q)
			return Q
		end

		function N.DisconnectAll()
			for O, P in next, N.Signals do
				local Q = table.remove(N.Signals, O)
				Q:Disconnect()
			end
		end

		function N.SafeCallback(O, ...)
			if not O then
				return
			end

			local P, Q = pcall(O, ...)
			if not P then
				if M and M.Window and M.Window.Debug then
					local R, S = Q:find(":%d+: ")

					warn("[ WindUI: DEBUG Mode ] " .. Q)

					return M:Notify({
						Title = "DEBUG Mode: Error",
						Content = not S and Q or Q:sub(S + 1),
						Duration = 8,
					})
				end
			end
		end

		function N.Gradient(O, P)
			if M and M.Gradient then
				return M:Gradient(O, P)
			end

			local Q = {}
			local R = {}

			for S, T in next, O do
				local U = tonumber(S)
				if U then
					U = math.clamp(U / 100, 0, 1)
					table.insert(Q, ColorSequenceKeypoint.new(U, T.Color))
					table.insert(R, NumberSequenceKeypoint.new(U, T.Transparency or 0))
				end
			end

			table.sort(Q, function(S, T)
				return S.Time < T.Time
			end)
			table.sort(R, function(S, T)
				return S.Time < T.Time
			end)

			if #Q < 2 then
				error("ColorSequence requires at least 2 keypoints")
			end

			local S = {
				Color = ColorSequence.new(Q),
				Transparency = NumberSequence.new(R),
			}

			if P then
				for T, U in pairs(P) do
					S[T] = U
				end
			end

			return S
		end

		function N.SetTheme(O)
			N.Theme = O
			N.UpdateTheme(nil, true)
		end

		function N.AddFontObject(O)
			table.insert(N.FontObjects, O)
			N.UpdateFont(N.Font)
		end

		function N.UpdateFont(O)
			N.Font = O
			for P, Q in next, N.FontObjects do
				Q.FontFace = Font.new(O, Q.FontFace.Weight, Q.FontFace.Style)
			end
		end

		function N.GetThemeProperty(O, P)
			local Q = P[O] or N.Themes.Dark[O]

			if not Q then
				return nil
			end

			if type(Q) == "string" and string.sub(Q, 1, 1) == "#" then
				return Color3.fromHex(Q)
			end

			if typeof(Q) == "Color3" then
				return Q
			end

			if type(Q) == "table" and Q.Color and Q.Transparency then
				return Q
			end

			if type(Q) == "function" then
				return Q()
			end

			return nil
		end

		function N.AddThemeObject(O, P)
			N.Objects[O] = { Object = O, Properties = P }
			N.UpdateTheme(O, false)
			return O
		end

		function N.AddLangObject(O)
			local P = N.LocalizationObjects[O]
			local Q = P.Object
			local R = currentObjTranslationId
			N.UpdateLang(Q, R)
			return Q
		end

		function N.UpdateTheme(O, P)
			local function ApplyTheme(Q)
				for R, S in pairs(Q.Properties or {}) do
					local T = N.GetThemeProperty(S, N.Theme)
					if T then
						if typeof(T) == "Color3" then
							local U = Q.Object:FindFirstChild("WindUIGradient")
							if U then
								U:Destroy()
							end

							if not P then
								Q.Object[R] = T
							else
								N.Tween(Q.Object, 0.08, { [R] = T }):Play()
							end
						elseif type(T) == "table" and T.Color and T.Transparency then
							Q.Object[R] = Color3.new(1, 1, 1)

							local U = Q.Object:FindFirstChild("WindUIGradient")
							if not U then
								U = Instance.new("UIGradient")
								U.Name = "WindUIGradient"
								U.Parent = Q.Object
							end

							U.Color = T.Color
							U.Transparency = T.Transparency

							for V, W in pairs(T) do
								if V ~= "Color" and V ~= "Transparency" and U[V] ~= nil then
									U[V] = W
								end
							end
						end
					else
						local U = Q.Object:FindFirstChild("WindUIGradient")
						if U then
							U:Destroy()
						end
					end
				end
			end

			if O then
				local Q = N.Objects[O]
				if Q then
					ApplyTheme(Q)
				end
			else
				for Q, R in pairs(N.Objects) do
					ApplyTheme(R)
				end
			end
		end

		function N.SetLangForObject(O)
			if N.Localization and N.Localization.Enabled then
				local P = N.LocalizationObjects[O]
				if not P then
					return
				end

				local Q = P.Object
				local R = P.TranslationId

				local S = N.Localization.Translations[N.Language]
				if S and S[R] then
					Q.Text = S[R]
				else
					local T = N.Localization and N.Localization.Translations and N.Localization.Translations.en or nil
					if T and T[R] then
						Q.Text = T[R]
					else
						Q.Text = "[" .. R .. "]"
					end
				end
			end
		end

		function N.ChangeTranslationKey(O, P, Q)
			if N.Localization and N.Localization.Enabled then
				local R = string.match(Q, "^" .. N.Localization.Prefix .. "(.+)")
				if R then
					for S, T in ipairs(N.LocalizationObjects) do
						if T.Object == P then
							T.TranslationId = R
							N.SetLangForObject(S)
							return
						end
					end

					table.insert(N.LocalizationObjects, {
						TranslationId = R,
						Object = P,
					})
					N.SetLangForObject(#N.LocalizationObjects)
				end
			end
		end

		function N.UpdateLang(O)
			if O then
				N.Language = O
			end

			for P = 1, #N.LocalizationObjects do
				local Q = N.LocalizationObjects[P]
				if Q.Object and Q.Object.Parent ~= nil then
					N.SetLangForObject(P)
				else
					N.LocalizationObjects[P] = nil
				end
			end
		end

		function N.SetLanguage(O)
			N.Language = O
			N.UpdateLang()
		end

		function N.Icon(O)
			return L.Icon(O, nil, true)
		end

		function N.AddIcons(O, P)
			return L.AddIcons(O, P)
		end

		function N.New(O, P, Q)
			local R = Instance.new(O)

			for S, T in next, N.DefaultProperties[O] or {} do
				R[S] = T
			end

			for S, T in next, P or {} do
				if S ~= "ThemeTag" then
					R[S] = T
				end
				if N.Localization and N.Localization.Enabled and S == "Text" then
					local U = string.match(T, "^" .. N.Localization.Prefix .. "(.+)")
					if U then
						local V = #N.LocalizationObjects + 1
						N.LocalizationObjects[V] = { TranslationId = U, Object = R }

						N.SetLangForObject(V)
					end
				end
			end

			for S, T in next, Q or {} do
				T.Parent = R
			end

			if P and P.ThemeTag then
				N.AddThemeObject(R, P.ThemeTag)
			end
			if P and P.FontFace then
				N.AddFontObject(R)
			end
			return R
		end

		function N.Tween(O, P, Q, ...)
			return F:Create(O, TweenInfo.new(P, ...), Q)
		end

		function N.NewRoundFrame(O, P, Q, R, S, T)
			local function getImageForType(U)
				return U == "Squircle" and "rbxassetid://80999662900595"
					or U == "SquircleOutline" and "rbxassetid://117788349049947"
					or U == "SquircleOutline2" and "rbxassetid://117817408534198"
					or U == "Squircle-Outline" and "rbxassetid://117817408534198"
					or U == "Shadow-sm" and "rbxassetid://84825982946844"
					or U == "Squircle-TL-TR" and "rbxassetid://73569156276236"
					or U == "Squircle-BL-BR" and "rbxassetid://93853842912264"
					or U == "Squircle-TL-TR-Outline" and "rbxassetid://136702870075563"
					or U == "Squircle-BL-BR-Outline" and "rbxassetid://75035847706564"
					or U == "Square" and "rbxassetid://82909646051652"
					or U == "Square-Outline" and "rbxassetid://72946211851948"
			end

			local function getSliceCenterForType(U)
				return U ~= "Shadow-sm" and Rect.new(256, 256, 256, 256) or Rect.new(512, 512, 512, 512)
			end

			local U = N.New(S and "ImageButton" or "ImageLabel", {
				Image = getImageForType(P),
				ScaleType = "Slice",
				SliceCenter = getSliceCenterForType(P),
				SliceScale = 1,
				BackgroundTransparency = 1,
				ThemeTag = Q.ThemeTag and Q.ThemeTag,
			}, R)

			for V, W in pairs(Q or {}) do
				if V ~= "ThemeTag" then
					U[V] = W
				end
			end

			local function UpdateSliceScale(V)
				local W = P ~= "Shadow-sm" and (V / 256) or (V / 512)
				U.SliceScale = math.max(W, 0.0001)
			end

			local V = {}

			function V.SetRadius(W, X)
				UpdateSliceScale(X)
			end

			function V.SetType(W, X)
				P = X
				U.Image = getImageForType(X)
				U.SliceCenter = getSliceCenterForType(X)
				UpdateSliceScale(O)
			end

			function V.UpdateShape(W, X, Y)
				if Y then
					P = Y
					U.Image = getImageForType(Y)
					U.SliceCenter = getSliceCenterForType(Y)
				end
				if X then
					O = X
				end
				UpdateSliceScale(O)
			end

			function V.GetRadius(W)
				return O
			end

			function V.GetType(W)
				return P
			end

			UpdateSliceScale(O)

			return U, T and V or nil
		end

		local O = N.New
		local P = N.Tween

		function N.SetDraggable(Q)
			N.CanDraggable = Q
		end

		function N.Drag(Q, R, S)
			local T
			local U, V, W, X
			local Y = {
				CanDraggable = true,
			}

			if not R or type(R) ~= "table" then
				R = { Q }
			end

			local function update(_)
				local aa = _.Position - W
				N.Tween(Q, 0.02, { Position = UDim2.new(X.X.Scale, X.X.Offset + aa.X, X.Y.Scale, X.Y.Offset + aa.Y) })
					:Play()
			end

			for aa, _ in pairs(R) do
				_.InputBegan:Connect(function(ab)
					if
						(
							ab.UserInputType == Enum.UserInputType.MouseButton1
							or ab.UserInputType == Enum.UserInputType.Touch
						) and Y.CanDraggable
					then
						if T == nil then
							T = _
							U = true
							W = ab.Position
							X = Q.Position

							if S and type(S) == "function" then
								S(true, T)
							end

							ab.Changed:Connect(function()
								if ab.UserInputState == Enum.UserInputState.End then
									U = false
									T = nil

									if S and type(S) == "function" then
										S(false, T)
									end
								end
							end)
						end
					end
				end)

				_.InputChanged:Connect(function(ab)
					if T == _ and U then
						if
							ab.UserInputType == Enum.UserInputType.MouseMovement
							or ab.UserInputType == Enum.UserInputType.Touch
						then
							V = ab
						end
					end
				end)
			end

			C.InputChanged:Connect(function(aa)
				if aa == V and U and T ~= nil then
					if Y.CanDraggable then
						update(aa)
					end
				end
			end)

			function Y.Set(aa, ab)
				Y.CanDraggable = ab
			end

			return Y
		end

		L.Init(O, "Icon")

		function N.Image(aa, ab, Q, R, S, T, U)
			local function SanitizeFilename(V)
				V = V:gsub('[%s/\\:*?"<>|]+', "-")
				V = V:gsub("[^%w%-_%.]", "")
				return V
			end

			R = R or "Temp"
			ab = SanitizeFilename(ab)

			local V = O("Frame", {
				Size = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {
				O("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					ScaleType = "Crop",
					ThemeTag = (N.Icon(aa) or U) and {
						ImageColor3 = T and "Icon" or nil,
					} or nil,
				}, {
					O("UICorner", {
						CornerRadius = UDim.new(0, Q),
					}),
				}),
			})
			if N.Icon(aa) then
				V.ImageLabel:Destroy()

				local W = L.Image({
					Icon = aa,
					Size = UDim2.new(1, 0, 1, 0),
					Colors = {
						(T and "Icon" or false),
						"Button",
					},
				}).IconFrame
				W.Parent = V
			elseif string.find(aa, "http") then
				local W = "WindUI/" .. R .. "/Assets/." .. S .. "-" .. ab .. ".png"
				local X, Y = pcall(function()
					task.spawn(function()
						if not isfile(W) then
							local X = N.Request({
								Url = aa,
								Method = "GET",
							}).Body

							writefile(W, X)
						end
						V.ImageLabel.Image = getcustomasset(W)
					end)
				end)
				if not X then
					warn(
						"[ WindUI.Creator ]  '" .. identifyexecutor() .. "' doesnt support the URL Images. Error: " .. Y
					)

					V:Destroy()
				end
			elseif aa == "" then
				V.Visible = false
			else
				V.ImageLabel.Image = aa
			end

			return V
		end

		return N
	end
	function z.b()
		local aa = {}

		function aa.New(ab, A, C)
			local F = {
				Enabled = A.Enabled or false,
				Translations = A.Translations or {},
				Prefix = A.Prefix or "loc:",
				DefaultLanguage = A.DefaultLanguage or "en",
			}

			C.Localization = F

			return F
		end

		return aa
	end
	function z.c()
		local aa = z.load("a")
		local ab = aa.New
		local A = aa.Tween

		local C = {
			Size = UDim2.new(0, 300, 1, -156),
			SizeLower = UDim2.new(0, 300, 1, -56),
			UICorner = 13,
			UIPadding = 14,

			Holder = nil,
			NotificationIndex = 0,
			Notifications = {},
		}

		function C.Init(F)
			local G = {
				Lower = false,
			}

			function G.SetLower(H)
				G.Lower = H
				G.Frame.Size = H and C.SizeLower or C.Size
			end

			G.Frame = ab("Frame", {
				Position = UDim2.new(1, -29, 0, 56),
				AnchorPoint = Vector2.new(1, 0),
				Size = C.Size,
				Parent = F,
				BackgroundTransparency = 1,
			}, {
				ab("UIListLayout", {
					HorizontalAlignment = "Center",
					SortOrder = "LayoutOrder",
					VerticalAlignment = "Bottom",
					Padding = UDim.new(0, 8),
				}),
				ab("UIPadding", {
					PaddingBottom = UDim.new(0, 29),
				}),
			})
			return G
		end

		function C.New(F)
			local G = {
				Title = F.Title or "Notification",
				Content = F.Content or nil,
				Icon = F.Icon or nil,
				IconThemed = F.IconThemed,
				Background = F.Background,
				BackgroundImageTransparency = F.BackgroundImageTransparency,
				Duration = F.Duration or 5,
				Buttons = F.Buttons or {},
				CanClose = true,
				UIElements = {},
				Closed = false,
			}
			if G.CanClose == nil then
				G.CanClose = true
			end
			C.NotificationIndex = C.NotificationIndex + 1
			C.Notifications[C.NotificationIndex] = G

			local H

			if G.Icon then
				H = aa.Image(G.Icon, G.Title .. ":" .. G.Icon, 0, F.Window, "Notification", G.IconThemed)
				H.Size = UDim2.new(0, 26, 0, 26)
				H.Position = UDim2.new(0, C.UIPadding, 0, C.UIPadding)
			end

			local J
			if G.CanClose then
				J = ab("ImageButton", {
					Image = aa.Icon("x")[1],
					ImageRectSize = aa.Icon("x")[2].ImageRectSize,
					ImageRectOffset = aa.Icon("x")[2].ImageRectPosition,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 16, 0, 16),
					Position = UDim2.new(1, -C.UIPadding, 0, C.UIPadding),
					AnchorPoint = Vector2.new(1, 0),
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 0.4,
				}, {
					ab("TextButton", {
						Size = UDim2.new(1, 8, 1, 8),
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Text = "",
					}),
				})
			end

			local L = ab("Frame", {
				Size = UDim2.new(0, 0, 1, 0),
				BackgroundTransparency = 0.95,
				ThemeTag = {
					BackgroundColor3 = "Text",
				},
			})

			local M = ab("Frame", {
				Size = UDim2.new(1, G.Icon and -28 - C.UIPadding or 0, 1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				AutomaticSize = "Y",
			}, {
				ab("UIPadding", {
					PaddingTop = UDim.new(0, C.UIPadding),
					PaddingLeft = UDim.new(0, C.UIPadding),
					PaddingRight = UDim.new(0, C.UIPadding),
					PaddingBottom = UDim.new(0, C.UIPadding),
				}),
				ab("TextLabel", {
					AutomaticSize = "Y",
					Size = UDim2.new(1, -30 - C.UIPadding, 0, 0),
					TextWrapped = true,
					TextXAlignment = "Left",
					RichText = true,
					BackgroundTransparency = 1,
					TextSize = 16,
					ThemeTag = {
						TextColor3 = "Text",
					},
					Text = G.Title,
					FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
				}),
				ab("UIListLayout", {
					Padding = UDim.new(0, C.UIPadding / 3),
				}),
			})

			if G.Content then
				ab("TextLabel", {
					AutomaticSize = "Y",
					Size = UDim2.new(1, 0, 0, 0),
					TextWrapped = true,
					TextXAlignment = "Left",
					RichText = true,
					BackgroundTransparency = 1,
					TextTransparency = 0.4,
					TextSize = 15,
					ThemeTag = {
						TextColor3 = "Text",
					},
					Text = G.Content,
					FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
					Parent = M,
				})
			end

			local N = aa.NewRoundFrame(C.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				Position = UDim2.new(2, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				AutomaticSize = "Y",
				ImageTransparency = 0.05,
				ThemeTag = {
					ImageColor3 = "Background",
				},
			}, {
				ab("CanvasGroup", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					L,
					ab("UICorner", {
						CornerRadius = UDim.new(0, C.UICorner),
					}),
				}),
				ab("ImageLabel", {
					Name = "Background",
					Image = G.Background,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					ScaleType = "Crop",
					ImageTransparency = G.BackgroundImageTransparency,
				}, {
					ab("UICorner", {
						CornerRadius = UDim.new(0, C.UICorner),
					}),
				}),

				M,
				H,
				J,
			})

			local O = ab("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 0),
				Parent = F.Holder,
			}, {
				N,
			})

			function G.Close(P)
				if not G.Closed then
					G.Closed = true
					A(O, 0.45, { Size = UDim2.new(1, 0, 0, -8) }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					A(N, 0.55, { Position = UDim2.new(2, 0, 1, 0) }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					task.wait(0.45)
					O:Destroy()
				end
			end

			task.spawn(function()
				task.wait()
				A(
					O,
					0.45,
					{ Size = UDim2.new(1, 0, 0, N.AbsoluteSize.Y) },
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				):Play()
				A(N, 0.45, { Position = UDim2.new(0, 0, 1, 0) }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				if G.Duration then
					A(
						L,
						G.Duration,
						{ Size = UDim2.new(1, 0, 1, 0) },
						Enum.EasingStyle.Linear,
						Enum.EasingDirection.InOut
					):Play()
					task.wait(G.Duration)
					G:Close()
				end
			end)

			if J then
				aa.AddSignal(J.TextButton.MouseButton1Click, function()
					G:Close()
				end)
			end

			return G
		end

		return C
	end
	function z.d()
		local aa = 4294967296
		local ab = aa - 1
		local function c(A, C)
			local F, G = 0, 1
			while A ~= 0 or C ~= 0 do
				local H, J = A % 2, C % 2
				local L = (H + J) % 2
				F = F + L * G
				A = math.floor(A / 2)
				C = math.floor(C / 2)
				G = G * 2
			end
			return F % aa
		end
		local function k(A, C, F, ...)
			local G
			if C then
				A = A % aa
				C = C % aa
				G = c(A, C)
				if F then
					G = k(G, F, ...)
				end
				return G
			elseif A then
				return A % aa
			else
				return 0
			end
		end
		local function n(A, C, F, ...)
			local G
			if C then
				A = A % aa
				C = C % aa
				G = (A + C - c(A, C)) / 2
				if F then
					G = n(G, F, ...)
				end
				return G
			elseif A then
				return A % aa
			else
				return ab
			end
		end
		local function o(A)
			return ab - A
		end
		local function q(A, C)
			if C < 0 then
				return lshift(A, -C)
			end
			return math.floor(A % 4294967296 / 2 ^ C)
		end
		local function s(A, C)
			if C > 31 or C < -31 then
				return 0
			end
			return q(A % aa, C)
		end
		local function lshift(A, C)
			if C < 0 then
				return s(A, -C)
			end
			return A * 2 ^ C % 4294967296
		end
		local function t(A, C)
			A = A % aa
			C = C % 32
			local F = n(A, 2 ^ C - 1)
			return s(A, C) + lshift(F, 32 - C)
		end
		local A = {
			0x428a2f98,
			0x71374491,
			0xb5c0fbcf,
			0xe9b5dba5,
			0x3956c25b,
			0x59f111f1,
			0x923f82a4,
			0xab1c5ed5,
			0xd807aa98,
			0x12835b01,
			0x243185be,
			0x550c7dc3,
			0x72be5d74,
			0x80deb1fe,
			0x9bdc06a7,
			0xc19bf174,
			0xe49b69c1,
			0xefbe4786,
			0x0fc19dc6,
			0x240ca1cc,
			0x2de92c6f,
			0x4a7484aa,
			0x5cb0a9dc,
			0x76f988da,
			0x983e5152,
			0xa831c66d,
			0xb00327c8,
			0xbf597fc7,
			0xc6e00bf3,
			0xd5a79147,
			0x06ca6351,
			0x14292967,
			0x27b70a85,
			0x2e1b2138,
			0x4d2c6dfc,
			0x53380d13,
			0x650a7354,
			0x766a0abb,
			0x81c2c92e,
			0x92722c85,
			0xa2bfe8a1,
			0xa81a664b,
			0xc24b8b70,
			0xc76c51a3,
			0xd192e819,
			0xd6990624,
			0xf40e3585,
			0x106aa070,
			0x19a4c116,
			0x1e376c08,
			0x2748774c,
			0x34b0bcb5,
			0x391c0cb3,
			0x4ed8aa4a,
			0x5b9cca4f,
			0x682e6ff3,
			0x748f82ee,
			0x78a5636f,
			0x84c87814,
			0x8cc70208,
			0x90befffa,
			0xa4506ceb,
			0xbef9a3f7,
			0xc67178f2,
		}
		local function w(C)
			return string.gsub(C, ".", function(F)
				return string.format("%02x", string.byte(F))
			end)
		end
		local function y(C, F)
			local G = ""
			for H = 1, F do
				local J = C % 256
				G = string.char(J) .. G
				C = (C - J) / 256
			end
			return G
		end
		local function D(C, F)
			local G = 0
			for H = F, F + 3 do
				G = G * 256 + string.byte(C, H)
			end
			return G
		end
		local function E(C, F)
			local G = 64 - (F + 9) % 64
			F = y(8 * F, 8)
			C = C .. "\128" .. string.rep("\0", G) .. F
			assert(#C % 64 == 0)
			return C
		end
		local function I(C)
			C[1] = 0x6a09e667
			C[2] = 0xbb67ae85
			C[3] = 0x3c6ef372
			C[4] = 0xa54ff53a
			C[5] = 0x510e527f
			C[6] = 0x9b05688c
			C[7] = 0x1f83d9ab
			C[8] = 0x5be0cd19
			return C
		end
		local function K(C, F, G)
			local H = {}
			for J = 1, 16 do
				H[J] = D(C, F + (J - 1) * 4)
			end
			for J = 17, 64 do
				local L = H[J - 15]
				local M = k(t(L, 7), t(L, 18), s(L, 3))
				L = H[J - 2]
				H[J] = (H[J - 16] + M + H[J - 7] + k(t(L, 17), t(L, 19), s(L, 10))) % aa
			end
			local J, L, M, N, O, P, Q, R = G[1], G[2], G[3], G[4], G[5], G[6], G[7], G[8]
			for S = 1, 64 do
				local T = k(t(J, 2), t(J, 13), t(J, 22))
				local U = k(n(J, L), n(J, M), n(L, M))
				local V = (T + U) % aa
				local W = k(t(O, 6), t(O, 11), t(O, 25))
				local X = k(n(O, P), n(o(O), Q))
				local Y = (R + W + X + A[S] + H[S]) % aa
				R = Q
				Q = P
				P = O
				O = (N + Y) % aa
				N = M
				M = L
				L = J
				J = (Y + V) % aa
			end
			G[1] = (G[1] + J) % aa
			G[2] = (G[2] + L) % aa
			G[3] = (G[3] + M) % aa
			G[4] = (G[4] + N) % aa
			G[5] = (G[5] + O) % aa
			G[6] = (G[6] + P) % aa
			G[7] = (G[7] + Q) % aa
			G[8] = (G[8] + R) % aa
		end
		local function Z(C)
			C = E(C, #C)
			local F = I({})
			for G = 1, #C, 64 do
				K(C, G, F)
			end
			return w(
				y(F[1], 4)
					.. y(F[2], 4)
					.. y(F[3], 4)
					.. y(F[4], 4)
					.. y(F[5], 4)
					.. y(F[6], 4)
					.. y(F[7], 4)
					.. y(F[8], 4)
			)
		end
		local C
		local F = { ["\\"] = "\\", ['"'] = '"', ["\b"] = "b", ["\f"] = "f", ["\n"] = "n", ["\r"] = "r", ["\t"] = "t" }
		local G = { ["/"] = "/" }
		for H, J in pairs(F) do
			G[J] = H
		end
		local H = function(H)
			return "\\" .. (F[H] or string.format("u%04x", H:byte()))
		end
		local J = function(J)
			return "null"
		end
		local L = function(L, M)
			local N = {}
			M = M or {}
			if M[L] then
				error("circular reference")
			end
			M[L] = true
			if rawget(L, 1) ~= nil or next(L) == nil then
				local O = 0
				for P in pairs(L) do
					if type(P) ~= "number" then
						error("invalid table: mixed or invalid key types")
					end
					O = O + 1
				end
				if O ~= #L then
					error("invalid table: sparse array")
				end
				for P, Q in ipairs(L) do
					table.insert(N, C(Q, M))
				end
				M[L] = nil
				return "[" .. table.concat(N, ",") .. "]"
			else
				for O, P in pairs(L) do
					if type(O) ~= "string" then
						error("invalid table: mixed or invalid key types")
					end
					table.insert(N, C(O, M) .. ":" .. C(P, M))
				end
				M[L] = nil
				return "{" .. table.concat(N, ",") .. "}"
			end
		end
		local M = function(M)
			return '"' .. M:gsub('[%z\1-\31\\"]', H) .. '"'
		end
		local N = function(N)
			if N ~= N or N <= -math.huge or N >= math.huge then
				error("unexpected number value '" .. tostring(N) .. "'")
			end
			return string.format("%.14g", N)
		end
		local O = { ["nil"] = J, table = L, string = M, number = N, boolean = tostring }
		C = function(P, Q)
			local R = type(P)
			local S = O[R]
			if S then
				return S(P, Q)
			end
			error("unexpected type '" .. R .. "'")
		end
		local P = function(P)
			return C(P)
		end
		local Q
		local R = function(...)
			local R = {}
			for S = 1, select("#", ...) do
				R[select(S, ...)] = true
			end
			return R
		end
		local S = R(" ", "\t", "\r", "\n")
		local T = R(" ", "\t", "\r", "\n", "]", "}", ",")
		local U = R("\\", "/", '"', "b", "f", "n", "r", "t", "u")
		local V = R("true", "false", "null")
		local W = { ["true"] = true, ["false"] = false, null = nil }
		local ac = function(X, Y, _, ac)
			for ad = Y, #X do
				if _[X:sub(ad, ad)] ~= ac then
					return ad
				end
			end
			return #X + 1
		end
		local ad = function(ad, X, Y)
			local _ = 1
			local ae = 1
			for af = 1, X - 1 do
				ae = ae + 1
				if ad:sub(af, af) == "\n" then
					_ = _ + 1
					ae = 1
				end
			end
			error(string.format("%s at line %d col %d", Y, _, ae))
		end
		local ae = function(ae)
			local af = math.floor
			if ae <= 0x7f then
				return string.char(ae)
			elseif ae <= 0x7ff then
				return string.char(af(ae / 64) + 192, ae % 64 + 128)
			elseif ae <= 0xffff then
				return string.char(af(ae / 4096) + 224, af(ae % 4096 / 64) + 128, ae % 64 + 128)
			elseif ae <= 0x10ffff then
				return string.char(
					af(ae / 262144) + 240,
					af(ae % 262144 / 4096) + 128,
					af(ae % 4096 / 64) + 128,
					ae % 64 + 128
				)
			end
			error(string.format("invalid unicode codepoint '%x'", ae))
		end
		local af = function(af)
			local X = tonumber(af:sub(1, 4), 16)
			local Y = tonumber(af:sub(7, 10), 16)
			if Y then
				return ae((X - 0xd800) * 0x400 + Y - 0xdc00 + 0x10000)
			else
				return ae(X)
			end
		end
		local ag = function(X, Y)
			local _ = ""
			local ag = Y + 1
			local ah = ag
			while ag <= #X do
				local ai = X:byte(ag)
				if ai < 32 then
					ad(X, ag, "control character in string")
				elseif ai == 92 then
					_ = _ .. X:sub(ah, ag - 1)
					ag = ag + 1
					local aj = X:sub(ag, ag)
					if aj == "u" then
						local ak = X:match("^[dD][89aAbB]%x%x\\u%x%x%x%x", ag + 1)
							or X:match("^%x%x%x%x", ag + 1)
							or ad(X, ag - 1, "invalid unicode escape in string")
						_ = _ .. af(ak)
						ag = ag + #ak
					else
						if not U[aj] then
							ad(X, ag - 1, "invalid escape char '" .. aj .. "' in string")
						end
						_ = _ .. G[aj]
					end
					ah = ag + 1
				elseif ai == 34 then
					_ = _ .. X:sub(ah, ag - 1)
					return _, ag + 1
				end
				ag = ag + 1
			end
			ad(X, Y, "expected closing quote for string")
		end
		local ah = function(ah, ai)
			local aj = ac(ah, ai, T)
			local ak = ah:sub(ai, aj - 1)
			local X = tonumber(ak)
			if not X then
				ad(ah, ai, "invalid number '" .. ak .. "'")
			end
			return X, aj
		end
		local ai = function(ai, aj)
			local ak = ac(ai, aj, T)
			local X = ai:sub(aj, ak - 1)
			if not V[X] then
				ad(ai, aj, "invalid literal '" .. X .. "'")
			end
			return W[X], ak
		end
		local aj = function(aj, ak)
			local X = {}
			local Y = 1
			ak = ak + 1
			while 1 do
				local _
				ak = ac(aj, ak, S, true)
				if aj:sub(ak, ak) == "]" then
					ak = ak + 1
					break
				end
				_, ak = Q(aj, ak)
				X[Y] = _
				Y = Y + 1
				ak = ac(aj, ak, S, true)
				local al = aj:sub(ak, ak)
				ak = ak + 1
				if al == "]" then
					break
				end
				if al ~= "," then
					ad(aj, ak, "expected ']' or ','")
				end
			end
			return X, ak
		end
		local ak = function(ak, al)
			local X = {}
			al = al + 1
			while 1 do
				local Y, _
				al = ac(ak, al, S, true)
				if ak:sub(al, al) == "}" then
					al = al + 1
					break
				end
				if ak:sub(al, al) ~= '"' then
					ad(ak, al, "expected string for key")
				end
				Y, al = Q(ak, al)
				al = ac(ak, al, S, true)
				if ak:sub(al, al) ~= ":" then
					ad(ak, al, "expected ':' after key")
				end
				al = ac(ak, al + 1, S, true)
				_, al = Q(ak, al)
				X[Y] = _
				al = ac(ak, al, S, true)
				local am = ak:sub(al, al)
				al = al + 1
				if am == "}" then
					break
				end
				if am ~= "," then
					ad(ak, al, "expected '}' or ','")
				end
			end
			return X, al
		end
		local al = {
			['"'] = ag,
			["0"] = ah,
			["1"] = ah,
			["2"] = ah,
			["3"] = ah,
			["4"] = ah,
			["5"] = ah,
			["6"] = ah,
			["7"] = ah,
			["8"] = ah,
			["9"] = ah,
			["-"] = ah,
			t = ai,
			f = ai,
			n = ai,
			["["] = aj,
			["{"] = ak,
		}
		Q = function(am, X)
			local Y = am:sub(X, X)
			local _ = al[Y]
			if _ then
				return _(am, X)
			end
			ad(am, X, "unexpected character '" .. Y .. "'")
		end
		local am = function(am)
			if type(am) ~= "string" then
				error("expected argument of type string, got " .. type(am))
			end
			local X, Y = Q(am, ac(am, 1, S, true))
			Y = ac(am, Y, S, true)
			if Y <= #am then
				ad(am, Y, "trailing garbage")
			end
			return X
		end
		local X, Y, _ = P, am, Z

		local an = {}

		function an.New(ao, ap)
			local aq = ao
			local ar = ap
			local as = true

			local at = function(at) end

			repeat
				task.wait(1)
			until game:IsLoaded()

			local au = false
			local av, aw, ax, ay, az, aA, aB, aC, aD =
				u or toclipboard,
				request or http_request or syn_request,
				string.char,
				tostring,
				string.sub,
				os.time,
				math.random,
				math.floor,
				gethwid or function()
					return p.UserId
				end
			local aE, aF = "", 0

			local aG = "https://api.platoboost.com"
			local aH = aw({
				Url = aG .. "/public/connectivity",
				Method = "GET",
			})
			if aH.StatusCode ~= 200 or aH.StatusCode ~= 429 then
				aG = "https://api.platoboost.net"
			end

			function cacheLink()
				if aF + 600 < aA() then
					local aI = aw({
						Url = aG .. "/public/start",
						Method = "POST",
						Body = X({
							service = aq,
							identifier = _(aD()),
						}),
						Headers = {
							["Content-Type"] = "application/json",
							["User-Agent"] = "Roblox/Exploit",
						},
					})

					if aI.StatusCode == 200 then
						local aJ = Y(aI.Body)

						if aJ.success == true then
							aE = aJ.data.url
							aF = aA()
							return true, aE
						else
							at(aJ.message)
							return false, aJ.message
						end
					elseif aI.StatusCode == 429 then
						local aJ = "you are being rate limited, please wait 20 seconds and try again."
						at(aJ)
						return false, aJ
					end

					local aJ = "Failed to cache link."
					at(aJ)
					return false, aJ
				else
					return true, aE
				end
			end

			cacheLink()

			local aI = function()
				local aI = ""
				for aJ = 1, 16 do
					aI = aI .. ax(aC(aB() * 26) + 97)
				end
				return aI
			end

			for aJ = 1, 5 do
				local aK = aI()
				task.wait(0.2)
				if aI() == aK then
					local aL = "platoboost nonce error."
					at(aL)
					error(aL)
				end
			end

			local aJ = function()
				local aJ, aK = cacheLink()

				if aJ then
					av(aK)
				end
			end

			local aK = function(aK)
				local aL = aI()
				local aM = aG .. "/public/redeem/" .. ay(aq)

				local aN = {
					identifier = _(aD()),
					key = aK,
				}

				if as then
					aN.nonce = aL
				end

				local aO = aw({
					Url = aM,
					Method = "POST",
					Body = X(aN),
					Headers = {
						["Content-Type"] = "application/json",
					},
				})

				if aO.StatusCode == 200 then
					local aP = Y(aO.Body)

					if aP.success == true then
						if aP.data.valid == true then
							if as then
								if aP.data.hash == _("true" .. "-" .. aL .. "-" .. ar) then
									return true
								else
									at("failed to verify integrity.")
									return false
								end
							else
								return true
							end
						else
							at("key is invalid.")
							return false
						end
					else
						if az(aP.message, 1, 27) == "unique constraint violation" then
							at("you already have an active key, please wait for it to expire before redeeming it.")
							return false
						else
							at(aP.message)
							return false
						end
					end
				elseif aO.StatusCode == 429 then
					at("you are being rate limited, please wait 20 seconds and try again.")
					return false
				else
					at("server returned an invalid status code, please try again later.")
					return false
				end
			end

			local aL = function(aL)
				if au == true then
					return false, "A request is already being sent, please slow down."
				else
					au = true
				end

				local aM = aI()
				local aN = aG .. "/public/whitelist/" .. ay(aq) .. "?identifier=" .. _(aD()) .. "&key=" .. aL

				if as then
					aN = aN .. "&nonce=" .. aM
				end

				local aO = aw({
					Url = aN,
					Method = "GET",
				})

				au = false

				if aO.StatusCode == 200 then
					local aP = Y(aO.Body)

					if aP.success == true then
						if aP.data.valid == true then
							if as then
								if aP.data.hash == _("true" .. "-" .. aM .. "-" .. ar) then
									return true, ""
								else
									return false, "failed to verify integrity."
								end
							else
								return true
							end
						else
							if az(aL, 1, 4) == "KEY_" then
								return true, aK(aL)
							else
								return false, "Key is invalid."
							end
						end
					else
						return false, aP.message
					end
				elseif aO.StatusCode == 429 then
					return false, "You are being rate limited, please wait 20 seconds and try again."
				else
					return false, "Server returned an invalid status code, please try again later."
				end
			end

			local aM = function(aM)
				local aN = aI()
				local aO = aG .. "/public/flag/" .. ay(aq) .. "?name=" .. aM

				if as then
					aO = aO .. "&nonce=" .. aN
				end

				local aP = aw({
					Url = aO,
					Method = "GET",
				})

				if aP.StatusCode == 200 then
					local aQ = Y(aP.Body)

					if aQ.success == true then
						if as then
							if aQ.data.hash == _(ay(aQ.data.value) .. "-" .. aN .. "-" .. ar) then
								return aQ.data.value
							else
								at("failed to verify integrity.")
								return nil
							end
						else
							return aQ.data.value
						end
					else
						at(aQ.message)
						return nil
					end
				else
					return nil
				end
			end

			return {
				Verify = aL,
				GetFlag = aM,
				Copy = aJ,
			}
		end

		return an
	end
	function z.e()
		local aa = game:GetService("HttpService")
		local ab = {}

		function ab.New(ac)
			local ad = gethwid or function()
				return p.UserId
			end
			local ae, af = request or http_request or syn_request, u or toclipboard

			function ValidateKey(ag)
				local ah = "https://pandadevelopment.net/v2_validation?key="
					.. tostring(ag)
					.. "&service="
					.. tostring(ac)
					.. "&hwid="
					.. tostring(ad())

				local ai, aj = pcall(function()
					return ae({
						Url = ah,
						Method = "GET",
						Headers = { ["User-Agent"] = "Roblox/Exploit" },
					})
				end)

				if ai and aj then
					if aj.Success then
						local ak, al = pcall(function()
							return aa:JSONDecode(aj.Body)
						end)

						if ak and al then
							if al.V2_Authentication and al.V2_Authentication == "success" then
								return true, "Authenticated"
							else
								local am = al.Key_Information.Notes or "Unknown reason"

								return false, "Authentication failed: " .. am
							end
						else
							return false, "JSON decode error"
						end
					else
						warn(
							"[Pelinda Ov2.5] HTTP request was not successful. Code: "
								.. tostring(aj.StatusCode)
								.. " Message: "
								.. aj.StatusMessage
						)
						return false, "HTTP request failed: " .. aj.StatusMessage
					end
				else
					return false, "Request pcall error"
				end
			end

			function GetKeyLink()
				return "https://pandadevelopment.net/getkey?service=" .. tostring(ac) .. "&hwid=" .. tostring(ad())
			end

			function CopyLink()
				return af(GetKeyLink())
			end

			return {
				Verify = ValidateKey,
				Copy = CopyLink,
			}
		end

		return ab
	end
	function z.f()
		local aa = {}

		function aa.New(ab, ac)
			local ad = "https://sdkapi-public.luarmor.net/library.lua"

			local ae = loadstring(game.HttpGetAsync and game:HttpGetAsync(ad) or j:GetAsync(ad))()
			local af = u or toclipboard

			ae.script_id = ab

			function ValidateKey(ag)
				local ah = ae.check_key(ag)

				if ah.code == "KEY_VALID" then
					return true, "Whitelisted!"
				elseif ah.code == "KEY_HWID_LOCKED" then
					return false, "Key linked to a different HWID. Please reset it using our bot"
				elseif ah.code == "KEY_INCORRECT" then
					return false, "Key is wrong or deleted!"
				else
					return false, "Key check failed:" .. ah.message .. " Code: " .. ah.code
				end
			end

			function CopyLink()
				af(tostring(ac))
			end

			return {
				Verify = ValidateKey,
				Copy = CopyLink,
			}
		end

		return aa
	end
	function z.g()
		return {
			platoboost = {
				Name = "Platoboost",
				Icon = "rbxassetid://75920162824531",
				Args = { "ServiceId", "Secret" },

				New = z.load("d").New,
			},
			pandadevelopment = {
				Name = "Panda Development",
				Icon = "panda",
				Args = { "ServiceId" },

				New = z.load("e").New,
			},
			luarmor = {
				Name = "Luarmor",
				Icon = "rbxassetid://130918283130165",
				Args = { "ScriptId", "Discord" },

				New = z.load("f").New,
			},
		}
	end
	function z.h()
		return [[
{
    "name": "windui",
    "version": "1.6.53",
    "main": "./dist/main.lua",
    "repository": "https://github.com/Footagesus/WindUI",
    "discord": "https://discord.gg/ftgs-development-hub-1300692552005189632",
    "author": "Footagesus",
    "description": "Roblox UI Library for scripts",
    "license": "MIT",
    "scripts": {
        "dev": "sh build/build.sh dev $INPUT_FILE",
        "build": "sh build/build.sh build $INPUT_FILE",
        "live": "python -m http.server 8642",
        "watch": "chokidar . -i 'node_modules' -i 'dist' -i 'build' -c 'npm run dev --'",
        "live-build": "concurrently \"npm run live\" \"npm run watch --\"",
        "updater": "python updater/main.py"
    },
    "keywords": [
        "ui-library",
        "ui-design",
        "script",
        "script-hub",
        "exploiting"
    ],
    "devDependencies": {
        "chokidar-cli": "^3.0.0",
        "concurrently": "^9.2.0"
    }
}]]
	end
	function z.i()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		function aa.New(ae, af, ag, ah, ai, aj, ak)
			ah = ah or "Primary"
			local al = not ak and 10 or 99
			local am
			if af and af ~= "" then
				am = ac("ImageLabel", {
					Image = ab.Icon(af)[1],
					ImageRectSize = ab.Icon(af)[2].ImageRectSize,
					ImageRectOffset = ab.Icon(af)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ImageColor3 = ah == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = ah == "White" and 0.4 or 0,
					ThemeTag = {
						ImageColor3 = ah ~= "White" and "Icon" or nil,
					},
				})
			end

			local an = ac("TextButton", {
				Size = UDim2.new(0, 0, 1, 0),
				AutomaticSize = "X",
				Parent = ai,
				BackgroundTransparency = 1,
			}, {
				ab.NewRoundFrame(al, "Squircle", {
					ThemeTag = {
						ImageColor3 = ah ~= "White" and "Button" or nil,
					},
					ImageColor3 = ah == "White" and Color3.new(1, 1, 1) or nil,
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Squircle",
					ImageTransparency = ah == "Primary" and 0 or ah == "White" and 0 or 1,
				}),

				ab.NewRoundFrame(al, "Squircle", {

					ImageColor3 = Color3.new(1, 1, 1),
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Special",
					ImageTransparency = ah == "Secondary" and 0.95 or 1,
				}),

				ab.NewRoundFrame(al, "Shadow-sm", {

					ImageColor3 = Color3.new(0, 0, 0),
					Size = UDim2.new(1, 3, 1, 3),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Shadow",

					ImageTransparency = 1,
					Visible = not ak,
				}),

				ab.NewRoundFrame(al, not ak and "SquircleOutline" or "SquircleOutline2", {
					ThemeTag = {
						ImageColor3 = ah ~= "White" and "Outline" or nil,
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageColor3 = ah == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = ah == "Primary" and 0.95 or 0.85,
					Name = "SquircleOutline",
				}, {
					ac("UIGradient", {
						Rotation = 70,
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						}),
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}),
					}),
				}),

				ab.NewRoundFrame(al, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Frame",
					ThemeTag = {
						ImageColor3 = ah ~= "White" and "Text" or nil,
					},
					ImageColor3 = ah == "White" and Color3.new(0, 0, 0) or nil,
					ImageTransparency = 1,
				}, {
					ac("UIPadding", {
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
					}),
					ac("UIListLayout", {
						FillDirection = "Horizontal",
						Padding = UDim.new(0, 8),
						VerticalAlignment = "Center",
						HorizontalAlignment = "Center",
					}),
					am,
					ac("TextLabel", {
						BackgroundTransparency = 1,
						FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
						Text = ae or "Button",
						ThemeTag = {
							TextColor3 = (ah ~= "Primary" and ah ~= "White") and "Text",
						},
						TextColor3 = ah == "Primary" and Color3.new(1, 1, 1)
							or ah == "White" and Color3.new(0, 0, 0)
							or nil,
						AutomaticSize = "XY",
						TextSize = 18,
					}),
				}),
			})

			ab.AddSignal(an.MouseEnter, function()
				ad(an.Frame, 0.047, { ImageTransparency = 0.95 }):Play()
			end)
			ab.AddSignal(an.MouseLeave, function()
				ad(an.Frame, 0.047, { ImageTransparency = 1 }):Play()
			end)
			ab.AddSignal(an.MouseButton1Up, function()
				if aj then
					aj:Close()()
				end
				if ag then
					ab.SafeCallback(ag)
				end
			end)

			return an
		end

		return aa
	end
	function z.j()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		function aa.New(ae, af, ag, ah, ai, aj, ak, al)
			ah = ah or "Input"
			local am = ak or 10
			local an
			if af and af ~= "" then
				an = ac("ImageLabel", {
					Image = ab.Icon(af)[1],
					ImageRectSize = ab.Icon(af)[2].ImageRectSize,
					ImageRectOffset = ab.Icon(af)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Icon",
					},
				})
			end

			local ao = ah ~= "Input"

			local ap = ac("TextBox", {
				BackgroundTransparency = 1,
				TextSize = 17,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Regular),
				Size = UDim2.new(1, an and -29 or 0, 1, 0),
				PlaceholderText = ae,
				ClearTextOnFocus = al or false,
				ClipsDescendants = true,
				TextWrapped = ao,
				MultiLine = ao,
				TextXAlignment = "Left",
				TextYAlignment = ah == "Input" and "Center" or "Top",

				ThemeTag = {
					PlaceholderColor3 = "PlaceholderText",
					TextColor3 = "Text",
				},
			})

			local aq = ac("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				Parent = ag,
				BackgroundTransparency = 1,
			}, {
				ac("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					ab.NewRoundFrame(am, "Squircle", {
						ThemeTag = {
							ImageColor3 = "Accent",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = 0.97,
					}),
					ab.NewRoundFrame(am, "SquircleOutline", {
						ThemeTag = {
							ImageColor3 = "Outline",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = 0.95,
					}, {}),
					ab.NewRoundFrame(am, "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						Name = "Frame",
						ImageColor3 = Color3.new(1, 1, 1),
						ImageTransparency = 0.95,
					}, {
						ac("UIPadding", {
							PaddingTop = UDim.new(0, ah == "Input" and 0 or 12),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, ah == "Input" and 0 or 12),
						}),
						ac("UIListLayout", {
							FillDirection = "Horizontal",
							Padding = UDim.new(0, 8),
							VerticalAlignment = ah == "Input" and "Center" or "Top",
							HorizontalAlignment = "Left",
						}),
						an,
						ap,
					}),
				}),
			})

			if aj then
				ab.AddSignal(ap:GetPropertyChangedSignal("Text"), function()
					if ai then
						ab.SafeCallback(ai, ap.Text)
					end
				end)
			else
				ab.AddSignal(ap.FocusLost, function()
					if ai then
						ab.SafeCallback(ai, ap.Text)
					end
				end)
			end

			return aq
		end

		return aa
	end
	function z.k()
		local aa = z.load("a")
		local ab = aa.New
		local ac = aa.Tween

		local ad = {
			Holder = nil,

			Parent = nil,
		}

		function ad.Init(ae, af)
			Window = ae
			ad.Parent = af
			return ad
		end

		function ad.Create(ae)
			local af = {
				UICorner = 24,
				UIPadding = 15,
				UIElements = {},
			}

			if ae then
				af.UIPadding = 0
			end
			if ae then
				af.UICorner = 26
			end

			if not ae then
				af.UIElements.FullScreen = ab("Frame", {
					ZIndex = 999,
					BackgroundTransparency = 1,
					BackgroundColor3 = Color3.fromHex("#000000"),
					Size = UDim2.new(1, 0, 1, 0),
					Active = false,
					Visible = false,
					Parent = ad.Parent
						or (Window and Window.UIElements and Window.UIElements.Main and Window.UIElements.Main.Main),
				}, {
					ab("UICorner", {
						CornerRadius = UDim.new(0, Window.UICorner),
					}),
				})
			end

			af.UIElements.Main = ab("Frame", {
				Size = UDim2.new(0, 280, 0, 0),
				ThemeTag = {
					BackgroundColor3 = "Dialog",
				},
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
				Visible = false,
				ZIndex = 99999,
			}, {
				ab("UIPadding", {
					PaddingTop = UDim.new(0, af.UIPadding),
					PaddingLeft = UDim.new(0, af.UIPadding),
					PaddingRight = UDim.new(0, af.UIPadding),
					PaddingBottom = UDim.new(0, af.UIPadding),
				}),
			})

			af.UIElements.MainContainer = aa.NewRoundFrame(af.UICorner, "Squircle", {
				Visible = false,

				ImageTransparency = ae and 0.15 or 0,
				Parent = ae and ad.Parent or af.UIElements.FullScreen,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				AutomaticSize = "XY",
				ThemeTag = {
					ImageColor3 = "Dialog",
				},
				ZIndex = 9999,
			}, {

				af.UIElements.Main,

				aa.NewRoundFrame(af.UICorner, "SquircleOutline2", {
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Outline",
					},
				}, {
					ab("UIGradient", {
						Rotation = 45,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0.55),
							NumberSequenceKeypoint.new(0.5, 0.8),
							NumberSequenceKeypoint.new(1, 0.6),
						}),
					}),
				}),
			})

			function af.Open(ag)
				if not ae then
					af.UIElements.FullScreen.Visible = true
					af.UIElements.FullScreen.Active = true
				end

				task.spawn(function()
					af.UIElements.MainContainer.Visible = true

					if not ae then
						ac(af.UIElements.FullScreen, 0.1, { BackgroundTransparency = 0.3 }):Play()
					end
					ac(af.UIElements.MainContainer, 0.1, { ImageTransparency = 0 }):Play()

					task.spawn(function()
						task.wait(0.05)
						af.UIElements.Main.Visible = true
					end)
				end)
			end
			function af.Close(ag)
				if not ae then
					ac(af.UIElements.FullScreen, 0.1, { BackgroundTransparency = 1 }):Play()
					af.UIElements.FullScreen.Active = false
					task.spawn(function()
						task.wait(0.1)
						af.UIElements.FullScreen.Visible = false
					end)
				end
				af.UIElements.Main.Visible = false

				ac(af.UIElements.MainContainer, 0.1, { ImageTransparency = 1 }):Play()

				task.spawn(function()
					task.wait(0.1)
					if not ae then
						af.UIElements.FullScreen:Destroy()
					else
						af.UIElements.MainContainer:Destroy()
					end
				end)

				return function() end
			end

			return af
		end

		return ad
	end
	function z.l()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		local ae = z.load("i").New
		local af = z.load("j").New

		function aa.new(ag, ah, ai)
			local aj = z.load("k").Init(nil, ag.WindUI.ScreenGui.KeySystem)
			local ak = aj.Create(true)

			local al = {}

			local am

			local an = (ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Width) or 200

			local ao = 430
			if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
				ao = 430 + (an / 2)
			end

			ak.UIElements.Main.AutomaticSize = "Y"
			ak.UIElements.Main.Size = UDim2.new(0, ao, 0, 0)

			local ap

			if ag.Icon then
				ap = ab.Image(ag.Icon, ag.Title .. ":" .. ag.Icon, 0, "Temp", "KeySystem", ag.IconThemed)
				ap.Size = UDim2.new(0, 24, 0, 24)
				ap.LayoutOrder = -1
			end

			local aq = ac("TextLabel", {
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Text = ag.Title,
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 20,
			})
			local ar = ac("TextLabel", {
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Text = "Key System",
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, 0, 0.5, 0),
				TextTransparency = 1,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 16,
			})

			local as = ac("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				ac("UIListLayout", {
					Padding = UDim.new(0, 14),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),
				ap,
				aq,
			})

			local at = ac("Frame", {
				AutomaticSize = "Y",
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {

				as,
				ar,
			})

			local au = af("Enter Key", "key", nil, "Input", function(au)
				am = au
			end)

			local av
			if ag.KeySystem.Note and ag.KeySystem.Note ~= "" then
				av = ac("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
					TextXAlignment = "Left",
					Text = ag.KeySystem.Note,
					TextSize = 18,
					TextTransparency = 0.4,
					ThemeTag = {
						TextColor3 = "Text",
					},
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true,
				})
			end

			local aw = ac("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				BackgroundTransparency = 1,
			}, {
				ac("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = "X",
					Size = UDim2.new(0, 0, 1, 0),
				}, {
					ac("UIListLayout", {
						Padding = UDim.new(0, 9),
						FillDirection = "Horizontal",
					}),
				}),
			})

			local ax
			if ag.KeySystem.Thumbnail and ag.KeySystem.Thumbnail.Image then
				local ay
				if ag.KeySystem.Thumbnail.Title then
					ay = ac("TextLabel", {
						Text = ag.KeySystem.Thumbnail.Title,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextSize = 18,
						FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
						BackgroundTransparency = 1,
						AutomaticSize = "XY",
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
					})
				end
				ax = ac("ImageLabel", {
					Image = ag.KeySystem.Thumbnail.Image,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, an, 1, -12),
					Position = UDim2.new(0, 6, 0, 6),
					Parent = ak.UIElements.Main,
					ScaleType = "Crop",
				}, {
					ay,
					ac("UICorner", {
						CornerRadius = UDim.new(0, 20),
					}),
				})
			end

			ac("Frame", {

				Size = UDim2.new(1, ax and -an or 0, 1, 0),
				Position = UDim2.new(0, ax and an or 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = ak.UIElements.Main,
			}, {
				ac("Frame", {

					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					ac("UIListLayout", {
						Padding = UDim.new(0, 18),
						FillDirection = "Vertical",
					}),
					at,
					av,
					au,
					aw,
					ac("UIPadding", {
						PaddingTop = UDim.new(0, 16),
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
						PaddingBottom = UDim.new(0, 16),
					}),
				}),
			})

			local ay = ae("Exit", "log-out", function()
				ak:Close()()
			end, "Tertiary", aw.Frame)

			if ax then
				ay.Parent = ax
				ay.Size = UDim2.new(0, 0, 0, 42)
				ay.Position = UDim2.new(0, 10, 1, -10)
				ay.AnchorPoint = Vector2.new(0, 1)
			end

			if ag.KeySystem.URL then
				ae("Get key", "key", function()
					u(ag.KeySystem.URL)
				end, "Secondary", aw.Frame)
			end

			if ag.KeySystem.API then
				local az = 240
				local aA = false
				local aB = ae("Get key", "key", nil, "Secondary", aw.Frame)

				local aC = ab.NewRoundFrame(99, "Squircle", {
					Size = UDim2.new(0, 1, 1, 0),
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 0.9,
				})

				ac("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 1, 0),
					AutomaticSize = "X",
					Parent = aB.Frame,
				}, {
					aC,
					ac("UIPadding", {
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
					}),
				})

				local aD = ab.Image("chevron-down", "chevron-down", 0, "Temp", "KeySystem", true)

				aD.Size = UDim2.new(1, 0, 1, 0)

				ac("Frame", {
					Size = UDim2.new(0, 21, 0, 21),
					Parent = aB.Frame,
					BackgroundTransparency = 1,
				}, {
					aD,
				})

				local aE = ab.NewRoundFrame(15, "Squircle", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						ImageColor3 = "Background",
					},
				}, {
					ac("UIPadding", {
						PaddingTop = UDim.new(0, 5),
						PaddingLeft = UDim.new(0, 5),
						PaddingRight = UDim.new(0, 5),
						PaddingBottom = UDim.new(0, 5),
					}),
					ac("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, 5),
					}),
				})

				local aF = ac("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(0, az, 0, 0),
					ClipsDescendants = true,
					AnchorPoint = Vector2.new(1, 0),
					Parent = aB,
					Position = UDim2.new(1, 0, 1, 15),
				}, {
					aE,
				})

				ac("TextLabel", {
					Text = "Select Service",
					BackgroundTransparency = 1,
					FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
					ThemeTag = { TextColor3 = "Text" },
					TextTransparency = 0.2,
					TextSize = 16,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					TextWrapped = true,
					TextXAlignment = "Left",
					Parent = aE,
				}, {
					ac("UIPadding", {
						PaddingTop = UDim.new(0, 10),
						PaddingLeft = UDim.new(0, 10),
						PaddingRight = UDim.new(0, 10),
						PaddingBottom = UDim.new(0, 10),
					}),
				})

				for aG, aH in next, ag.KeySystem.API do
					local aI = ag.WindUI.Services[aH.Type]
					if aI then
						local aJ = {}
						for aK, aL in next, aI.Args do
							table.insert(aJ, aH[aL])
						end

						local aK = aI.New(table.unpack(aJ))
						aK.Type = aH.Type
						table.insert(al, aK)

						local aL = ab.Image(
							aH.Icon or aI.Icon or Icons[aH.Type] or "user",
							aH.Icon or aI.Icon or Icons[aH.Type] or "user",
							0,
							"Temp",
							"KeySystem",
							true
						)
						aL.Size = UDim2.new(0, 24, 0, 24)

						local aM = ab.NewRoundFrame(10, "Squircle", {
							Size = UDim2.new(1, 0, 0, 0),
							ThemeTag = { ImageColor3 = "Text" },
							ImageTransparency = 1,
							Parent = aE,
							AutomaticSize = "Y",
						}, {
							ac("UIListLayout", {
								FillDirection = "Horizontal",
								Padding = UDim.new(0, 10),
								VerticalAlignment = "Center",
							}),
							aL,
							ac("UIPadding", {
								PaddingTop = UDim.new(0, 10),
								PaddingLeft = UDim.new(0, 10),
								PaddingRight = UDim.new(0, 10),
								PaddingBottom = UDim.new(0, 10),
							}),
							ac("Frame", {
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -34, 0, 0),
								AutomaticSize = "Y",
							}, {
								ac("UIListLayout", {
									FillDirection = "Vertical",
									Padding = UDim.new(0, 5),
									HorizontalAlignment = "Center",
								}),
								ac("TextLabel", {
									Text = aH.Title or aI.Name,
									BackgroundTransparency = 1,
									FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
									ThemeTag = { TextColor3 = "Text" },
									TextTransparency = 0.05,
									TextSize = 18,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = "Y",
									TextWrapped = true,
									TextXAlignment = "Left",
								}),
								ac("TextLabel", {
									Text = aH.Desc or "",
									BackgroundTransparency = 1,
									FontFace = Font.new(ab.Font, Enum.FontWeight.Regular),
									ThemeTag = { TextColor3 = "Text" },
									TextTransparency = 0.2,
									TextSize = 16,
									Size = UDim2.new(1, 0, 0, 0),
									AutomaticSize = "Y",
									TextWrapped = true,
									Visible = aH.Desc and true or false,
									TextXAlignment = "Left",
								}),
							}),
						}, true)

						ab.AddSignal(aM.MouseEnter, function()
							ad(aM, 0.08, { ImageTransparency = 0.95 }):Play()
						end)
						ab.AddSignal(aM.InputEnded, function()
							ad(aM, 0.08, { ImageTransparency = 1 }):Play()
						end)
						ab.AddSignal(aM.MouseButton1Click, function()
							aK.Copy()
							ag.WindUI:Notify({
								Title = "Key System",
								Content = "Key link copied to clipboard.",
								Image = "key",
							})
						end)
					end
				end

				ab.AddSignal(aB.MouseButton1Click, function()
					if not aA then
						ad(
							aF,
							0.3,
							{ Size = UDim2.new(0, az, 0, aE.AbsoluteSize.Y + 1) },
							Enum.EasingStyle.Quint,
							Enum.EasingDirection.Out
						):Play()
						ad(aD, 0.3, { Rotation = 180 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					else
						ad(
							aF,
							0.25,
							{ Size = UDim2.new(0, az, 0, 0) },
							Enum.EasingStyle.Quint,
							Enum.EasingDirection.Out
						):Play()
						ad(aD, 0.25, { Rotation = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
					aA = not aA
				end)
			end

			local function handleSuccess(az)
				ak:Close()()
				writefile((ag.Folder or ag.Title) .. "/" .. ah .. ".key", tostring(az))
				task.wait(0.4)
				ai(true)
			end

			local az = ae("Submit", "arrow-right", function()
				local az = tostring(am or "empty")
				local aA = ag.Folder or ag.Title

				if not ag.KeySystem.API then
					local aB = type(ag.KeySystem.Key) == "table" and table.find(ag.KeySystem.Key, az)
						or ag.KeySystem.Key == az

					if aB then
						if ag.KeySystem.SaveKey then
							handleSuccess(az)
						else
							ak:Close()()
							task.wait(0.4)
							ai(true)
						end
					end
				else
					local aB, aC
					for aD, aE in next, al do
						local aF, aG = aE.Verify(az)
						if aF then
							aB, aC = true, aG
							break
						end
						aC = aG
					end

					if aB then
						handleSuccess(az)
					else
						ag.WindUI:Notify({
							Title = "Key System. Error",
							Content = aC,
							Icon = "triangle-alert",
						})
					end
				end
			end, "Primary", aw)

			az.AnchorPoint = Vector2.new(1, 0.5)
			az.Position = UDim2.new(1, 0, 0.5, 0)

			ak:Open()
		end

		return aa
	end
	function z.m()
		local function map(aa, ab, ac, ad, ae)
			return (aa - ab) * (ae - ad) / (ac - ab) + ad
		end

		local function viewportPointToWorld(aa, ab)
			local ac = h.CurrentCamera:ScreenPointToRay(aa.X, aa.Y)
			return ac.Origin + ac.Direction * ab
		end

		local function getOffset()
			local aa = h.CurrentCamera.ViewportSize.Y
			return map(aa, 0, 2560, 8, 56)
		end

		return { viewportPointToWorld, getOffset }
	end
	function z.n() end
	function z.o()
		local aa = z.load("a")
		local ab = z.load("n")

		local ac = aa.New

		return function(ad)
			local ae = {}

			ae.Frame = ac("Frame", {
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 1,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BorderSizePixel = 0,
			}, {

				ac("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),

				ac("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Name = "Background",
					ThemeTag = {
						BackgroundColor3 = "AcrylicMain",
					},
				}, {
					ac("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),

				ac("Frame", {
					BackgroundColor3 = Color3.fromRGB(255, 255, 255),
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
				}, {}),

				ac("ImageLabel", {
					Image = "rbxassetid://9968344105",
					ImageTransparency = 0.98,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
				}, {
					ac("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),

				ac("ImageLabel", {
					Image = "rbxassetid://9968344227",
					ImageTransparency = 0.9,
					ScaleType = Enum.ScaleType.Tile,
					TileSize = UDim2.new(0, 128, 0, 128),
					Size = UDim2.fromScale(1, 1),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageTransparency = "AcrylicNoise",
					},
				}, {
					ac("UICorner", {
						CornerRadius = UDim.new(0, 8),
					}),
				}),

				ac("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					ZIndex = 2,
				}, {}),
			})

			local af

			task.wait()
			if ad.UseAcrylic then
				af = ab()

				af.Frame.Parent = ae.Frame
				ae.Model = af.Model
				ae.AddParent = af.AddParent
				ae.SetVisibility = af.SetVisibility
			end

			return ae, af
		end
	end
	function z.p()
		local aa = {
			AcrylicBlur = z.load("n"),

			AcrylicPaint = z.load("o"),
		}

		function aa.init()
			local ab = Instance.new("DepthOfFieldEffect")
			ab.FarIntensity = 0
			ab.InFocusRadius = 0.1
			ab.NearIntensity = 1

			local ac = {}

			function aa.Enable()
				for ad, ae in pairs(ac) do
					ae.Enabled = false
				end
				ab.Parent = nil
			end

			function aa.Disable()
				for ad, ae in pairs(ac) do
					ae.Enabled = ae.enabled
				end
				ab.Parent = nil
			end

			local function registerDefaults()
				local function register(ad)
					if ad:IsA("DepthOfFieldEffect") then
						ac[ad] = { enabled = ad.Enabled }
					end
				end

				for ad, ae in pairs(l:GetChildren()) do
					register(ae)
				end

				if h.CurrentCamera then
					for ad, ae in pairs(h.CurrentCamera:GetChildren()) do
						register(ae)
					end
				end
			end

			registerDefaults()
			aa.Enable()
		end

		return aa
	end
	function z.q()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		function aa.new(ae)
			local af = {
				Title = ae.Title or "Dialog",
				Content = ae.Content,
				Icon = ae.Icon,
				IconThemed = ae.IconThemed,
				Thumbnail = ae.Thumbnail,
				Buttons = ae.Buttons,

				IconSize = 22,
			}

			local ag = z.load("k").Init(nil, ae.WindUI.ScreenGui.Popups)
			local ah = ag.Create(true)

			local ai = 200

			local aj = 430
			if af.Thumbnail and af.Thumbnail.Image then
				aj = 430 + (ai / 2)
			end

			ah.UIElements.Main.AutomaticSize = "Y"
			ah.UIElements.Main.Size = UDim2.new(0, aj, 0, 0)

			local ak

			if af.Icon then
				ak = ab.Image(af.Icon, af.Title .. ":" .. af.Icon, 0, ae.WindUI.Window, "Popup", true, ae.IconThemed)
				ak.Size = UDim2.new(0, af.IconSize, 0, af.IconSize)
				ak.LayoutOrder = -1
			end

			local al = ac("TextLabel", {
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
				Text = af.Title,
				TextXAlignment = "Left",
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				ThemeTag = {
					TextColor3 = "Text",
				},
				TextSize = 20,
				TextWrapped = true,
				Size = UDim2.new(1, ak and -af.IconSize - 14 or 0, 0, 0),
			})

			local am = ac("Frame", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				ac("UIListLayout", {
					Padding = UDim.new(0, 14),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),
				ak,
				al,
			})

			local an = ac("Frame", {
				AutomaticSize = "Y",
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
			}, {

				am,
			})

			local ao
			if af.Content and af.Content ~= "" then
				ao = ac("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
					TextXAlignment = "Left",
					Text = af.Content,
					TextSize = 18,
					TextTransparency = 0.2,
					ThemeTag = {
						TextColor3 = "Text",
					},
					BackgroundTransparency = 1,
					RichText = true,
					TextWrapped = true,
				})
			end

			local ap = ac("Frame", {
				Size = UDim2.new(1, 0, 0, 42),
				BackgroundTransparency = 1,
			}, {
				ac("UIListLayout", {
					Padding = UDim.new(0, 9),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right",
				}),
			})

			local aq
			if af.Thumbnail and af.Thumbnail.Image then
				local ar
				if af.Thumbnail.Title then
					ar = ac("TextLabel", {
						Text = af.Thumbnail.Title,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextSize = 18,
						FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
						BackgroundTransparency = 1,
						AutomaticSize = "XY",
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
					})
				end
				aq = ac("ImageLabel", {
					Image = af.Thumbnail.Image,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, ai, 1, 0),
					Parent = ah.UIElements.Main,
					ScaleType = "Crop",
				}, {
					ar,
					ac("UICorner", {
						CornerRadius = UDim.new(0, 0),
					}),
				})
			end

			ac("Frame", {

				Size = UDim2.new(1, aq and -ai or 0, 1, 0),
				Position = UDim2.new(0, aq and ai or 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = ah.UIElements.Main,
			}, {
				ac("Frame", {

					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					ac("UIListLayout", {
						Padding = UDim.new(0, 18),
						FillDirection = "Vertical",
					}),
					an,
					ao,
					ap,
					ac("UIPadding", {
						PaddingTop = UDim.new(0, 16),
						PaddingLeft = UDim.new(0, 16),
						PaddingRight = UDim.new(0, 16),
						PaddingBottom = UDim.new(0, 16),
					}),
				}),
			})

			local ar = z.load("i").New

			for as, at in next, af.Buttons do
				ar(at.Title, at.Icon, at.Callback, at.Variant, ap, ah)
			end

			ah:Open()

			return af
		end

		return aa
	end
	function z.r()
		return function(aa)
			return {
				LoveLetter = {
					Name = "Love Letter",
					Accent = Color3.fromHex("#e2e2d5"),
					Dialog = Color3.fromHex("#f5f5dc"),
					Outline = Color3.fromHex("#704241"),
					Text = Color3.fromHex("#2d2d2d"),
					Placeholder = Color3.fromHex("#a68a8a"),
					Background = Color3.fromHex("#ece0d1"),
					Button = Color3.fromHex("#5d3a3a"),
					Icon = Color3.fromHex("#8c6b6b"),
				},
				PhantomStorm = {
					Name = "PhantomStorm",
					Accent = Color3.fromHex("#7b2fff"),
					Dialog = Color3.fromHex("#1a0a2e"),
					Outline = Color3.fromHex("#c084fc"),
					Text = Color3.fromHex("#f0e6ff"),
					Placeholder = Color3.fromHex("#a855f7"),
					Background = Color3.fromHex("#0a0014"),
					Button = Color3.fromHex("#c026d3"),
					Icon = Color3.fromHex("#e879f9"),
				},
				Sweetheart = {
					Name = "Sweetheart",
					Accent = Color3.fromHex("#ff85a1"),
					Dialog = Color3.fromHex("#ffc2d1"),
					Outline = Color3.fromHex("#fb6f92"),
					Text = Color3.fromHex("#ffe5ec"),
					Placeholder = Color3.fromHex("#ffb3c1"),
					Background = Color3.fromHex("#4d0d1d"),
					Button = Color3.fromHex("#ff5c8a"),
					Icon = Color3.fromHex("#ffafcc"),
				},
				Valentine = {
					Name = "Valentine",
					Accent = Color3.fromHex("#e11d48"),
					Dialog = Color3.fromHex("#4c0519"),
					Outline = Color3.fromHex("#ffe4e6"),
					Text = Color3.fromHex("#fff1f2"),
					Placeholder = Color3.fromHex("#fb7185"),
					Background = Color3.fromHex("#1f030b"),
					Button = Color3.fromHex("#be123c"),
					Icon = Color3.fromHex("#fda4af"),
				},
				Christmas = {
					Name = "Christmas",
					Accent = Color3.fromHex("#2ecc71"),
					Dialog = Color3.fromHex("#144d12"),
					Outline = Color3.fromHex("#e74c3c"),
					Text = Color3.fromHex("#fffaf5"),
					Placeholder = Color3.fromHex("#c7d9c7"),
					Background = Color3.fromHex("#1b2e1b"),
					Button = Color3.fromHex("#e63939"),
					Icon = Color3.fromHex("#ffdfba"),
				},

				Dark = {
					Name = "Dark",
					Accent = Color3.fromHex("#18181b"),
					Dialog = Color3.fromHex("#161616"),
					Outline = Color3.fromHex("#FFFFFF"),
					Text = Color3.fromHex("#FFFFFF"),
					Placeholder = Color3.fromHex("#7a7a7a"),
					Background = Color3.fromHex("#101010"),
					Button = Color3.fromHex("#52525b"),
					Icon = Color3.fromHex("#a1a1aa"),
				},
				Light = {
					Name = "Light",
					Accent = Color3.fromHex("#FFFFFF"),
					Dialog = Color3.fromHex("#f4f4f5"),
					Outline = Color3.fromHex("#09090b"),
					Text = Color3.fromHex("#000000"),
					Placeholder = Color3.fromHex("#777777"),
					Background = Color3.fromHex("#e4e4e7"),
					Button = Color3.fromHex("#18181b"),
					Icon = Color3.fromHex("#52525b"),
				},
				Red = {
					Name = "Red",
					Accent = Color3.fromHex("#991b1b"),
					Dialog = Color3.fromHex("#450a0a"),
					Outline = Color3.fromHex("#fecaca"),
					Text = Color3.fromHex("#fef2f2"),
					Placeholder = Color3.fromHex("#d95353"),
					Background = Color3.fromHex("#1c0606"),
					Button = Color3.fromHex("#dc2626"),
					Icon = Color3.fromHex("#ef4444"),
				},
				Lavender = {
					Name = "Lavender",
					Accent = "#b497bd",
					Outline = "#f3e8ff",
					Text = "#f3e8ff",
					Placeholder = "#d8b4ff",
					Background = "#5d3a6d",
					Button = "#b497bd",
					Icon = "#e9d5ff",
				},

				Indigo = {
					Name = "Indigo",
					Accent = Color3.fromHex("#3730a3"),
					Dialog = Color3.fromHex("#1e1b4b"),
					Outline = Color3.fromHex("#c7d2fe"),
					Text = Color3.fromHex("#f1f5f9"),
					Placeholder = Color3.fromHex("#7078d9"),
					Background = Color3.fromHex("#0f0a2e"),
					Button = Color3.fromHex("#4f46e5"),
					Icon = Color3.fromHex("#6366f1"),
				},
				Violet = {
					Name = "Violet",
					Accent = Color3.fromHex("#7c3aed"),
					Dialog = Color3.fromHex("#3c1361"),
					Outline = Color3.fromHex("#ddd6fe"),
					Text = Color3.fromHex("#faf5ff"),
					Placeholder = Color3.fromHex("#c4b5fd"),
					Background = Color3.fromHex("#1e0a3e"),
					Button = Color3.fromHex("#7c3aed"),
					Icon = Color3.fromHex("#a78bfa"),
				},
				Amber = {
					Name = "Amber",
					Accent = Color3.fromHex("#b45309"),
					Dialog = Color3.fromHex("#451a03"),
					Outline = Color3.fromHex("#fde68a"),
					Text = Color3.fromHex("#fffbeb"),
					Placeholder = Color3.fromHex("#fcd34d"),
					Background = Color3.fromHex("#1c1003"),
					Button = Color3.fromHex("#d97706"),
					Icon = Color3.fromHex("#f59e0b"),
				},
				Emerald = {
					Name = "Emerald",
					Accent = Color3.fromHex("#047857"),
					Dialog = Color3.fromHex("#022c22"),
					Outline = Color3.fromHex("#a7f3d0"),
					Text = Color3.fromHex("#ecfdf5"),
					Placeholder = Color3.fromHex("#3fbf8f"),
					Background = Color3.fromHex("#011411"),
					Button = Color3.fromHex("#059669"),
					Icon = Color3.fromHex("#10b981"),
				},

				Christmas = {
					Name = "Christmas",
					Accent = Color3.fromHex("#2ecc71"),
					Dialog = Color3.fromHex("#144d12"),
					Outline = Color3.fromHex("#e74c3c"),
					Text = Color3.fromHex("#fffaf5"),
					Placeholder = Color3.fromHex("#c7d9c7"),
					Background = Color3.fromHex("#1b2e1b"),
					Button = Color3.fromHex("#e63939"),
					Icon = Color3.fromHex("#ffdfba"),
				},

				Halloween = {
					Name = "Halloween",
					Accent = Color3.fromHex("#ff7518"),
					Dialog = Color3.fromHex("#2e1408"),
					Outline = Color3.fromHex("#ffb66a"),
					Text = Color3.fromHex("#fff3e0"),
					Placeholder = Color3.fromHex("#d88a4a"),
					Background = Color3.fromHex("#3b180b"),
					Button = Color3.fromHex("#ff8c33"),
					Icon = Color3.fromHex("#ffbb88"),
				},

				HalloweenMidnight = {
					Name = "Halloween Midnight",
					Accent = Color3.fromHex("#b347ff"),
					Dialog = Color3.fromHex("#1a0a26"),
					Outline = Color3.fromHex("#ff7518"),
					Text = Color3.fromHex("#f3e8ff"),
					Placeholder = Color3.fromHex("#b080d9"),
					Background = Color3.fromHex("#0a0214"),
					Button = Color3.fromHex("#d97706"),
					Icon = Color3.fromHex("#ffb347"),
				},

				HalloweenNight = {
					Name = "Halloween Night",
					Accent = Color3.fromHex("#ff6600"),
					Dialog = Color3.fromHex("#140a0a"),
					Outline = Color3.fromHex("#fbbf24"),
					Text = Color3.fromHex("#fef3c7"),
					Placeholder = Color3.fromHex("#b45309"),
					Background = Color3.fromHex("#0a0603"),
					Button = Color3.fromHex("#ff7518"),
					Icon = Color3.fromHex("#ff9900"),
				},

				Forest = {
					Name = "Forest",
					Accent = Color3.fromHex("#1e5631"),
					Dialog = Color3.fromHex("#0b2f1a"),
					Outline = Color3.fromHex("#d4edda"),
					Text = Color3.fromHex("#d4edda"),
					Placeholder = Color3.fromHex("#a7d7a7"),
					Background = Color3.fromHex("#061a0f"),
					Button = Color3.fromHex("#1e5631"),
					Icon = Color3.fromHex("#76c893"),
				},
				Ocean = {
					Name = "Ocean",
					Accent = Color3.fromHex("#0288d1"),
					Dialog = Color3.fromHex("#014f86"),
					Outline = Color3.fromHex("#cce7ff"),
					Text = Color3.fromHex("#cce7ff"),
					Placeholder = Color3.fromHex("#80d0ff"),
					Background = Color3.fromHex("#012a47"),
					Button = Color3.fromHex("#0288d1"),
					Icon = Color3.fromHex("#99e0ff"),
				},
				Coral = {
					Name = "Coral",
					Accent = Color3.fromHex("#ff6f61"),
					Dialog = Color3.fromHex("#7a2c27"),
					Outline = Color3.fromHex("#ffe5e0"),
					Text = Color3.fromHex("#ffe5e0"),
					Placeholder = Color3.fromHex("#ff9f91"),
					Background = Color3.fromHex("#3d1613"),
					Button = Color3.fromHex("#ff6f61"),
					Icon = Color3.fromHex("#ffb3ab"),
				},
				Sunset = {
					Name = "Sunset",
					Accent = Color3.fromHex("#ff7e5f"),
					Dialog = Color3.fromHex("#882d17"),
					Outline = Color3.fromHex("#ffe3de"),
					Text = Color3.fromHex("#ffe3de"),
					Placeholder = Color3.fromHex("#ffad99"),
					Background = Color3.fromHex("#44160b"),
					Button = Color3.fromHex("#ff7e5f"),
					Icon = Color3.fromHex("#ffc4b1"),
				},
				Peach = {
					Name = "Peach",
					Accent = Color3.fromHex("#ffb380"),
					Dialog = Color3.fromHex("#7a3e23"),
					Outline = Color3.fromHex("#fff0e0"),
					Text = Color3.fromHex("#fff0e0"),
					Placeholder = Color3.fromHex("#ffc9a3"),
					Background = Color3.fromHex("#3d1f11"),
					Button = Color3.fromHex("#ff9966"),
					Icon = Color3.fromHex("#ffd7b3"),
				},

				Aqua = {
					Name = "Aqua",
					Accent = Color3.fromHex("#00bcd4"),
					Dialog = Color3.fromHex("#004d59"),
					Outline = Color3.fromHex("#c0f4ff"),
					Text = Color3.fromHex("#c0f4ff"),
					Placeholder = Color3.fromHex("#80e5ff"),
					Background = Color3.fromHex("#002b33"),
					Button = Color3.fromHex("#00bcd4"),
					Icon = Color3.fromHex("#9ff7ff"),
				},
				Aurora = {
					Name = "Aurora",
					Accent = Color3.fromHex("#8fffc1"),
					Dialog = Color3.fromHex("#00332d"),
					Outline = Color3.fromHex("#e0fff9"),
					Text = Color3.fromHex("#e0fff9"),
					Placeholder = Color3.fromHex("#b0ffe0"),
					Background = Color3.fromHex("#001a16"),
					Button = Color3.fromHex("#8fffc1"),
					Icon = Color3.fromHex("#b8fff0"),
				},

				NeonBlue = {
					Name = "Neon Blue",
					Accent = Color3.fromHex("#33f6ff"),
					Dialog = Color3.fromHex("#121a33"),
					Outline = Color3.fromHex("#66faff"),
					Text = Color3.fromHex("#e6fcff"),
					Placeholder = Color3.fromHex("#99fdff"),
					Background = Color3.fromHex("#0a101f"),
					Button = Color3.fromHex("#1abfff"),
					Icon = Color3.fromHex("#66e0ff"),
				},
				NeonPink = {
					Name = "Neon Pink",
					Accent = Color3.fromHex("#ff33cc"),
					Dialog = Color3.fromHex("#291133"),
					Outline = Color3.fromHex("#ff66e0"),
					Text = Color3.fromHex("#ffe6f9"),
					Placeholder = Color3.fromHex("#ff99eb"),
					Background = Color3.fromHex("#14061a"),
					Button = Color3.fromHex("#ff4dd2"),
					Icon = Color3.fromHex("#ff80df"),
				},
				NeonGreen = {
					Name = "Neon Green",
					Accent = Color3.fromHex("#66ff33"),
					Dialog = Color3.fromHex("#123312"),
					Outline = Color3.fromHex("#80ff80"),
					Text = Color3.fromHex("#ebffeb"),
					Placeholder = Color3.fromHex("#aaffaa"),
					Background = Color3.fromHex("#0a1a0f"),
					Button = Color3.fromHex("#33ff66"),
					Icon = Color3.fromHex("#80ffaa"),
				},
				NeonYellow = {
					Name = "Neon Yellow",
					Accent = Color3.fromHex("#ffff4d"),
					Dialog = Color3.fromHex("#333300"),
					Outline = Color3.fromHex("#ffff80"),
					Text = Color3.fromHex("#ffffe6"),
					Placeholder = Color3.fromHex("#ffffb3"),
					Background = Color3.fromHex("#1a1a0a"),
					Button = Color3.fromHex("#ffeb4d"),
					Icon = Color3.fromHex("#fff799"),
				},
				Cyberpunk = {
					Name = "Cyberpunk",
					Accent = Color3.fromHex("#ff33aa"),
					Dialog = Color3.fromHex("#261133"),
					Outline = Color3.fromHex("#ff66ff"),
					Text = Color3.fromHex("#ffd6ff"),
					Placeholder = Color3.fromHex("#ff99ff"),
					Background = Color3.fromHex("#14061a"),
					Button = Color3.fromHex("#ff4de6"),
					Icon = Color3.fromHex("#ff80ff"),
				},
			}
		end
	end
	function z.s()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		function aa.New(ae, af, ag, ah)
			local ai = 10
			local aj
			if af and af ~= "" then
				aj = ac("ImageLabel", {
					Image = ab.Icon(af)[1],
					ImageRectSize = ab.Icon(af)[2].ImageRectSize,
					ImageRectOffset = ab.Icon(af)[2].ImageRectPosition,
					Size = UDim2.new(0, 21, 0, 21),
					BackgroundTransparency = 1,
					ThemeTag = {
						ImageColor3 = "Icon",
					},
				})
			end

			local ak = ac("TextLabel", {
				BackgroundTransparency = 1,
				TextSize = 17,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Regular),
				Size = UDim2.new(1, aj and -29 or 0, 1, 0),
				TextXAlignment = "Left",
				ThemeTag = {
					TextColor3 = ah and "Placeholder" or "Text",
				},
				Text = ae,
			})

			local al = ac("TextButton", {
				Size = UDim2.new(1, 0, 0, 42),
				Parent = ag,
				BackgroundTransparency = 1,
				Text = "",
			}, {
				ac("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
				}, {
					ab.NewRoundFrame(ai, "Squircle", {
						ThemeTag = {
							ImageColor3 = "Accent",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = 0.97,
					}),
					ab.NewRoundFrame(ai, "SquircleOutline", {
						ThemeTag = {
							ImageColor3 = "Outline",
						},
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = 0.95,
					}, {
						ac("UIGradient", {
							Rotation = 70,
							Color = ColorSequence.new({
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							}),
							Transparency = NumberSequence.new({
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}),
						}),
					}),
					ab.NewRoundFrame(ai, "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						Name = "Frame",
						ImageColor3 = Color3.new(1, 1, 1),
						ImageTransparency = 0.95,
					}, {
						ac("UIPadding", {
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
						}),
						ac("UIListLayout", {
							FillDirection = "Horizontal",
							Padding = UDim.new(0, 8),
							VerticalAlignment = "Center",
							HorizontalAlignment = "Left",
						}),
						aj,
						ak,
					}),
				}),
			})

			return al
		end

		return aa
	end
	function z.t()
		local aa = {}

		local ab = f

		local ac = z.load("a")
		local ad = ac.New
		local ae = ac.Tween

		function aa.New(af, ag, ah, ai)
			local aj = ad("Frame", {
				Size = UDim2.new(0, ai, 1, 0),
				BackgroundTransparency = 1,
				Position = UDim2.new(1, 0, 0, 0),
				AnchorPoint = Vector2.new(1, 0),
				Parent = ag,
				ZIndex = 999,
				Active = true,
			})

			local ak = ac.NewRoundFrame(ai / 2, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				ImageTransparency = 0.85,
				ThemeTag = { ImageColor3 = "Text" },
				Parent = aj,
			})

			local al = ad("Frame", {
				Size = UDim2.new(1, 12, 1, 12),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				Active = true,
				ZIndex = 999,
				Parent = ak,
			})

			local am = false
			local an = 0

			local function updateSliderSize()
				local ao = af
				local ap = ao.AbsoluteCanvasSize.Y
				local aq = ao.AbsoluteWindowSize.Y

				if ap <= aq then
					ak.Visible = false
					return
				end

				local ar = math.clamp(aq / ap, 0.1, 1)
				ak.Size = UDim2.new(1, 0, ar, 0)
				ak.Visible = true
			end

			local function updateScrollingFramePosition()
				local ao = ak.Position.Y.Scale
				local ap = af.AbsoluteCanvasSize.Y
				local aq = af.AbsoluteWindowSize.Y
				local ar = math.max(ap - aq, 0)

				if ar <= 0 then
					return
				end

				local as = math.max(1 - ak.Size.Y.Scale, 0)
				if as <= 0 then
					return
				end

				local at = ao / as

				af.CanvasPosition = Vector2.new(af.CanvasPosition.X, at * ar)
			end

			local function updateThumbPosition()
				if am then
					return
				end

				local ao = af.CanvasPosition.Y
				local ap = af.AbsoluteCanvasSize.Y
				local aq = af.AbsoluteWindowSize.Y
				local ar = math.max(ap - aq, 0)

				if ar <= 0 then
					ak.Position = UDim2.new(0, 0, 0, 0)
					return
				end

				local as = ao / ar
				local at = math.max(1 - ak.Size.Y.Scale, 0)
				local au = math.clamp(as * at, 0, at)

				ak.Position = UDim2.new(0, 0, au, 0)
			end

			ac.AddSignal(aj.InputBegan, function(ao)
				if
					ao.UserInputType == Enum.UserInputType.MouseButton1
					or ao.UserInputType == Enum.UserInputType.Touch
				then
					local ap = ak.AbsolutePosition.Y
					local aq = ap + ak.AbsoluteSize.Y

					if not (ao.Position.Y >= ap and ao.Position.Y <= aq) then
						local ar = aj.AbsolutePosition.Y
						local as = aj.AbsoluteSize.Y
						local at = ak.AbsoluteSize.Y

						local au = ao.Position.Y - ar - at / 2
						local av = as - at

						local aw = math.clamp(au / av, 0, 1 - ak.Size.Y.Scale)

						ak.Position = UDim2.new(0, 0, aw, 0)
						updateScrollingFramePosition()
					end
				end
			end)

			ac.AddSignal(al.InputBegan, function(ao)
				if
					ao.UserInputType == Enum.UserInputType.MouseButton1
					or ao.UserInputType == Enum.UserInputType.Touch
				then
					am = true
					an = ao.Position.Y - ak.AbsolutePosition.Y

					local ap
					local aq

					ap = ab.InputChanged:Connect(function(ar)
						if
							ar.UserInputType == Enum.UserInputType.MouseMovement
							or ar.UserInputType == Enum.UserInputType.Touch
						then
							local as = aj.AbsolutePosition.Y
							local at = aj.AbsoluteSize.Y
							local au = ak.AbsoluteSize.Y

							local av = ar.Position.Y - as - an
							local aw = at - au

							local ax = math.clamp(av / aw, 0, 1 - ak.Size.Y.Scale)

							ak.Position = UDim2.new(0, 0, ax, 0)
							updateScrollingFramePosition()
						end
					end)

					aq = ab.InputEnded:Connect(function(ar)
						if
							ar.UserInputType == Enum.UserInputType.MouseButton1
							or ar.UserInputType == Enum.UserInputType.Touch
						then
							am = false
							if ap then
								ap:Disconnect()
							end
							if aq then
								aq:Disconnect()
							end
						end
					end)
				end
			end)

			ac.AddSignal(af:GetPropertyChangedSignal("AbsoluteWindowSize"), function()
				updateSliderSize()
				updateThumbPosition()
			end)

			ac.AddSignal(af:GetPropertyChangedSignal("AbsoluteCanvasSize"), function()
				updateSliderSize()
				updateThumbPosition()
			end)

			ac.AddSignal(af:GetPropertyChangedSignal("CanvasPosition"), function()
				if not am then
					updateThumbPosition()
				end
			end)

			updateSliderSize()
			updateThumbPosition()

			return aj
		end

		return aa
	end
	function z.u()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		local function Color3ToHSB(ae)
			local af, ag, ah = ae.R, ae.G, ae.B
			local ai = math.max(af, ag, ah)
			local aj = math.min(af, ag, ah)
			local ak = ai - aj

			local al = 0
			if ak ~= 0 then
				if ai == af then
					al = (ag - ah) / ak % 6
				elseif ai == ag then
					al = (ah - af) / ak + 2
				else
					al = (af - ag) / ak + 4
				end
				al = al * 60
			else
				al = 0
			end

			local am = (ai == 0) and 0 or (ak / ai)
			local an = ai

			return {
				h = math.floor(al + 0.5),
				s = am,
				b = an,
			}
		end

		local function GetPerceivedBrightness(ae)
			local af = ae.R
			local ag = ae.G
			local ah = ae.B
			return 0.299 * af + 0.587 * ag + 0.114 * ah
		end

		local function GetTextColorForHSB(ae)
			local af = Color3ToHSB(ae)
			local ag, ah, ai = af.h, af.s, af.b
			if GetPerceivedBrightness(ae) > 0.5 then
				return Color3.fromHSV(ag / 360, 0, 0.05)
			else
				return Color3.fromHSV(ag / 360, 0, 0.98)
			end
		end

		local function GetAverageColor(ae)
			local af, ag, ah = 0, 0, 0
			local ai = ae.Color.Keypoints
			for aj, ak in ipairs(ai) do
				af = af + ak.Value.R
				ag = ag + ak.Value.G
				ah = ah + ak.Value.B
			end
			local aj = #ai
			return Color3.new(af / aj, ag / aj, ah / aj)
		end

		function aa.New(ae, af, ag)
			local ah = {
				Title = af.Title or "Tag",
				Color = af.Color or Color3.fromHex("#315dff"),
				Radius = af.Radius or 999,

				TagFrame = nil,
				Height = 26,
				Padding = 10,
				TextSize = 14,
			}

			local ai = ac("TextLabel", {
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
				TextSize = ah.TextSize,
				FontFace = Font.new(ab.Font, Enum.FontWeight.SemiBold),
				Text = ah.Title,
				TextColor3 = typeof(ah.Color) == "Color3" and GetTextColorForHSB(ah.Color) or nil,
			})

			local aj

			if typeof(ah.Color) == "table" then
				aj = ac("UIGradient")
				for ak, al in next, ah.Color do
					aj[ak] = al
				end

				ai.TextColor3 = GetTextColorForHSB(GetAverageColor(aj))
			end

			local ak = ab.NewRoundFrame(ah.Radius, "Squircle", {
				AutomaticSize = "X",
				Size = UDim2.new(0, 0, 0, ah.Height),
				Parent = ag,
				ImageColor3 = typeof(ah.Color) == "Color3" and ah.Color or Color3.new(1, 1, 1),
			}, {
				aj,
				ac("UIPadding", {
					PaddingLeft = UDim.new(0, ah.Padding),
					PaddingRight = UDim.new(0, ah.Padding),
				}),
				ai,
				ac("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),
			})

			function ah.SetTitle(al, am)
				ah.Title = am
				ai.Text = am
			end

			function ah.SetColor(al, am)
				ah.Color = am
				if typeof(am) == "table" then
					local an = GetAverageColor(am)
					ad(ai, 0.06, { TextColor3 = GetTextColorForHSB(an) }):Play()
					local ao = ak:FindFirstChildOfClass("UIGradient") or ac("UIGradient", { Parent = ak })
					for ap, aq in next, am do
						ao[ap] = aq
					end
					ad(ak, 0.06, { ImageColor3 = Color3.new(1, 1, 1) }):Play()
				else
					if aj then
						aj:Destroy()
					end
					ad(ai, 0.06, { TextColor3 = GetTextColorForHSB(am) }):Play()
					ad(ak, 0.06, { ImageColor3 = am }):Play()
				end
			end

			return ah
		end

		return aa
	end
	function z.v()
		local aa = game:GetService("HttpService")

		local ab

		local ac
		ac = {

			Folder = nil,
			Path = nil,
			Configs = {},
			Parser = {
				Colorpicker = {
					Save = function(ad)
						return {
							__type = ad.__type,
							value = ad.Default:ToHex(),
							transparency = ad.Transparency or nil,
						}
					end,
					Load = function(ad, ae)
						if ad then
							ad:Update(Color3.fromHex(ae.value), ae.transparency or nil)
						end
					end,
				},
				Dropdown = {
					Save = function(ad)
						return {
							__type = ad.__type,
							value = ad.Value,
						}
					end,
					Load = function(ad, ae)
						if ad then
							ad:Select(ae.value)
						end
					end,
				},
				Input = {
					Save = function(ad)
						return {
							__type = ad.__type,
							value = ad.Value,
						}
					end,
					Load = function(ad, ae)
						if ad then
							ad:Set(ae.value)
						end
					end,
				},
				Keybind = {
					Save = function(ad)
						return {
							__type = ad.__type,
							value = ad.Value,
						}
					end,
					Load = function(ad, ae)
						if ad then
							ad:Set(ae.value)
						end
					end,
				},
				Slider = {
					Save = function(ad)
						return {
							__type = ad.__type,
							value = ad.Value.Default,
						}
					end,
					Load = function(ad, ae)
						if ad then
							ad:Set(ae.value)
						end
					end,
				},
				Toggle = {
					Save = function(ad)
						return {
							__type = ad.__type,
							value = ad.Value,
						}
					end,
					Load = function(ad, ae)
						if ad then
							ad:Set(ae.value)
						end
					end,
				},
			},
		}

		function ac.Init(ad, ae)
			if not ae.Folder then
				warn("[ WindUI.ConfigManager ] Window.Folder is not specified.")
				return false
			end

			ab = ae
			ac.Folder = ab.Folder
			ac.Path = "WindUI/" .. tostring(ac.Folder) .. "/config/"

			if not isfolder("WindUI/" .. ac.Folder) then
				makefolder("WindUI/" .. ac.Folder)
				if not isfolder("WindUI/" .. ac.Folder .. "/config/") then
					makefolder("WindUI/" .. ac.Folder .. "/config/")
				end
			end

			local af = ac:AllConfigs()

			for ag, ah in next, af do
				if isfile and readfile and isfile(ah .. ".json") then
					ac.Configs[ah] = readfile(ah .. ".json")
				end
			end

			return ac
		end

		function ac.CreateConfig(ad, ae)
			local af = {
				Path = ac.Path .. ae .. ".json",
				Elements = {},
				CustomData = {},
				Version = 1.1,
			}

			if not ae then
				return false, "No config file is selected"
			end

			function af.Register(ag, ah, ai)
				af.Elements[ah] = ai
			end

			function af.Set(ag, ah, ai)
				af.CustomData[ah] = ai
			end

			function af.Get(ag, ah)
				return af.CustomData[ah]
			end

			function af.Save(ag)
				local ah = {
					__version = af.Version,
					__elements = {},
					__custom = af.CustomData,
				}

				for ai, aj in next, af.Elements do
					if ac.Parser[aj.__type] then
						ah.__elements[tostring(ai)] = ac.Parser[aj.__type].Save(aj)
					end
				end

				local ai = aa:JSONEncode(ah)
				if writefile then
					writefile(af.Path, ai)
				end

				return ah
			end

			function af.Load(ag)
				if isfile and not isfile(af.Path) then
					return false, "Config file does not exist"
				end

				local ah, ai = pcall(function()
					local ah = readfile
						or function()
							warn("[ WindUI.ConfigManager ] The config system doesn't work in the studio.")
							return nil
						end
					return aa:JSONDecode(ah(af.Path))
				end)

				if not ah then
					return false, "Failed to parse config file"
				end

				if not ai.__version then
					local aj = {
						__version = af.Version,
						__elements = ai,
						__custom = {},
					}
					ai = aj
				end

				for aj, ak in next, (ai.__elements or {}) do
					if af.Elements[aj] and ac.Parser[ak.__type] then
						task.spawn(function()
							ac.Parser[ak.__type].Load(af.Elements[aj], ak)
						end)
					end
				end

				af.CustomData = ai.__custom or {}

				return af.CustomData
			end

			function af.GetData(ag)
				return {
					elements = af.Elements,
					custom = af.CustomData,
				}
			end

			ac.Configs[ae] = af
			return af
		end

		function ac.AllConfigs(ad)
			if not listfiles then
				return {}
			end

			local ae = {}
			if not isfolder(ac.Path) then
				makefolder(ac.Path)
				return ae
			end

			for af, ag in next, listfiles(ac.Path) do
				local ah = ag:match("([^\\/]+)%.json$")
				if ah then
					table.insert(ae, ah)
				end
			end

			return ae
		end

		function ac.GetConfig(ad, ae)
			return ac.Configs[ae]
		end

		return ac
	end
	function z.w()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		function aa.New(ae)
			local af = {
				Button = nil,
			}

			local ag

			local ah = ac("TextLabel", {
				Text = ae.Title,
				TextSize = 17,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			})

			local ai = ac("Frame", {
				Size = UDim2.new(0, 36, 0, 36),
				BackgroundTransparency = 1,
				Name = "Drag",
			}, {
				ac("ImageLabel", {
					Image = ab.Icon("move")[1],
					ImageRectOffset = ab.Icon("move")[2].ImageRectPosition,
					ImageRectSize = ab.Icon("move")[2].ImageRectSize,
					Size = UDim2.new(0, 18, 0, 18),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = 0.3,
				}),
			})
			local aj = ac("Frame", {
				Size = UDim2.new(0, 1, 1, 0),
				Position = UDim2.new(0, 36, 0.5, 0),
				AnchorPoint = Vector2.new(0, 0.5),
				BackgroundColor3 = Color3.new(1, 1, 1),
				BackgroundTransparency = 0.9,
			})

			local ak = ac("Frame", {
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.new(0.5, 0, 0, 28),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Parent = ae.Parent,
				BackgroundTransparency = 1,
				Active = true,
				Visible = false,
			})
			local al = ac("TextButton", {
				Size = UDim2.new(0, 0, 0, 44),
				AutomaticSize = "X",
				Parent = ak,
				Active = false,
				BackgroundTransparency = 0.25,
				ZIndex = 99,
				BackgroundColor3 = Color3.new(0, 0, 0),
			}, {

				ac("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
				ac("UIStroke", {
					Thickness = 1,
					ApplyStrokeMode = "Border",
					Color = Color3.new(1, 1, 1),
					Transparency = 0,
				}, {
					ac("UIGradient", {
						Color = ColorSequence.new(Color3.fromHex("40c9ff"), Color3.fromHex("e81cff")),
					}),
				}),
				ai,
				aj,

				ac("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),

				ac("TextButton", {
					AutomaticSize = "XY",
					Active = true,
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 0, 0, 36),

					BackgroundColor3 = Color3.new(1, 1, 1),
				}, {
					ac("UICorner", {
						CornerRadius = UDim.new(1, -4),
					}),
					ag,
					ac("UIListLayout", {
						Padding = UDim.new(0, ae.UIPadding),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					}),
					ah,
					ac("UIPadding", {
						PaddingLeft = UDim.new(0, 11),
						PaddingRight = UDim.new(0, 11),
					}),
				}),
				ac("UIPadding", {
					PaddingLeft = UDim.new(0, 4),
					PaddingRight = UDim.new(0, 4),
				}),
			})

			af.Button = al

			function af.SetIcon(am, an)
				if ag then
					ag:Destroy()
				end
				if an then
					ag = ab.Image(an, ae.Title, 0, ae.Folder, "OpenButton", true, ae.IconThemed)
					ag.Size = UDim2.new(0, 22, 0, 22)
					ag.LayoutOrder = -1
					ag.Parent = af.Button.TextButton
				end
			end

			if ae.Icon then
				af:SetIcon(ae.Icon)
			end

			ab.AddSignal(al:GetPropertyChangedSignal("AbsoluteSize"), function()
				ak.Size = UDim2.new(0, al.AbsoluteSize.X, 0, al.AbsoluteSize.Y)
			end)

			ab.AddSignal(al.TextButton.MouseEnter, function()
				ad(al.TextButton, 0.1, { BackgroundTransparency = 0.93 }):Play()
			end)
			ab.AddSignal(al.TextButton.MouseLeave, function()
				ad(al.TextButton, 0.1, { BackgroundTransparency = 1 }):Play()
			end)

			local am = ab.Drag(ak)

			function af.Visible(an, ao)
				ak.Visible = ao
			end

			function af.Edit(an, ao)
				local ap = {
					Title = ao.Title,
					Icon = ao.Icon,
					Enabled = ao.Enabled,
					Position = ao.Position,
					OnlyIcon = ao.OnlyIcon or false,
					Draggable = ao.Draggable,
					OnlyMobile = ao.OnlyMobile,
					CornerRadius = ao.CornerRadius or UDim.new(1, 0),
					StrokeThickness = ao.StrokeThickness or 2,
					Color = ao.Color or ColorSequence.new(Color3.fromHex("40c9ff"), Color3.fromHex("e81cff")),
				}

				if ap.Enabled == false then
					ae.IsOpenButtonEnabled = false
				end

				if ap.OnlyMobile ~= false then
					ap.OnlyMobile = true
				else
					ae.IsPC = false
				end

				if ap.Draggable == false and ai and aj then
					ai.Visible = ap.Draggable
					aj.Visible = ap.Draggable

					if am then
						am:Set(ap.Draggable)
					end
				end

				if ap.Position and ak then
					ak.Position = ap.Position
				end

				if ap.OnlyIcon and ah then
					ah.Visible = false
					al.TextButton.UIPadding.PaddingLeft = UDim.new(0, 7)
					al.TextButton.UIPadding.PaddingRight = UDim.new(0, 7)
				end

				if ah then
					if ap.Title then
						ah.Text = ap.Title
						ab:ChangeTranslationKey(ah, ap.Title)
					elseif ap.Title == nil then
					end
				end

				if ap.Icon then
					af:SetIcon(ap.Icon)
				end

				al.UIStroke.UIGradient.Color = ap.Color
				if Glow then
					Glow.UIGradient.Color = ap.Color
				end

				al.UICorner.CornerRadius = ap.CornerRadius
				al.TextButton.UICorner.CornerRadius = UDim.new(ap.CornerRadius.Scale, ap.CornerRadius.Offset - 4)
				al.UIStroke.Thickness = ap.StrokeThickness
			end

			return af
		end

		return aa
	end
	function z.x()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		function aa.New(ae, af)
			local ag = {
				Container = nil,
				ToolTipSize = 16,
			}

			local ah = ac("TextLabel", {
				AutomaticSize = "XY",
				TextWrapped = true,
				BackgroundTransparency = 1,
				FontFace = Font.new(ab.Font, Enum.FontWeight.Medium),
				Text = ae,
				TextSize = 17,
				TextTransparency = 1,
				ThemeTag = {
					TextColor3 = "Text",
				},
			})

			local ai = ac("UIScale", {
				Scale = 0.9,
			})

			local aj = ac("Frame", {
				AnchorPoint = Vector2.new(0.5, 0),
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				Parent = af,

				Visible = false,
			}, {
				ac("UISizeConstraint", {
					MaxSize = Vector2.new(400, math.huge),
				}),
				ac("Frame", {
					AutomaticSize = "XY",
					BackgroundTransparency = 1,
					LayoutOrder = 99,
					Visible = false,
				}, {
					ac("ImageLabel", {
						Size = UDim2.new(0, ag.ToolTipSize, 0, ag.ToolTipSize / 2),
						BackgroundTransparency = 1,
						Rotation = 180,
						Image = "rbxassetid://89524607682719",
						ThemeTag = {
							ImageColor3 = "Accent",
						},
					}, {
						ac("ImageLabel", {
							Size = UDim2.new(0, ag.ToolTipSize, 0, ag.ToolTipSize / 2),
							BackgroundTransparency = 1,
							LayoutOrder = 99,
							ImageTransparency = 0.9,
							Image = "rbxassetid://89524607682719",
							ThemeTag = {
								ImageColor3 = "Text",
							},
						}),
					}),
				}),
				ab.NewRoundFrame(14, "Squircle", {
					AutomaticSize = "XY",
					ThemeTag = {
						ImageColor3 = "Accent",
					},
					ImageTransparency = 1,
					Name = "Background",
				}, {

					ac("Frame", {
						ThemeTag = {
							BackgroundColor3 = "Text",
						},
						AutomaticSize = "XY",
						BackgroundTransparency = 1,
					}, {
						ac("UICorner", {
							CornerRadius = UDim.new(0, 16),
						}),
						ac("UIListLayout", {
							Padding = UDim.new(0, 12),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center",
						}),

						ah,
						ac("UIPadding", {
							PaddingTop = UDim.new(0, 12),
							PaddingLeft = UDim.new(0, 12),
							PaddingRight = UDim.new(0, 12),
							PaddingBottom = UDim.new(0, 12),
						}),
					}),
				}),
				ai,
				ac("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = "Vertical",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
				}),
			})
			ag.Container = aj

			function ag.Open(ak)
				aj.Visible = true

				ad(aj.Background, 0.2, { ImageTransparency = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(ah, 0.2, { TextTransparency = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(ai, 0.18, { Scale = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
			end

			function ag.Close(ak)
				ad(aj.Background, 0.3, { ImageTransparency = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(ah, 0.3, { TextTransparency = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				ad(ai, 0.35, { Scale = 0.9 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

				task.wait(0.35)

				aj.Visible = false
				aj:Destroy()
			end

			return ag
		end

		return aa
	end
	function z.y()
		local aa = z.load("a")
		local ab = aa.New
		local ac = aa.NewRoundFrame
		local ad = aa.Tween

		local function Color3ToHSB(ae)
			local af, ag, ah = ae.R, ae.G, ae.B
			local ai = math.max(af, ag, ah)
			local aj = math.min(af, ag, ah)
			local ak = ai - aj

			local al = 0
			if ak ~= 0 then
				if ai == af then
					al = (ag - ah) / ak % 6
				elseif ai == ag then
					al = (ah - af) / ak + 2
				else
					al = (af - ag) / ak + 4
				end
				al = al * 60
			else
				al = 0
			end

			local am = (ai == 0) and 0 or (ak / ai)
			local an = ai

			return {
				h = math.floor(al + 0.5),
				s = am,
				b = an,
			}
		end

		local function GetPerceivedBrightness(ae)
			local af = ae.R
			local ag = ae.G
			local ah = ae.B
			return 0.299 * af + 0.587 * ag + 0.114 * ah
		end

		local function GetTextColorForHSB(ae)
			local af = Color3ToHSB(ae)
			local ag, ah, ai = af.h, af.s, af.b
			if GetPerceivedBrightness(ae) > 0.5 then
				return Color3.fromHSV(ag / 360, 0, 0.05)
			else
				return Color3.fromHSV(ag / 360, 0, 0.98)
			end
		end

		local function getElementPosition(ae, af)
			if type(af) ~= "number" or af ~= math.floor(af) then
				return nil, 1
			end

			local ag = #ae

			if ag == 0 or af < 1 or af > ag then
				return nil, 2
			end

			local function isDelimiter(ah)
				if ah == nil then
					return true
				end
				local ai = ah.__type
				return ai == "Divider" or ai == "Space" or ai == "Section" or ai == "Code"
			end

			if isDelimiter(ae[af]) then
				return nil, 3
			end

			local function calculate(ah, ai)
				if ai == 1 then
					return "Squircle"
				end
				if ah == 1 then
					return "Squircle-TL-TR"
				end
				if ah == ai then
					return "Squircle-BL-BR"
				end
				return "Square"
			end

			local ah = 1
			local ai = 0

			for aj = 1, ag do
				local ak = ae[aj]
				if isDelimiter(ak) then
					if af >= ah and af <= aj - 1 then
						local al = af - ah + 1
						return calculate(al, ai)
					end
					ah = aj + 1
					ai = 0
				else
					ai = ai + 1
				end
			end

			if af >= ah and af <= ag then
				local aj = af - ah + 1
				return calculate(aj, ai)
			end

			return nil, 4
		end

		return function(ae)
			local af = {
				Title = ae.Title,
				Desc = ae.Desc or nil,
				Hover = ae.Hover,
				Thumbnail = ae.Thumbnail,
				ThumbnailSize = ae.ThumbnailSize or 80,
				Image = ae.Image,
				IconThemed = ae.IconThemed or false,
				ImageSize = ae.ImageSize or 30,
				Color = ae.Color,
				Scalable = ae.Scalable,
				Parent = ae.Parent,
				Justify = ae.Justify or "Between",
				UIPadding = ae.Window.ElementConfig.UIPadding,
				UICorner = ae.Window.ElementConfig.UICorner,
				UIElements = {},
				LockText = ae.LockText or "Locked",

				Index = ae.Index,
			}

			local ag = af.ImageSize
			local ah = af.ThumbnailSize
			local ai = true

			local aj = 0

			local ak
			local al
			if af.Thumbnail then
				ak = aa.Image(
					af.Thumbnail,
					af.Title,
					af.UICorner - 3,
					ae.Window.Folder,
					"Thumbnail",
					false,
					af.IconThemed
				)
				ak.Size = UDim2.new(1, 0, 0, ah)
			end
			if af.Image then
				al = aa.Image(
					af.Image,
					af.Title,
					af.UICorner - 3,
					ae.Window.Folder,
					"Image",
					not af.Color and true or false
				)
				if typeof(af.Color) == "string" then
					al.ImageLabel.ImageColor3 = GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
				elseif typeof(af.Color) == "Color3" then
					al.ImageLabel.ImageColor3 = GetTextColorForHSB(af.Color)
				end

				al.Size = UDim2.new(0, ag, 0, ag)

				aj = ag
			end

			local function CreateText(am, an)
				local ao = typeof(af.Color) == "string" and GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
					or typeof(af.Color) == "Color3" and GetTextColorForHSB(af.Color)

				return ab("TextLabel", {
					BackgroundTransparency = 1,
					Text = am or "",
					TextSize = an == "Desc" and 15 or 17,
					TextXAlignment = "Left",
					ThemeTag = {
						TextColor3 = not af.Color and "Text" or nil,
					},
					TextColor3 = af.Color and ao or nil,
					TextTransparency = an == "Desc" and 0.3 or 0,
					TextWrapped = true,
					Size = UDim2.new(af.Justify == "Between" and 1 or 0, 0, 0, 0),
					AutomaticSize = af.Justify == "Between" and "Y" or "XY",
					FontFace = Font.new(aa.Font, an == "Desc" and Enum.FontWeight.Medium or Enum.FontWeight.SemiBold),
				})
			end

			local am = CreateText(af.Title, "Title")
			local an = CreateText(af.Desc, "Desc")
			if not af.Desc or af.Desc == "" then
				an.Visible = false
			end

			af.UIElements.Container = ab("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				AutomaticSize = "Y",
				BackgroundTransparency = 1,
			}, {
				ab("UIListLayout", {
					Padding = UDim.new(0, af.UIPadding),
					FillDirection = "Vertical",
					VerticalAlignment = ae.Window.NewElements and "Top" or "Center",
					HorizontalAlignment = af.Justify == "Between" and "Left" or "Center",
				}),
				ak,
				ab("Frame", {
					Size = UDim2.new(
						af.Justify == "Between" and 1 or 0,
						af.Justify == "Between" and -ae.TextOffset or 0,
						0,
						0
					),
					AutomaticSize = af.Justify == "Between" and "Y" or "XY",
					BackgroundTransparency = 1,
					Name = "TitleFrame",
				}, {
					ab("UIListLayout", {
						Padding = UDim.new(0, af.UIPadding),
						FillDirection = "Horizontal",
						VerticalAlignment = ae.Window.NewElements and (af.Justify == "Between" and "Top" or "Center")
							or "Center",
						HorizontalAlignment = af.Justify ~= "Between" and af.Justify or "Center",
					}),
					al,
					ab("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = af.Justify == "Between" and "Y" or "XY",
						Size = UDim2.new(
							af.Justify == "Between" and 1 or 0,
							af.Justify == "Between" and (al and -aj - af.UIPadding or -aj) or 0,
							1,
							0
						),
						Name = "TitleFrame",
					}, {
						ab("UIPadding", {
							PaddingTop = UDim.new(0, ae.Window.NewElements and af.UIPadding / 2 or 0),
							PaddingLeft = UDim.new(0, ae.Window.NewElements and af.UIPadding / 2 or 0),
							PaddingRight = UDim.new(0, ae.Window.NewElements and af.UIPadding / 2 or 0),
							PaddingBottom = UDim.new(0, ae.Window.NewElements and af.UIPadding / 2 or 0),
						}),
						ab("UIListLayout", {
							Padding = UDim.new(0, 6),
							FillDirection = "Vertical",
							VerticalAlignment = "Center",
							HorizontalAlignment = "Left",
						}),
						am,
						an,
					}),
				}),
			})

			local ao = aa.Image("lock", "lock", 0, ae.Window.Folder, "Lock", false)
			ao.Size = UDim2.new(0, 20, 0, 20)
			ao.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
			ao.ImageLabel.ImageTransparency = 0.4

			local ap = ab("TextLabel", {
				Text = af.LockText,
				TextSize = 18,
				FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
				AutomaticSize = "XY",
				BackgroundTransparency = 1,
				TextColor3 = Color3.new(1, 1, 1),
				TextTransparency = 0.05,
			})

			local aq = ab("Frame", {
				Size = UDim2.new(1, af.UIPadding * 2, 1, af.UIPadding * 2),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				ZIndex = 9999999,
			})

			local ar, as = ac(af.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 0.25,
				ImageColor3 = Color3.new(0, 0, 0),
				Visible = false,
				Active = false,
				Parent = aq,
			}, {
				ab("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8),
				}),
				ao,
				ap,
			}, nil, true)

			local at, au = ac(af.UICorner, "Squircle-Outline", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				Parent = aq,
			}, {
				ab("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8),
				}),
			}, nil, true)

			local av, aw = ac(af.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				Active = false,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				Parent = aq,
			}, {
				ab("UIListLayout", {
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
					HorizontalAlignment = "Center",
					Padding = UDim.new(0, 8),
				}),
			}, nil, true)

			local ax, ay = ac(af.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = "Y",
				ImageTransparency = af.Color and 0.05 or 0.93,

				Parent = ae.Parent,
				ThemeTag = {
					ImageColor3 = not af.Color and "Text" or nil,
				},
				ImageColor3 = af.Color
						and (typeof(af.Color) == "string" and Color3.fromHex(aa.Colors[af.Color]) or typeof(af.Color) == "Color3" and af.Color)
					or nil,
			}, {
				af.UIElements.Container,
				aq,
				ab("UIPadding", {
					PaddingTop = UDim.new(0, af.UIPadding),
					PaddingLeft = UDim.new(0, af.UIPadding),
					PaddingRight = UDim.new(0, af.UIPadding),
					PaddingBottom = UDim.new(0, af.UIPadding),
				}),
			}, true, true)

			af.UIElements.Main = ax
			af.UIElements.Locked = ar

			if af.Hover then
				aa.AddSignal(ax.MouseEnter, function()
					if ai then
						ad(ax, 0.05, { ImageTransparency = af.Color and 0.15 or 0.9 }):Play()
					end
				end)
				aa.AddSignal(ax.InputEnded, function()
					if ai then
						ad(ax, 0.05, { ImageTransparency = af.Color and 0.05 or 0.93 }):Play()
					end
				end)
			end

			function af.SetTitle(az, aA)
				af.Title = aA
				am.Text = aA
			end

			function af.SetDesc(az, aA)
				af.Desc = aA
				an.Text = aA or ""
				if not aA then
					an.Visible = false
				elseif not an.Visible then
					an.Visible = true
				end
			end

			function af.Colorize(az, aA, aB)
				if af.Color then
					aA[aB] = typeof(af.Color) == "string" and GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
						or typeof(af.Color) == "Color3" and GetTextColorForHSB(af.Color)
						or nil
				end
			end

			if ae.ElementTable then
				aa.AddSignal(am:GetPropertyChangedSignal("Text"), function()
					if af.Title ~= am.Text then
						af:SetTitle(am.Text)
						ae.ElementTable.Title = am.Text
					end
				end)
				aa.AddSignal(an:GetPropertyChangedSignal("Text"), function()
					if af.Desc ~= an.Text then
						af:SetDesc(an.Text)
						ae.ElementTable.Desc = an.Text
					end
				end)
			end

			function af.SetThumbnail(az, aA, aB)
				af.Thumbnail = aA
				if aB then
					af.ThumbnailSize = aB
					ah = aB
				end

				if ak then
					if aA then
						ak:Destroy()
						ak =
							aa.Image(aA, af.Title, af.UICorner - 3, ae.Window.Folder, "Thumbnail", false, af.IconThemed)
						ak.Size = UDim2.new(1, 0, 0, ah)
						ak.Parent = af.UIElements.Container
						local aC = af.UIElements.Container:FindFirstChild("UIListLayout")
						if aC then
							ak.LayoutOrder = -1
						end
					else
						ak.Visible = false
					end
				else
					if aA then
						ak =
							aa.Image(aA, af.Title, af.UICorner - 3, ae.Window.Folder, "Thumbnail", false, af.IconThemed)
						ak.Size = UDim2.new(1, 0, 0, ah)
						ak.Parent = af.UIElements.Container
						local aC = af.UIElements.Container:FindFirstChild("UIListLayout")
						if aC then
							ak.LayoutOrder = -1
						end
					end
				end
			end

			function af.SetImage(az, aA, aB, aC, aD)
				af.Image = aA
				if aB then
					af.ImageSize = aB
					ag = aB
				end
				if aC ~= nil then
					af.Color = aC
				end
				if aD ~= nil then
					af.IconThemed = aD
				end

				if al then
					if aA then
						al.Size = UDim2.new(0, ag, 0, ag)
						aa.UpdateImage(al, aA, af.Title)

						if typeof(af.Color) == "string" then
							al.ImageLabel.ImageColor3 = GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
						elseif typeof(af.Color) == "Color3" then
							al.ImageLabel.ImageColor3 = GetTextColorForHSB(af.Color)
						elseif not af.Color then
							al.ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
						end

						al.Visible = true
						aj = ag
					else
						al.Visible = false
						aj = 0
					end
				else
					if aA then
						al = aa.Image(
							aA,
							af.Title,
							af.UICorner - 3,
							ae.Window.Folder,
							"Image",
							not af.Color and true or false
						)

						if typeof(af.Color) == "string" then
							al.ImageLabel.ImageColor3 = GetTextColorForHSB(Color3.fromHex(aa.Colors[af.Color]))
						elseif typeof(af.Color) == "Color3" then
							al.ImageLabel.ImageColor3 = GetTextColorForHSB(af.Color)
						end

						al.Size = UDim2.new(0, ag, 0, ag)
						aj = ag

						local aE = af.UIElements.Container:FindFirstChild("Frame")
						if aE then
							al.Parent = aE
							local aF = aE:FindFirstChild("UIListLayout")
							if aF then
								al.LayoutOrder = 0
							end
						end
					end
				end
			end

			function af.Destroy(az)
				ax:Destroy()
			end

			function af.Lock(az)
				ai = false
				ar.Active = true
				ar.Visible = true
			end

			function af.Unlock(az)
				ai = true
				ar.Active = false
				ar.Visible = false
			end

			function af.Highlight(az)
				local aA = ab("UIGradient", {
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.1, 0.9),
						NumberSequenceKeypoint.new(0.5, 0.3),
						NumberSequenceKeypoint.new(0.9, 0.9),
						NumberSequenceKeypoint.new(1, 1),
					}),
					Rotation = 0,
					Offset = Vector2.new(-1, 0),
					Parent = at,
				})

				local aB = ab("UIGradient", {
					Color = ColorSequence.new({
						ColorSequenceKeypoint.new(0, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(0.5, Color3.new(1, 1, 1)),
						ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)),
					}),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.15, 0.8),
						NumberSequenceKeypoint.new(0.5, 0.1),
						NumberSequenceKeypoint.new(0.85, 0.8),
						NumberSequenceKeypoint.new(1, 1),
					}),
					Rotation = 0,
					Offset = Vector2.new(-1, 0),
					Parent = av,
				})

				at.ImageTransparency = 0.25
				av.ImageTransparency = 0.88

				ad(aA, 0.75, {
					Offset = Vector2.new(1, 0),
				}):Play()

				ad(aB, 0.75, {
					Offset = Vector2.new(1, 0),
				}):Play()

				task.spawn(function()
					task.wait(0.75)
					at.ImageTransparency = 1
					av.ImageTransparency = 1
					aA:Destroy()
					aB:Destroy()
				end)
			end

			function af.UpdateShape(az)
				if ae.Window.NewElements then
					local aA = getElementPosition(az.Elements, af.Index)
					if aA and ax then
						ay:SetType(aA)
						as:SetType(aA)
						aw:SetType(aA)
						au:SetType(aA .. "-Outline")
					end
				end
			end

			return af
		end
	end
	function z.z()
		local aa = z.load("a")
		local ab = aa.New

		local ac = {}

		local ad = z.load("i").New

		function ac.New(ae, af)
			af.Hover = false
			af.TextOffset = 0
			af.IsButtons = af.Buttons and #af.Buttons > 0 and true or false

			local ag = {
				__type = "Paragraph",
				Title = af.Title or "Paragraph",
				Desc = af.Desc or nil,

				Locked = af.Locked or false,
			}
			local ah = z.load("y")(af)

			ag.ParagraphFrame = ah
			if af.Buttons and #af.Buttons > 0 then
				local ai = ab("Frame", {
					Size = UDim2.new(1, 0, 0, 38),
					BackgroundTransparency = 1,
					AutomaticSize = "Y",
					Parent = ah.UIElements.Container,
				}, {
					ab("UIListLayout", {
						Padding = UDim.new(0, 10),
						FillDirection = "Vertical",
					}),
				})

				for aj, ak in next, af.Buttons do
					local al = ad(ak.Title, ak.Icon, ak.Callback, "White", ai)
					al.Size = UDim2.new(1, 0, 0, 38)
				end
			end

			return ag.__type, ag
		end

		return ac
	end
	function z.A()
		local aa = z.load("a")
		local ab = aa.New

		local ac = {}

		function ac.New(ad, ae)
			local af = {
				__type = "Button",
				Title = ae.Title or "Button",
				Desc = ae.Desc or nil,
				LockText = ae.LockText or nil,
				Icon = ae.Icon or "mouse-pointer-click",
				IconThemed = ae.IconThemed or false,
				Color = ae.Color,
				Justify = ae.Justify or "Between",
				IconAlign = ae.IconAlign or "Right",
				Locked = ae.Locked or false,
				Callback = ae.Callback or function() end,
				UIElements = {},
			}

			local ag = true

			af.ButtonFrame = z.load("y")({
				Title = af.Title,
				Desc = af.Desc,
				LockText = af.LockText,
				Parent = ae.Parent,

				Window = ae.Window,
				Color = af.Color,
				Justify = af.Justify,
				TextOffset = 20,
				Hover = true,
				Scalable = true,
				Tab = ae.Tab,
				Index = ae.Index,
				ElementTable = af,
			})

			af.UIElements.ButtonIcon =
				aa.Image(af.Icon, af.Icon, 0, ae.Window.Folder, "Button", not af.Color and true or nil, af.IconThemed)

			af.UIElements.ButtonIcon.Size = UDim2.new(0, 20, 0, 20)
			af.UIElements.ButtonIcon.Parent = af.Justify == "Between" and af.ButtonFrame.UIElements.Main
				or af.ButtonFrame.UIElements.Container.TitleFrame
			af.UIElements.ButtonIcon.LayoutOrder = af.IconAlign == "Left" and -99999 or 99999
			af.UIElements.ButtonIcon.AnchorPoint = Vector2.new(1, 0.5)
			af.UIElements.ButtonIcon.Position = UDim2.new(1, 0, 0.5, 0)

			af.ButtonFrame:Colorize(af.UIElements.ButtonIcon.ImageLabel, "ImageColor3")

			function af.Lock(ah)
				af.Locked = true
				ag = false
				return af.ButtonFrame:Lock()
			end
			function af.Unlock(ah)
				af.Locked = false
				ag = true
				return af.ButtonFrame:Unlock()
			end

			if af.Locked then
				af:Lock()
			end

			aa.AddSignal(af.ButtonFrame.UIElements.Main.MouseButton1Click, function()
				if ag then
					task.spawn(function()
						aa.SafeCallback(af.Callback)
					end)
				end
			end)
			return af.__type, af
		end

		return ac
	end
	function z.B()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		function aa.New(ae, af, ag, ah)
			local ai = {}

			local aj = 13
			local ak
			if af and af ~= "" then
				ak = ac("ImageLabel", {
					Size = UDim2.new(1, -7, 1, -7),
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = ab.Icon(af)[1],
					ImageRectOffset = ab.Icon(af)[2].ImageRectPosition,
					ImageRectSize = ab.Icon(af)[2].ImageRectSize,
					ImageTransparency = 1,
					ImageColor3 = Color3.new(0, 0, 0),
				})
			end

			local al = ab.NewRoundFrame(aj, "Squircle", {
				ImageTransparency = 0.93,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				Parent = ag,
				Size = UDim2.new(0, 41.6, 0, 26),
			}, {
				ab.NewRoundFrame(aj, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Layer",
					ThemeTag = {
						ImageColor3 = "Button",
					},
					ImageTransparency = 1,
				}),
				ab.NewRoundFrame(aj, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Stroke",
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 1,
				}, {
					ac("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}),
					}),
				}),

				ab.NewRoundFrame(aj, "Squircle", {
					Size = UDim2.new(0, 18, 0, 18),
					Position = UDim2.new(0, 3, 0.5, 0),
					AnchorPoint = Vector2.new(0, 0.5),
					ImageTransparency = 0,
					ImageColor3 = Color3.new(1, 1, 1),

					Name = "Frame",
				}, {
					ak,
				}),
			})

			function ai.Set(am, an, ao)
				if an then
					ad(al.Frame, 0.15, {
						Position = UDim2.new(1, -22, 0.5, 0),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					ad(al.Layer, 0.1, {
						ImageTransparency = 0,
					}):Play()
					ad(al.Stroke, 0.1, {
						ImageTransparency = 0.95,
					}):Play()

					if ak then
						ad(ak, 0.1, {
							ImageTransparency = 0,
						}):Play()
					end
				else
					ad(al.Frame, 0.15, {
						Position = UDim2.new(0, 4, 0.5, 0),
						Size = UDim2.new(0, 18, 0, 18),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					ad(al.Layer, 0.1, {
						ImageTransparency = 1,
					}):Play()
					ad(al.Stroke, 0.1, {
						ImageTransparency = 1,
					}):Play()

					if ak then
						ad(ak, 0.1, {
							ImageTransparency = 1,
						}):Play()
					end
				end

				if ao ~= false then
					ao = true
				end

				task.spawn(function()
					if ah and ao then
						ab.SafeCallback(ah, an)
					end
				end)
			end

			return al, ai
		end

		return aa
	end
	function z.C()
		local aa = {}

		local ab = z.load("a")
		local ac = ab.New
		local ad = ab.Tween

		function aa.New(ae, af, ag, ah)
			local ai = {}

			af = af or "check"

			local aj = 10
			local ak = ac("ImageLabel", {
				Size = UDim2.new(1, -10, 1, -10),
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Image = ab.Icon(af)[1],
				ImageRectOffset = ab.Icon(af)[2].ImageRectPosition,
				ImageRectSize = ab.Icon(af)[2].ImageRectSize,
				ImageTransparency = 1,
				ImageColor3 = Color3.new(1, 1, 1),
			})

			local al = ab.NewRoundFrame(aj, "Squircle", {
				ImageTransparency = 0.95,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				Parent = ag,
				Size = UDim2.new(0, 27, 0, 27),
			}, {
				ab.NewRoundFrame(aj, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Layer",
					ThemeTag = {
						ImageColor3 = "Button",
					},
					ImageTransparency = 1,
				}),
				ab.NewRoundFrame(aj, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					Name = "Stroke",
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 1,
				}, {
					ac("UIGradient", {
						Rotation = 90,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}),
					}),
				}),

				ak,
			})

			function ai.Set(am, an)
				if an then
					ad(al.Layer, 0.06, {
						ImageTransparency = 0,
					}):Play()
					ad(al.Stroke, 0.06, {
						ImageTransparency = 0.95,
					}):Play()
					ad(ak, 0.06, {
						ImageTransparency = 0,
					}):Play()
				else
					ad(al.Layer, 0.05, {
						ImageTransparency = 1,
					}):Play()
					ad(al.Stroke, 0.05, {
						ImageTransparency = 1,
					}):Play()
					ad(ak, 0.06, {
						ImageTransparency = 1,
					}):Play()
				end

				task.spawn(function()
					if ah then
						ab.SafeCallback(ah, an)
					end
				end)
			end

			return al, ai
		end

		return aa
	end
	function z.D()
		local aa = z.load("a")
		local ab = aa.New
		local ac = aa.Tween

		local ad = z.load("B").New
		local ae = z.load("C").New

		local af = {}

		function af.New(ag, ah)
			local ai = {
				__type = "Toggle",
				Title = ah.Title or "Toggle",
				Desc = ah.Desc or nil,
				Locked = ah.Locked or false,
				Value = ah.Value,
				Icon = ah.Icon or nil,
				Type = ah.Type or "Toggle",
				Callback = ah.Callback or function() end,
				UIElements = {},
			}
			ai.ToggleFrame = z.load("y")({
				Title = ai.Title,
				Desc = ai.Desc,

				Window = ah.Window,
				Parent = ah.Parent,
				TextOffset = 44,
				Hover = false,
				Tab = ah.Tab,
				Index = ah.Index,
				ElementTable = ai,
			})

			local aj = true

			if ai.Value == nil then
				ai.Value = false
			end

			function ai.Lock(ak)
				ai.Locked = true
				aj = false
				return ai.ToggleFrame:Lock()
			end
			function ai.Unlock(ak)
				ai.Locked = false
				aj = true
				return ai.ToggleFrame:Unlock()
			end

			if ai.Locked then
				ai:Lock()
			end

			local ak = ai.Value

			local al, am
			if ai.Type == "Toggle" then
				al, am = ad(ak, ai.Icon, ai.ToggleFrame.UIElements.Main, ai.Callback)
			elseif ai.Type == "Checkbox" then
				al, am = ae(ak, ai.Icon, ai.ToggleFrame.UIElements.Main, ai.Callback)
			else
				error("Unknown Toggle Type: " .. tostring(ai.Type))
			end

			al.AnchorPoint = Vector2.new(1, ah.Window.NewElements and 0 or 0.5)
			al.Position = UDim2.new(1, 0, ah.Window.NewElements and 0 or 0.5, 0)

			function ai.Set(an, ao, ap)
				if aj then
					am:Set(ao, ap)
					ak = ao
					ai.Value = ao
				end
			end

			ai:Set(ak, false)

			aa.AddSignal(ai.ToggleFrame.UIElements.Main.MouseButton1Click, function()
				ai:Set(not ak)
			end)

			return ai.__type, ai
		end

		return af
	end
	function z.E()
		local aa = z.load("a")
		local ac = aa.New
		local ad = aa.Tween

		local ae = {}

		local af = false

		function ae.New(ag, ah)
			local ai = {
				__type = "Slider",
				Title = ah.Title or "Slider",
				Desc = ah.Desc or nil,
				Locked = ah.Locked or nil,
				Value = ah.Value or {},
				Step = ah.Step or 1,
				Callback = ah.Callback or function() end,
				UIElements = {},
				IsFocusing = false,

				Width = 130,
				TextBoxWidth = 30,
				ThumbSize = 13,
			}
			local aj
			local ak
			local al
			local am = ai.Value.Default or ai.Value.Min or 0

			local an = am
			local ao = (am - (ai.Value.Min or 0)) / ((ai.Value.Max or 100) - (ai.Value.Min or 0))

			local ap = true
			local aq = ai.Step % 1 ~= 0

			local function FormatValue(ar)
				if aq then
					return string.format("%.2f", ar)
				else
					return tostring(math.floor(ar + 0.5))
				end
			end

			local function CalculateValue(ar)
				if aq then
					return math.floor(ar / ai.Step + 0.5) * ai.Step
				else
					return math.floor(ar / ai.Step + 0.5) * ai.Step
				end
			end

			ai.SliderFrame = z.load("y")({
				Title = ai.Title,
				Desc = ai.Desc,
				Parent = ah.Parent,
				TextOffset = ai.Width,
				Hover = false,
				Tab = ah.Tab,
				Index = ah.Index,
				Window = ah.Window,
				ElementTable = ai,
			})

			ai.UIElements.SliderIcon = aa.NewRoundFrame(99, "Squircle", {
				ImageTransparency = 0.95,
				Size = UDim2.new(1, -ai.TextBoxWidth - 8, 0, 4),
				Name = "Frame",
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}, {
				aa.NewRoundFrame(99, "Squircle", {
					Name = "Frame",
					Size = UDim2.new(ao, 0, 1, 0),
					ImageTransparency = 0.1,
					ThemeTag = {
						ImageColor3 = "Button",
					},
				}, {
					aa.NewRoundFrame(99, "Squircle", {
						Size = UDim2.new(0, ai.ThumbSize, 0, ai.ThumbSize),
						Position = UDim2.new(1, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						Name = "Thumb",
					}),
				}),
			})

			ai.UIElements.SliderContainer = ac("Frame", {
				Size = UDim2.new(0, ai.Width, 0, 0),
				AutomaticSize = "Y",
				Position = UDim2.new(1, 0, 0.5, 0),
				AnchorPoint = Vector2.new(1, 0.5),
				BackgroundTransparency = 1,
				Parent = ai.SliderFrame.UIElements.Main,
			}, {
				ac("UIListLayout", {
					Padding = UDim.new(0, 8),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),
				ai.UIElements.SliderIcon,
				ac("TextBox", {
					Size = UDim2.new(0, ai.TextBoxWidth, 0, 0),
					TextXAlignment = "Left",
					Text = FormatValue(am),
					ThemeTag = {
						TextColor3 = "Text",
					},
					TextTransparency = 0.4,
					AutomaticSize = "Y",
					TextSize = 15,
					FontFace = Font.new(aa.Font, Enum.FontWeight.Medium),
					BackgroundTransparency = 1,
					LayoutOrder = -1,
				}),
			})

			function ai.Lock(ar)
				ai.Locked = true
				ap = false
				return ai.SliderFrame:Lock()
			end
			function ai.Unlock(ar)
				ai.Locked = false
				ap = true
				return ai.SliderFrame:Unlock()
			end

			if ai.Locked then
				ai:Lock()
			end

			local ar = ai.SliderFrame.Parent:IsA("ScrollingFrame") and ai.SliderFrame.Parent
				or ai.SliderFrame.Parent.Parent.Parent

			function ai.Set(as, at, au)
				if ap then
					if
						not ai.IsFocusing
						and not af
						and (
							not au
							or (
								au.UserInputType == Enum.UserInputType.MouseButton1
								or au.UserInputType == Enum.UserInputType.Touch
							)
						)
					then
						at = math.clamp(at, ai.Value.Min or 0, ai.Value.Max or 100)

						local av =
							math.clamp((at - (ai.Value.Min or 0)) / ((ai.Value.Max or 100) - (ai.Value.Min or 0)), 0, 1)
						at = CalculateValue(ai.Value.Min + av * (ai.Value.Max - ai.Value.Min))

						if at ~= an then
							ad(ai.UIElements.SliderIcon.Frame, 0.05, { Size = UDim2.new(av, 0, 1, 0) }):Play()
							ai.UIElements.SliderContainer.TextBox.Text = FormatValue(at)
							ai.Value.Default = FormatValue(at)
							an = at
							aa.SafeCallback(ai.Callback, FormatValue(at))
						end

						if au then
							aj = (au.UserInputType == Enum.UserInputType.Touch)
							ar.ScrollingEnabled = false
							af = true
							ak = e.RenderStepped:Connect(function()
								local aw = aj and au.Position.X or f:GetMouseLocation().X
								local ax = math.clamp(
									(aw - ai.UIElements.SliderIcon.AbsolutePosition.X)
										/ ai.UIElements.SliderIcon.AbsoluteSize.X,
									0,
									1
								)
								at = CalculateValue(ai.Value.Min + ax * (ai.Value.Max - ai.Value.Min))

								if at ~= an then
									ad(ai.UIElements.SliderIcon.Frame, 0.05, { Size = UDim2.new(ax, 0, 1, 0) }):Play()
									ai.UIElements.SliderContainer.TextBox.Text = FormatValue(at)
									ai.Value.Default = FormatValue(at)
									an = at
									aa.SafeCallback(ai.Callback, FormatValue(at))
								end
							end)
							al = f.InputEnded:Connect(function(aw)
								if
									(
										aw.UserInputType == Enum.UserInputType.MouseButton1
										or aw.UserInputType == Enum.UserInputType.Touch
									) and au == aw
								then
									ak:Disconnect()
									al:Disconnect()
									af = false
									ar.ScrollingEnabled = true

									ad(
										ai.UIElements.SliderIcon.Frame.Thumb,
										0.12,
										{ Size = UDim2.new(0, ai.ThumbSize, 0, ai.ThumbSize) },
										Enum.EasingStyle.Quint,
										Enum.EasingDirection.InOut
									):Play()
								end
							end)
						end
					end
				end
			end

			function ai.SetMax(as, at)
				ai.Value.Max = at

				local au = tonumber(ai.Value.Default) or an
				if au > at then
					ai:Set(at)
				else
					local av = math.clamp((au - (ai.Value.Min or 0)) / (at - (ai.Value.Min or 0)), 0, 1)
					ad(ai.UIElements.SliderIcon.Frame, 0.1, { Size = UDim2.new(av, 0, 1, 0) }):Play()
				end
			end

			function ai.SetMin(as, at)
				ai.Value.Min = at

				local au = tonumber(ai.Value.Default) or an
				if au < at then
					ai:Set(at)
				else
					local av = math.clamp((au - at) / ((ai.Value.Max or 100) - at), 0, 1)
					ad(ai.UIElements.SliderIcon.Frame, 0.1, { Size = UDim2.new(av, 0, 1, 0) }):Play()
				end
			end

			aa.AddSignal(ai.UIElements.SliderContainer.TextBox.FocusLost, function(as)
				if as then
					local at = tonumber(ai.UIElements.SliderContainer.TextBox.Text)
					if at then
						ai:Set(at)
					else
						ai.UIElements.SliderContainer.TextBox.Text = FormatValue(an)
					end
				end
			end)

			aa.AddSignal(ai.UIElements.SliderContainer.InputBegan, function(as)
				ai:Set(am, as)

				if
					as.UserInputType == Enum.UserInputType.MouseButton1
					or as.UserInputType == Enum.UserInputType.Touch
				then
					ad(
						ai.UIElements.SliderIcon.Frame.Thumb,
						0.12,
						{ Size = UDim2.new(0, ai.ThumbSize + 8, 0, ai.ThumbSize + 8) },
						Enum.EasingStyle.Quint,
						Enum.EasingDirection.Out
					):Play()
				end
			end)

			return ai.__type, ai
		end

		return ae
	end
	function z.F()
		local aa = f

		local ac = z.load("a")
		local ad = ac.New
		local ae = ac.Tween

		local af = {
			UICorner = 6,
			UIPadding = 8,
		}

		local ag = z.load("s").New

		function af.New(ah, ai)
			local aj = {
				__type = "Keybind",
				Title = ai.Title or "Keybind",
				Desc = ai.Desc or nil,
				Locked = ai.Locked or false,
				Value = ai.Value or "F",
				Callback = ai.Callback or function() end,
				CanChange = ai.CanChange or true,
				Picking = false,
				UIElements = {},
			}
			if shared.KEYBIND_FRAME_WIND_UI_ADD_KEYBIND_FUNCTION then
				pcall(shared.KEYBIND_FRAME_WIND_UI_ADD_KEYBIND_FUNCTION, aj.Title, aj.Value, aj.Callback)
			end

			local ak = true

			aj.KeybindFrame = z.load("y")({
				Title = aj.Title,
				Desc = aj.Desc,
				Parent = ai.Parent,
				TextOffset = 85,
				Hover = aj.CanChange,
				Tab = ai.Tab,
				Index = ai.Index,
				Window = ai.Window,
				ElementTable = aj,
			})

			aj.UIElements.Keybind = ag(aj.Value, nil, aj.KeybindFrame.UIElements.Main)

			aj.UIElements.Keybind.Size =
				UDim2.new(0, 24 + aj.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X, 0, 42)
			aj.UIElements.Keybind.AnchorPoint = Vector2.new(1, 0.5)
			aj.UIElements.Keybind.Position = UDim2.new(1, 0, 0.5, 0)

			ad("UIScale", {
				Parent = aj.UIElements.Keybind,
				Scale = 0.85,
			})

			ac.AddSignal(aj.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal("TextBounds"), function()
				aj.UIElements.Keybind.Size =
					UDim2.new(0, 24 + aj.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X, 0, 42)
			end)

			function aj.Lock(al)
				aj.Locked = true
				ak = false
				return aj.KeybindtrueFrame:Lock()
			end
			function aj.Unlock(al)
				aj.Locked = false
				ak = true
				return aj.KeybindFrame:Unlock()
			end

			function aj.Set(al, am)
				aj.Value = am
				aj.UIElements.Keybind.Frame.Frame.TextLabel.Text = am
			end

			if aj.Locked then
				aj:Lock()
			end

			ac.AddSignal(aj.KeybindFrame.UIElements.Main.MouseButton1Click, function()
				if ak then
					if aj.CanChange then
						aj.Picking = true
						aj.UIElements.Keybind.Frame.Frame.TextLabel.Text = "..."

						task.wait(0.2)

						local al
						al = aa.InputBegan:Connect(function(am)
							local an

							if am.UserInputType == Enum.UserInputType.Keyboard then
								an = am.KeyCode.Name
							elseif am.UserInputType == Enum.UserInputType.MouseButton1 then
								an = "MouseLeft"
							elseif am.UserInputType == Enum.UserInputType.MouseButton2 then
								an = "MouseRight"
							end

							local ao
							ao = aa.InputEnded:Connect(function(ap)
								if
									ap.KeyCode.Name == an
									or an == "MouseLeft" and ap.UserInputType == Enum.UserInputType.MouseButton1
									or an == "MouseRight" and ap.UserInputType == Enum.UserInputType.MouseButton2
								then
									aj.Picking = false

									aj.UIElements.Keybind.Frame.Frame.TextLabel.Text = an
									aj.Value = an

									al:Disconnect()
									ao:Disconnect()
								end
							end)
						end)
					end
				end
			end)
			ac.AddSignal(aa.InputBegan, function(al)
				if ak then
					if al.KeyCode.Name == aj.Value then
						ac.SafeCallback(aj.Callback, al.KeyCode.Name)
					end
				end
			end)
			return aj.__type, aj
		end

		return af
	end
	function z.G()
		local aa = z.load("a")
		local ac = aa.New
		local ad = aa.Tween

		local ae = {
			UICorner = 8,
			UIPadding = 8,
		}
		local af = z.load("i").New
		local ag = z.load("j").New

		function ae.New(ah, ai)
			local aj = {
				__type = "Input",
				Title = ai.Title or "Input",
				Desc = ai.Desc or nil,
				Type = ai.Type or "Input",
				Locked = ai.Locked or false,
				InputIcon = ai.InputIcon or false,
				Placeholder = ai.Placeholder or "Enter Text...",
				Value = ai.Value or "",
				Callback = ai.Callback or function() end,
				ClearTextOnFocus = ai.ClearTextOnFocus or false,
				UIElements = {},

				Width = 150,
			}

			local ak = true

			aj.InputFrame = z.load("y")({
				Title = aj.Title,
				Desc = aj.Desc,
				Parent = ai.Parent,
				TextOffset = aj.Width,
				Hover = false,
				Tab = ai.Tab,
				Index = ai.Index,
				Window = ai.Window,
				ElementTable = aj,
			})

			local al = ag(
				aj.Placeholder,
				aj.InputIcon,
				aj.Type == "Textarea" and aj.InputFrame.UIElements.Container or aj.InputFrame.UIElements.Main,
				aj.Type,
				function(al)
					aj:Set(al)
				end,
				nil,
				ai.Window.NewElements and 12 or 10,
				aj.ClearTextOnFocus
			)

			if aj.Type == "Input" then
				al.Size = UDim2.new(0, aj.Width, 0, 36)
				al.Position = UDim2.new(1, 0, 0.5, 0)
				al.AnchorPoint = Vector2.new(1, 0.5)
			else
				al.Size = UDim2.new(1, 0, 0, 148)
			end

			ac("UIScale", {
				Parent = al,
				Scale = 1,
			})

			function aj.Lock(am)
				aj.Locked = true
				ak = false
				return aj.InputFrame:Lock()
			end
			function aj.Unlock(am)
				aj.Locked = false
				ak = true
				return aj.InputFrame:Unlock()
			end

			function aj.Set(am, an)
				if ak then
					aa.SafeCallback(aj.Callback, an)

					al.Frame.Frame.TextBox.Text = an
					aj.Value = an
				end
			end
			function aj.SetPlaceholder(am, an)
				al.Frame.Frame.TextBox.PlaceholderText = an
				aj.Placeholder = an
			end

			aj:Set(aj.Value)

			if aj.Locked then
				aj:Lock()
			end

			return aj.__type, aj
		end

		return ae
	end
	function z.H()
		local aa = {}

		local ac = f
		local ae = r
		local af = h.CurrentCamera

		local ag = workspace.CurrentCamera

		local ah = z.load("j").New

		local ai = z.load("a")
		local aj = ai.New
		local ak = ai.Tween

		function aa.New(al, am, an, ao, ap)
			local aq = {}

			am.UIElements.UIListLayout = aj("UIListLayout", {
				Padding = UDim.new(0, an.MenuPadding),
				FillDirection = "Vertical",
			})

			am.UIElements.Menu = ai.NewRoundFrame(an.MenuCorner, "Squircle", {
				ThemeTag = {
					ImageColor3 = "Background",
				},
				ImageTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
			}, {
				aj("UIPadding", {
					PaddingTop = UDim.new(0, an.MenuPadding),
					PaddingLeft = UDim.new(0, an.MenuPadding),
					PaddingRight = UDim.new(0, an.MenuPadding),
					PaddingBottom = UDim.new(0, an.MenuPadding),
				}),
				aj("UIListLayout", {
					FillDirection = "Vertical",
					Padding = UDim.new(0, an.MenuPadding),
				}),
				aj("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, am.SearchBarEnabled and -an.MenuPadding - an.SearchBarHeight),

					ClipsDescendants = true,
					LayoutOrder = 999,
				}, {
					aj("UICorner", {
						CornerRadius = UDim.new(0, an.MenuCorner - an.MenuPadding),
					}),
					aj("ScrollingFrame", {
						Size = UDim2.new(1, 0, 1, 0),
						ScrollBarThickness = 0,
						ScrollingDirection = "Y",
						AutomaticCanvasSize = "Y",
						CanvasSize = UDim2.new(0, 0, 0, 0),
						BackgroundTransparency = 1,
						ScrollBarImageTransparency = 1,
					}, {
						am.UIElements.UIListLayout,
					}),
				}),
			})

			am.UIElements.MenuCanvas = aj("Frame", {
				Size = UDim2.new(0, am.MenuWidth, 0, 300),
				BackgroundTransparency = 1,
				Position = UDim2.new(-10, 0, -10, 0),
				Visible = false,
				Active = false,

				Parent = al.WindUI.DropdownGui,
				AnchorPoint = Vector2.new(1, 0),
			}, {
				am.UIElements.Menu,

				aj("UISizeConstraint", {
					MinSize = Vector2.new(170, 0),
				}),
			})

			local function RecalculateCanvasSize()
				am.UIElements.Menu.Frame.ScrollingFrame.CanvasSize =
					UDim2.fromOffset(0, am.UIElements.UIListLayout.AbsoluteContentSize.Y)
			end

			local function RecalculateListSize()
				local ar = ag.ViewportSize.Y * 0.6

				local as = am.UIElements.UIListLayout.AbsoluteContentSize.Y
				local at = am.SearchBarEnabled and (an.SearchBarHeight + (an.MenuPadding * 3)) or (an.MenuPadding * 2)
				local au = as + at

				if au > ar then
					am.UIElements.MenuCanvas.Size = UDim2.fromOffset(am.UIElements.MenuCanvas.AbsoluteSize.X, ar)
				else
					am.UIElements.MenuCanvas.Size = UDim2.fromOffset(am.UIElements.MenuCanvas.AbsoluteSize.X, au)
				end
			end

			function UpdatePosition()
				local ar = am.UIElements.Dropdown
				local as = am.UIElements.MenuCanvas

				local at = af.ViewportSize.Y - (ar.AbsolutePosition.Y + ar.AbsoluteSize.Y) - an.MenuPadding - 54
				local au = as.AbsoluteSize.Y + an.MenuPadding

				local av = -54
				if at < au then
					av = au - at - 54
				end

				as.Position = UDim2.new(
					0,
					ar.AbsolutePosition.X + ar.AbsoluteSize.X,
					0,
					ar.AbsolutePosition.Y + ar.AbsoluteSize.Y - av + an.MenuPadding
				)
			end

			local ar

			function aq.Display(as)
				local at = am.Values
				local au = ""

				if am.Multi then
					for av, aw in next, at do
						local ax = typeof(aw) == "table" and aw.Title or aw
						if table.find(am.Value, ax) then
							au = au .. ax .. ", "
						end
					end
					au = au:sub(1, #au - 2)
				else
					au = typeof(am.Value) == "table" and am.Value.Title or am.Value or ""
				end

				am.UIElements.Dropdown.Frame.Frame.TextLabel.Text = (au == "" and "--" or au)
			end

			function aq.Refresh(as, at)
				for au, av in next, am.UIElements.Menu.Frame.ScrollingFrame:GetChildren() do
					if not av:IsA("UIListLayout") then
						av:Destroy()
					end
				end

				am.Tabs = {}

				if am.SearchBarEnabled then
					if not ar then
						ar = ah("Search...", "search", am.UIElements.Menu, nil, function(au)
							for av, aw in next, am.Tabs do
								if string.find(string.lower(aw.Name), string.lower(au), 1, true) then
									aw.UIElements.TabItem.Visible = true
								else
									aw.UIElements.TabItem.Visible = false
								end
								RecalculateListSize()
							end
						end, true)
						ar.Size = UDim2.new(1, 0, 0, an.SearchBarHeight)
						ar.Position = UDim2.new(0, 0, 0, 0)
						ar.Name = "SearchBar"
					end
				end

				for au, av in next, at do
					local aw = {
						Name = typeof(av) == "table" and av.Title or av,
						Icon = typeof(av) == "table" and av.Icon or nil,
						Original = av,
						Selected = false,
						UIElements = {},
					}
					local ax
					if aw.Icon then
						ax = ai.Image(aw.Icon, aw.Icon, 0, al.Window.Folder, "Dropdown", true)
						ax.Size = UDim2.new(0, an.TabIcon, 0, an.TabIcon)
						ax.ImageLabel.ImageTransparency = 0.2
						aw.UIElements.TabIcon = ax
					end
					aw.UIElements.TabItem = ai.NewRoundFrame(an.MenuCorner - an.MenuPadding, "Squircle", {
						Size = UDim2.new(1, 0, 0, 36),

						ImageTransparency = 1,
						Parent = am.UIElements.Menu.Frame.ScrollingFrame,

						ImageColor3 = Color3.new(1, 1, 1),
					}, {
						ai.NewRoundFrame(an.MenuCorner - an.MenuPadding, "SquircleOutline", {
							Size = UDim2.new(1, 0, 1, 0),
							ImageColor3 = Color3.new(1, 1, 1),
							ImageTransparency = 1,
							Name = "Highlight",
						}, {
							aj("UIGradient", {
								Rotation = 80,
								Color = ColorSequence.new({
									ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
									ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
									ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
								}),
								Transparency = NumberSequence.new({
									NumberSequenceKeypoint.new(0.0, 0.1),
									NumberSequenceKeypoint.new(0.5, 1),
									NumberSequenceKeypoint.new(1.0, 0.1),
								}),
							}),
						}),
						aj("Frame", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
						}, {
							aj("UIListLayout", {
								Padding = UDim.new(0, an.TabPadding),
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							aj("UIPadding", {

								PaddingLeft = UDim.new(0, an.TabPadding),
								PaddingRight = UDim.new(0, an.TabPadding),
							}),
							aj("UICorner", {
								CornerRadius = UDim.new(0, an.MenuCorner - an.MenuPadding),
							}),

							ax,
							aj("TextLabel", {
								Text = aw.Name,
								TextXAlignment = "Left",
								FontFace = Font.new(ai.Font, Enum.FontWeight.Regular),
								ThemeTag = {
									TextColor3 = "Text",
									BackgroundColor3 = "Text",
								},
								TextSize = 15,
								BackgroundTransparency = 1,
								TextTransparency = 0.4,
								LayoutOrder = 999,
								AutomaticSize = "Y",

								Size = UDim2.new(1, ax and -an.TabPadding - an.TabIcon or 0, 0, 0),
								AnchorPoint = Vector2.new(0, 0.5),
								Position = UDim2.new(0, 0, 0.5, 0),
							}),
						}),
					}, true)

					if am.Multi then
						aw.Selected = table.find(am.Value or {}, aw.Name)
					else
						aw.Selected = typeof(am.Value) == "table" and am.Value.Title == aw.Name or am.Value == aw.Name
					end

					if aw.Selected then
						aw.UIElements.TabItem.ImageTransparency = 0.95
						aw.UIElements.TabItem.Highlight.ImageTransparency = 0.75

						aw.UIElements.TabItem.Frame.TextLabel.TextTransparency = 0
						if aw.UIElements.TabIcon then
							aw.UIElements.TabIcon.ImageLabel.ImageTransparency = 0
						end
					end

					am.Tabs[au] = aw

					aq:Display()

					local function Callback()
						aq:Display()
						task.spawn(function()
							ai.SafeCallback(am.Callback, am.Value)
						end)
					end

					ai.AddSignal(aw.UIElements.TabItem.MouseButton1Click, function()
						if ap == "Dropdown" then
							if am.Multi then
								if not aw.Selected then
									aw.Selected = true
									ak(aw.UIElements.TabItem, 0.1, { ImageTransparency = 0.95 }):Play()
									ak(aw.UIElements.TabItem.Highlight, 0.1, { ImageTransparency = 0.75 }):Play()

									ak(aw.UIElements.TabItem.Frame.TextLabel, 0.1, { TextTransparency = 0 }):Play()
									if aw.UIElements.TabIcon then
										ak(aw.UIElements.TabIcon.ImageLabel, 0.1, { ImageTransparency = 0 }):Play()
									end
									table.insert(am.Value, aw.Original)
								else
									if not am.AllowNone and #am.Value == 1 then
										return
									end
									aw.Selected = false
									ak(aw.UIElements.TabItem, 0.1, { ImageTransparency = 1 }):Play()
									ak(aw.UIElements.TabItem.Highlight, 0.1, { ImageTransparency = 1 }):Play()

									ak(aw.UIElements.TabItem.Frame.TextLabel, 0.1, { TextTransparency = 0.4 }):Play()
									if aw.UIElements.TabIcon then
										ak(aw.UIElements.TabIcon.ImageLabel, 0.1, { ImageTransparency = 0.2 }):Play()
									end

									for ay, az in ipairs(am.Value) do
										if typeof(az) == "table" and (az.Title == aw.Name) or (az == aw.Name) then
											table.remove(am.Value, ay)
											break
										end
									end
								end
							else
								for ay, az in next, am.Tabs do
									ak(az.UIElements.TabItem, 0.1, { ImageTransparency = 1 }):Play()
									ak(az.UIElements.TabItem.Highlight, 0.1, { ImageTransparency = 1 }):Play()

									ak(az.UIElements.TabItem.Frame.TextLabel, 0.1, { TextTransparency = 0.4 }):Play()
									if az.UIElements.TabIcon then
										ak(az.UIElements.TabIcon.ImageLabel, 0.1, { ImageTransparency = 0.2 }):Play()
									end
									az.Selected = false
								end
								aw.Selected = true
								ak(aw.UIElements.TabItem, 0.1, { ImageTransparency = 0.95 }):Play()
								ak(aw.UIElements.TabItem.Highlight, 0.1, { ImageTransparency = 0.75 }):Play()

								ak(aw.UIElements.TabItem.Frame.TextLabel, 0.1, { TextTransparency = 0 }):Play()
								if aw.UIElements.TabIcon then
									ak(aw.UIElements.TabIcon.ImageLabel, 0.1, { ImageTransparency = 0 }):Play()
								end
								am.Value = aw.Original
							end
							Callback()
						end
					end)

					RecalculateCanvasSize()
					RecalculateListSize()
				end

				local au = 0
				for av, aw in next, am.Tabs do
					if aw.UIElements.TabItem.Frame.TextLabel then
						local ax = aw.UIElements.TabItem.Frame.TextLabel.TextBounds.X
						au = math.max(au, ax)
					end
				end

				am.UIElements.MenuCanvas.Size = UDim2.new(
					0,
					au + 6 + 6 + 5 + 5 + 18 + 6 + 6,
					am.UIElements.MenuCanvas.Size.Y.Scale,
					am.UIElements.MenuCanvas.Size.Y.Offset
				)
			end

			aq:Refresh(am.Values)

			function aq.Select(as, at)
				if at then
					am.Value = at
				else
					if am.Multi then
						am.Value = {}
					else
						am.Value = nil
					end
				end
				aq:Refresh(am.Values)
			end

			RecalculateListSize()

			function aq.Open(as)
				if ao then
					am.UIElements.Menu.Visible = true
					am.UIElements.MenuCanvas.Visible = true
					am.UIElements.MenuCanvas.Active = true
					am.UIElements.Menu.Size = UDim2.new(1, 0, 0, 0)
					ak(am.UIElements.Menu, 0.1, {
						Size = UDim2.new(1, 0, 1, 0),
						ImageTransparency = 0.05,
					}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()

					task.spawn(function()
						task.wait(0.1)
						am.Opened = true
					end)

					UpdatePosition()
				end
			end
			function aq.Close(as)
				am.Opened = false

				ak(am.UIElements.Menu, 0.25, {
					Size = UDim2.new(1, 0, 0, 0),
					ImageTransparency = 1,
				}, Enum.EasingStyle.Quart, Enum.EasingDirection.Out):Play()

				task.spawn(function()
					task.wait(0.1)
					am.UIElements.Menu.Visible = false
				end)

				task.spawn(function()
					task.wait(0.25)
					am.UIElements.MenuCanvas.Visible = false
					am.UIElements.MenuCanvas.Active = false
				end)
			end

			ai.AddSignal(am.UIElements.Dropdown.MouseButton1Click, function()
				aq:Open()
			end)

			ai.AddSignal(ac.InputBegan, function(as)
				if
					as.UserInputType == Enum.UserInputType.MouseButton1
					or as.UserInputType == Enum.UserInputType.Touch
				then
					local at = am.UIElements.MenuCanvas
					local au, av = at.AbsolutePosition, at.AbsoluteSize

					local aw = am.UIElements.Dropdown
					local ax = aw.AbsolutePosition
					local ay = aw.AbsoluteSize

					local az = ae.X >= ax.X and ae.X <= ax.X + ay.X and ae.Y >= ax.Y and ae.Y <= ax.Y + ay.Y

					local aA = ae.X >= au.X and ae.X <= au.X + av.X and ae.Y >= au.Y and ae.Y <= au.Y + av.Y

					if al.Window.CanDropdown and am.Opened and not az and not aA then
						aq:Close()
					end
				end
			end)

			ai.AddSignal(am.UIElements.Dropdown:GetPropertyChangedSignal("AbsolutePosition"), UpdatePosition)

			return aq
		end

		return aa
	end
	function z.I()
		local aa = h.CurrentCamera

		local ac = z.load("a")
		local ae = ac.New
		local af = ac.Tween

		local ag = z.load("s").New
		local ah = z.load("j").New
		local ai = z.load("H").New
		local aj = workspace.CurrentCamera

		local ak = {
			UICorner = 10,
			UIPadding = 12,
			MenuCorner = 15,
			MenuPadding = 5,
			TabPadding = 10,
			SearchBarHeight = 39,
			TabIcon = 18,
		}

		function ak.New(al, am)
			local an = {
				__type = "Dropdown",
				Title = am.Title or "Dropdown",
				Desc = am.Desc or nil,
				Locked = am.Locked or false,
				Values = am.Values or {},
				MenuWidth = am.MenuWidth or 170,
				Value = am.Value,
				AllowNone = am.AllowNone,
				SearchBarEnabled = am.SearchBarEnabled or false,
				Multi = am.Multi,
				Callback = am.Callback or function() end,

				UIElements = {},

				Opened = false,
				Tabs = {},

				Width = 150,
			}

			if an.Multi and not an.Value then
				an.Value = {}
			end

			local ao = true

			an.DropdownFrame = z.load("y")({
				Title = an.Title,
				Desc = an.Desc,
				Parent = am.Parent,
				TextOffset = an.Width,
				Hover = false,
				Tab = am.Tab,
				Index = am.Index,
				Window = am.Window,
				ElementTable = an,
			})

			an.UIElements.Dropdown = ag("", nil, an.DropdownFrame.UIElements.Main)

			an.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate = "AtEnd"
			an.UIElements.Dropdown.Frame.Frame.TextLabel.Size =
				UDim2.new(1, an.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset - 18 - 12 - 12, 0, 0)

			an.UIElements.Dropdown.Size = UDim2.new(0, an.Width, 0, 36)
			an.UIElements.Dropdown.Position = UDim2.new(1, 0, 0.5, 0)
			an.UIElements.Dropdown.AnchorPoint = Vector2.new(1, 0.5)

			ae("ImageLabel", {
				Image = ac.Icon("chevrons-up-down")[1],
				ImageRectOffset = ac.Icon("chevrons-up-down")[2].ImageRectPosition,
				ImageRectSize = ac.Icon("chevrons-up-down")[2].ImageRectSize,
				Size = UDim2.new(0, 18, 0, 18),
				Position = UDim2.new(1, -12, 0.5, 0),
				ThemeTag = {
					ImageColor3 = "Icon",
				},
				AnchorPoint = Vector2.new(1, 0.5),
				Parent = an.UIElements.Dropdown.Frame,
			})

			an.DropdownMenu = ai(am, an, ak, ao, "Dropdown")

			an.Display = an.DropdownMenu.Display
			an.Refresh = an.DropdownMenu.Refresh
			an.Select = an.DropdownMenu.Select
			an.Open = an.DropdownMenu.Open
			an.Close = an.DropdownMenu.Close

			function an.Lock(ap)
				an.Locked = true
				ao = false
				return an.DropdownFrame:Lock()
			end
			function an.Unlock(ap)
				an.Locked = false
				ao = true
				return an.DropdownFrame:Unlock()
			end

			if an.Locked then
				an:Lock()
			end

			return an.__type, an
		end

		return ak
	end
	function z.J()
		local ac = {}
		local ae = {
			lua = {
				"and",
				"break",
				"or",
				"else",
				"elseif",
				"if",
				"then",
				"until",
				"repeat",
				"while",
				"do",
				"for",
				"in",
				"end",
				"local",
				"return",
				"function",
				"export",
			},
			rbx = {
				"game",
				"workspace",
				"script",
				"math",
				"string",
				"table",
				"task",
				"wait",
				"select",
				"next",
				"Enum",
				"tick",
				"assert",
				"shared",
				"loadstring",
				"tonumber",
				"tostring",
				"type",
				"typeof",
				"unpack",
				"Instance",
				"CFrame",
				"Vector3",
				"Vector2",
				"Color3",
				"UDim",
				"UDim2",
				"Ray",
				"BrickColor",
				"OverlapParams",
				"RaycastParams",
				"Axes",
				"Random",
				"Region3",
				"Rect",
				"TweenInfo",
				"collectgarbage",
				"not",
				"utf8",
				"pcall",
				"xpcall",
				"_G",
				"setmetatable",
				"getmetatable",
				"os",
				"pairs",
				"ipairs",
			},
			operators = {
				"#",
				"+",
				"-",
				"*",
				"%",
				"/",
				"^",
				"=",
				"~",
				"=",
				"<",
				">",
			},
		}

		local ag = {
			numbers = Color3.fromHex("#FAB387"),
			boolean = Color3.fromHex("#FAB387"),
			operator = Color3.fromHex("#94E2D5"),
			lua = Color3.fromHex("#CBA6F7"),
			rbx = Color3.fromHex("#F38BA8"),
			str = Color3.fromHex("#A6E3A1"),
			comment = Color3.fromHex("#9399B2"),
			null = Color3.fromHex("#F38BA8"),
			call = Color3.fromHex("#89B4FA"),
			self_call = Color3.fromHex("#89B4FA"),
			local_property = Color3.fromHex("#CBA6F7"),
		}

		local function createKeywordSet(ai)
			local aj = {}
			for ak, al in ipairs(ai) do
				aj[al] = true
			end
			return aj
		end

		local ai = createKeywordSet(ae.lua)
		local aj = createKeywordSet(ae.rbx)
		local ak = createKeywordSet(ae.operators)

		local function getHighlight(al, am)
			local an = al[am]

			if ag[an .. "_color"] then
				return ag[an .. "_color"]
			end

			if tonumber(an) then
				return ag.numbers
			elseif an == "nil" then
				return ag.null
			elseif an:sub(1, 2) == "--" then
				return ag.comment
			elseif ak[an] then
				return ag.operator
			elseif ai[an] then
				return ag.lua
			elseif aj[an] then
				return ag.rbx
			elseif an:sub(1, 1) == '"' or an:sub(1, 1) == "'" then
				return ag.str
			elseif an == "true" or an == "false" then
				return ag.boolean
			end

			if al[am + 1] == "(" then
				if al[am - 1] == ":" then
					return ag.self_call
				end

				return ag.call
			end

			if al[am - 1] == "." then
				if al[am - 2] == "Enum" then
					return ag.rbx
				end

				return ag.local_property
			end
		end

		function ac.run(al)
			local am = {}
			local an = ""

			local ao = false
			local ap = false
			local aq = false

			for ar = 1, #al do
				local as = al:sub(ar, ar)

				if ap then
					if as == "\n" and not aq then
						table.insert(am, an)
						table.insert(am, as)
						an = ""

						ap = false
					elseif al:sub(ar - 1, ar) == "]]" and aq then
						an = an .. "]"

						table.insert(am, an)
						an = ""

						ap = false
						aq = false
					else
						an = an .. as
					end
				elseif ao then
					if as == ao and al:sub(ar - 1, ar - 1) ~= "\\" or as == "\n" then
						an = an .. as
						ao = false
					else
						an = an .. as
					end
				else
					if al:sub(ar, ar + 1) == "--" then
						table.insert(am, an)
						an = "-"
						ap = true
						aq = al:sub(ar + 2, ar + 3) == "[["
					elseif as == '"' or as == "'" then
						table.insert(am, an)
						an = as
						ao = as
					elseif ak[as] then
						table.insert(am, an)
						table.insert(am, as)
						an = ""
					elseif as:match("[%w_]") then
						an = an .. as
					else
						table.insert(am, an)
						table.insert(am, as)
						an = ""
					end
				end
			end

			table.insert(am, an)

			local ar = {}

			for as, at in ipairs(am) do
				local au = getHighlight(am, as)

				if au then
					local av = string.format(
						'<font color = "#%s">%s</font>',
						au:ToHex(),
						at:gsub("<", "&lt;"):gsub(">", "&gt;")
					)

					table.insert(ar, av)
				else
					table.insert(ar, at)
				end
			end

			return table.concat(ar)
		end

		return ac
	end
	function z.K()
		local ac = {}

		local ae = z.load("a")
		local ag = ae.New
		local ai = ae.Tween

		local aj = z.load("J")

		function ac.New(ak, al, am, an, ao)
			local ap = {
				Radius = 12,
				Padding = 10,
			}

			local aq = ag("TextLabel", {
				Text = "",
				TextColor3 = Color3.fromHex("#CDD6F4"),
				TextTransparency = 0,
				TextSize = 14,
				TextWrapped = false,
				LineHeight = 1.15,
				RichText = true,
				TextXAlignment = "Left",
				Size = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
			}, {
				ag("UIPadding", {
					PaddingTop = UDim.new(0, ap.Padding + 3),
					PaddingLeft = UDim.new(0, ap.Padding + 3),
					PaddingRight = UDim.new(0, ap.Padding + 3),
					PaddingBottom = UDim.new(0, ap.Padding + 3),
				}),
			})
			aq.Font = "Code"

			local ar = ag("ScrollingFrame", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticCanvasSize = "X",
				ScrollingDirection = "X",
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				ScrollBarThickness = 0,
			}, {
				aq,
			})

			local as = ag("TextButton", {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 30, 0, 30),
				Position = UDim2.new(1, -ap.Padding / 2, 0, ap.Padding / 2),
				AnchorPoint = Vector2.new(1, 0),
				Visible = an and true or false,
			}, {
				ae.NewRoundFrame(ap.Radius - 4, "Squircle", {

					ImageColor3 = Color3.fromHex("#ffffff"),
					ImageTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Button",
				}, {
					ag("UIScale", {
						Scale = 1,
					}),
					ag("ImageLabel", {
						Image = ae.Icon("copy")[1],
						ImageRectSize = ae.Icon("copy")[2].ImageRectSize,
						ImageRectOffset = ae.Icon("copy")[2].ImageRectPosition,
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						Size = UDim2.new(0, 12, 0, 12),

						ImageColor3 = Color3.fromHex("#ffffff"),
						ImageTransparency = 0.1,
					}),
				}),
			})

			ae.AddSignal(as.MouseEnter, function()
				ai(as.Button, 0.05, { ImageTransparency = 0.95 }):Play()
				ai(as.Button.UIScale, 0.05, { Scale = 0.9 }):Play()
			end)
			ae.AddSignal(as.InputEnded, function()
				ai(as.Button, 0.08, { ImageTransparency = 1 }):Play()
				ai(as.Button.UIScale, 0.08, { Scale = 1 }):Play()
			end)

			local at = ae.NewRoundFrame(ap.Radius, "Squircle", {

				ImageColor3 = Color3.fromHex("#212121"),
				ImageTransparency = 0.035,
				Size = UDim2.new(1, 0, 0, 20 + (ap.Padding * 2)),
				AutomaticSize = "Y",
				Parent = am,
			}, {
				ae.NewRoundFrame(ap.Radius, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),

					ImageColor3 = Color3.fromHex("#ffffff"),
					ImageTransparency = 0.955,
				}),
				ag("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
				}, {
					ae.NewRoundFrame(ap.Radius, "Squircle-TL-TR", {

						ImageColor3 = Color3.fromHex("#ffffff"),
						ImageTransparency = 0.96,
						Size = UDim2.new(1, 0, 0, 20 + (ap.Padding * 2)),
						Visible = al and true or false,
					}, {
						ag("ImageLabel", {
							Size = UDim2.new(0, 18, 0, 18),
							BackgroundTransparency = 1,
							Image = "rbxassetid://132464694294269",

							ImageColor3 = Color3.fromHex("#ffffff"),
							ImageTransparency = 0.2,
						}),
						ag("TextLabel", {
							Text = al,

							TextColor3 = Color3.fromHex("#ffffff"),
							TextTransparency = 0.2,
							TextSize = 16,
							AutomaticSize = "Y",
							FontFace = Font.new(ae.Font, Enum.FontWeight.Medium),
							TextXAlignment = "Left",
							BackgroundTransparency = 1,
							TextTruncate = "AtEnd",
							Size = UDim2.new(1, as and -20 - (ap.Padding * 2), 0, 0),
						}),
						ag("UIPadding", {

							PaddingLeft = UDim.new(0, ap.Padding + 3),
							PaddingRight = UDim.new(0, ap.Padding + 3),
						}),
						ag("UIListLayout", {
							Padding = UDim.new(0, ap.Padding),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center",
						}),
					}),
					ar,
					ag("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
					}),
				}),
				as,
			})

			ap.CodeFrame = at

			ae.AddSignal(aq:GetPropertyChangedSignal("TextBounds"), function()
				ar.Size = UDim2.new(1, 0, 0, (aq.TextBounds.Y / (ao or 1)) + ((ap.Padding + 3) * 2))
			end)

			function ap.Set(au)
				aq.Text = aj.run(au)
			end

			function ap.Destroy()
				at:Destroy()
				ap = nil
			end

			ap.Set(ak)

			ae.AddSignal(as.MouseButton1Click, function()
				if an then
					an()
					local au = ae.Icon("check")
					as.Button.ImageLabel.Image = au[1]
					as.Button.ImageLabel.ImageRectSize = au[2].ImageRectSize
					as.Button.ImageLabel.ImageRectOffset = au[2].ImageRectPosition

					task.wait(1)
					local av = ae.Icon("copy")
					as.Button.ImageLabel.Image = av[1]
					as.Button.ImageLabel.ImageRectSize = av[2].ImageRectSize
					as.Button.ImageLabel.ImageRectOffset = av[2].ImageRectPosition
				end
			end)
			return ap
		end

		return ac
	end
	function z.L()
		local ac = z.load("a")
		local ae = ac.New

		local ag = z.load("K")

		local ai = {}

		function ai.New(aj, ak)
			local al = {
				__type = "Code",
				Title = ak.Title,
				Code = ak.Code,
				OnCopy = ak.OnCopy,
			}

			local am = not al.Locked

			local an = ag.New(al.Code, al.Title, ak.Parent, function()
				if am then
					local an = al.Title or "code"
					local ao, ap = pcall(function()
						toclipboard(al.Code)

						if al.OnCopy then
							al.OnCopy()
						end
					end)
					if not ao then
						ak.WindUI:Notify({
							Title = "Error",
							Content = "The " .. an .. " is not copied. Error: " .. ap,
							Icon = "x",
							Duration = 5,
						})
					end
				end
			end, ak.WindUI.UIScale, al)

			function al.SetCode(ao, ap)
				an.Set(ap)
			end

			function al.Destroy(ao)
				an.Destroy()
				al = nil
			end

			al.ElementFrame = an.CodeFrame

			return al.__type, al
		end

		return ai
	end
	function z.M()
		local ac = z.load("a")
		local ae = ac.New
		local ag = ac.Tween

		local ai = f
		local aj = e
		local ak = d

		local al = aj.RenderStepped
		local am = ak.LocalPlayer
		local an = r

		local ao = z.load("i").New
		local ap = z.load("j").New

		local aq = {
			UICorner = 8,
			UIPadding = 8,
		}

		function aq.Colorpicker(ar, as, at, au)
			local av = {
				__type = "Colorpicker",
				Title = as.Title,
				Desc = as.Desc,
				Default = as.Default,
				Callback = as.Callback,
				Transparency = as.Transparency,
				UIElements = as.UIElements,

				TextPadding = 10,
			}

			function av.SetHSVFromRGB(aw, ax)
				local ay, az, aA = Color3.toHSV(ax)
				av.Hue = ay
				av.Sat = az
				av.Vib = aA
			end

			av:SetHSVFromRGB(av.Default)

			local aw = z.load("k").Init(at)
			local ax = aw.Create()

			av.ColorpickerFrame = ax

			ax.UIElements.Main.Size = UDim2.new(1, 0, 0, 0)

			local ay, az, aA = av.Hue, av.Sat, av.Vib

			av.UIElements.Title = ae("TextLabel", {
				Text = av.Title,
				TextSize = 20,
				FontFace = Font.new(ac.Font, Enum.FontWeight.SemiBold),
				TextXAlignment = "Left",
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = "Y",
				ThemeTag = {
					TextColor3 = "Text",
				},
				BackgroundTransparency = 1,
				Parent = ax.UIElements.Main,
			}, {
				ae("UIPadding", {
					PaddingTop = UDim.new(0, av.TextPadding / 2),
					PaddingLeft = UDim.new(0, av.TextPadding / 2),
					PaddingRight = UDim.new(0, av.TextPadding / 2),
					PaddingBottom = UDim.new(0, av.TextPadding / 2),
				}),
			})

			local aB = ae("Frame", {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0, 0),
				Parent = HueDragHolder,
				BackgroundColor3 = av.Default,
			}, {
				ae("UIStroke", {
					Thickness = 2,
					Transparency = 0.1,
					ThemeTag = {
						Color = "Text",
					},
				}),
				ae("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
			})

			av.UIElements.SatVibMap = ae("ImageLabel", {
				Size = UDim2.fromOffset(160, 158),
				Position = UDim2.fromOffset(0, 40 + av.TextPadding),
				Image = "rbxassetid://4155801252",
				BackgroundColor3 = Color3.fromHSV(ay, 1, 1),
				BackgroundTransparency = 0,
				Parent = ax.UIElements.Main,
			}, {
				ae("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				ac.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.85,
					ZIndex = 99999,
				}, {
					ae("UIGradient", {
						Rotation = 45,
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						}),
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}),
					}),
				}),

				aB,
			})

			av.UIElements.Inputs = ae("Frame", {
				AutomaticSize = "XY",
				Size = UDim2.new(0, 0, 0, 0),
				Position = UDim2.fromOffset(av.Transparency and 240 or 210, 40 + av.TextPadding),
				BackgroundTransparency = 1,
				Parent = ax.UIElements.Main,
			}, {
				ae("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = "Vertical",
				}),
			})

			local aC = ae("Frame", {
				BackgroundColor3 = av.Default,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = av.Transparency,
			}, {
				ae("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			})

			ae("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(85, 208 + av.TextPadding),
				Size = UDim2.fromOffset(75, 24),
				Parent = ax.UIElements.Main,
			}, {
				ae("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
				ac.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.85,
					ZIndex = 99999,
				}, {
					ae("UIGradient", {
						Rotation = 60,
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						}),
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}),
					}),
				}),

				aC,
			})

			local aD = ae("Frame", {
				BackgroundColor3 = av.Default,
				Size = UDim2.fromScale(1, 1),
				BackgroundTransparency = 0,
				ZIndex = 9,
			}, {
				ae("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),
			})

			ae("ImageLabel", {
				Image = "http://www.roblox.com/asset/?id=14204231522",
				ImageTransparency = 0.45,
				ScaleType = Enum.ScaleType.Tile,
				TileSize = UDim2.fromOffset(40, 40),
				BackgroundTransparency = 1,
				Position = UDim2.fromOffset(0, 208 + av.TextPadding),
				Size = UDim2.fromOffset(75, 24),
				Parent = ax.UIElements.Main,
			}, {
				ae("UICorner", {
					CornerRadius = UDim.new(0, 8),
				}),

				ac.NewRoundFrame(8, "SquircleOutline", {
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					Size = UDim2.new(1, 0, 1, 0),
					ImageTransparency = 0.85,
					ZIndex = 99999,
				}, {
					ae("UIGradient", {
						Rotation = 60,
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						}),
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}),
					}),
				}),
				aD,
			})

			local aE = {}

			for aF = 0, 1, 0.1 do
				table.insert(aE, ColorSequenceKeypoint.new(aF, Color3.fromHSV(aF, 1, 1)))
			end

			local aF = ae("UIGradient", {
				Color = ColorSequence.new(aE),
				Rotation = 90,
			})

			local aG = ae("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
			})

			local aH = ae("Frame", {
				Size = UDim2.new(0, 14, 0, 14),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0, 0),
				Parent = aG,

				BackgroundColor3 = av.Default,
			}, {
				ae("UIStroke", {
					Thickness = 2,
					Transparency = 0.1,
					ThemeTag = {
						Color = "Text",
					},
				}),
				ae("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
			})

			local aI = ae("Frame", {
				Size = UDim2.fromOffset(6, 192),
				Position = UDim2.fromOffset(180, 40 + av.TextPadding),
				Parent = ax.UIElements.Main,
			}, {
				ae("UICorner", {
					CornerRadius = UDim.new(1, 0),
				}),
				aF,
				aG,
			})

			function CreateNewInput(aJ, aK)
				local aL = ap(aJ, nil, av.UIElements.Inputs)

				ae("TextLabel", {
					BackgroundTransparency = 1,
					TextTransparency = 0.4,
					TextSize = 17,
					FontFace = Font.new(ac.Font, Enum.FontWeight.Regular),
					AutomaticSize = "XY",
					ThemeTag = {
						TextColor3 = "Placeholder",
					},
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -12, 0.5, 0),
					Parent = aL.Frame,
					Text = aJ,
				})

				ae("UIScale", {
					Parent = aL,
					Scale = 0.85,
				})

				aL.Frame.Frame.TextBox.Text = aK
				aL.Size = UDim2.new(0, 150, 0, 42)

				return aL
			end

			local function ToRGB(aJ)
				return {
					R = math.floor(aJ.R * 255),
					G = math.floor(aJ.G * 255),
					B = math.floor(aJ.B * 255),
				}
			end

			local aJ = CreateNewInput("Hex", "#" .. av.Default:ToHex())

			local aK = CreateNewInput("Red", ToRGB(av.Default).R)
			local aL = CreateNewInput("Green", ToRGB(av.Default).G)
			local aM = CreateNewInput("Blue", ToRGB(av.Default).B)
			local aN
			if av.Transparency then
				aN = CreateNewInput("Alpha", ((1 - av.Transparency) * 100) .. "%")
			end

			local aO = ae("Frame", {
				Size = UDim2.new(1, 0, 0, 40),
				AutomaticSize = "Y",
				Position = UDim2.new(0, 0, 0, 254 + av.TextPadding),
				BackgroundTransparency = 1,
				Parent = ax.UIElements.Main,
				LayoutOrder = 4,
			}, {
				ae("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right",
				}),
			})

			local aP = {
				{
					Title = "Cancel",
					Variant = "Secondary",
					Callback = function() end,
				},
				{
					Title = "Apply",
					Icon = "chevron-right",
					Variant = "Primary",
					Callback = function()
						au(Color3.fromHSV(av.Hue, av.Sat, av.Vib), av.Transparency)
					end,
				},
			}

			for aQ, A in next, aP do
				local C = ao(A.Title, A.Icon, A.Callback, A.Variant, aO, ax, false)
				C.Size = UDim2.new(0.5, -3, 0, 40)
				C.AutomaticSize = "None"
			end

			local aQ, A, C
			if av.Transparency then
				local F = ae("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					Position = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
				})

				A = ae("ImageLabel", {
					Size = UDim2.new(0, 14, 0, 14),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0, 0),
					ThemeTag = {
						BackgroundColor3 = "Text",
					},
					Parent = F,
				}, {
					ae("UIStroke", {
						Thickness = 2,
						Transparency = 0.1,
						ThemeTag = {
							Color = "Text",
						},
					}),
					ae("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
				})

				C = ae("Frame", {
					Size = UDim2.fromScale(1, 1),
				}, {
					ae("UIGradient", {
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0),
							NumberSequenceKeypoint.new(1, 1),
						}),
						Rotation = 270,
					}),
					ae("UICorner", {
						CornerRadius = UDim.new(0, 6),
					}),
				})

				aQ = ae("Frame", {
					Size = UDim2.fromOffset(6, 192),
					Position = UDim2.fromOffset(210, 40 + av.TextPadding),
					Parent = ax.UIElements.Main,
					BackgroundTransparency = 1,
				}, {
					ae("UICorner", {
						CornerRadius = UDim.new(1, 0),
					}),
					ae("ImageLabel", {
						Image = "rbxassetid://14204231522",
						ImageTransparency = 0.45,
						ScaleType = Enum.ScaleType.Tile,
						TileSize = UDim2.fromOffset(40, 40),
						BackgroundTransparency = 1,
						Size = UDim2.fromScale(1, 1),
					}, {
						ae("UICorner", {
							CornerRadius = UDim.new(1, 0),
						}),
					}),
					C,
					F,
				})
			end

			function av.Round(F, G, H)
				if H == 0 then
					return math.floor(G)
				end
				G = tostring(G)
				return G:find("%.") and tonumber(G:sub(1, G:find("%.") + H)) or G
			end

			function av.Update(F, G, H)
				if G then
					ay, az, aA = Color3.toHSV(G)
				else
					ay, az, aA = av.Hue, av.Sat, av.Vib
				end

				av.UIElements.SatVibMap.BackgroundColor3 = Color3.fromHSV(ay, 1, 1)
				aB.Position = UDim2.new(az, 0, 1 - aA, 0)
				aB.BackgroundColor3 = Color3.fromHSV(ay, az, aA)
				aD.BackgroundColor3 = Color3.fromHSV(ay, az, aA)
				aH.BackgroundColor3 = Color3.fromHSV(ay, 1, 1)
				aH.Position = UDim2.new(0.5, 0, ay, 0)

				aJ.Frame.Frame.TextBox.Text = "#" .. Color3.fromHSV(ay, az, aA):ToHex()
				aK.Frame.Frame.TextBox.Text = ToRGB(Color3.fromHSV(ay, az, aA)).R
				aL.Frame.Frame.TextBox.Text = ToRGB(Color3.fromHSV(ay, az, aA)).G
				aM.Frame.Frame.TextBox.Text = ToRGB(Color3.fromHSV(ay, az, aA)).B

				if H or av.Transparency then
					aD.BackgroundTransparency = av.Transparency or H
					C.BackgroundColor3 = Color3.fromHSV(ay, az, aA)
					A.BackgroundColor3 = Color3.fromHSV(ay, az, aA)
					A.BackgroundTransparency = av.Transparency or H
					A.Position = UDim2.new(0.5, 0, 1 - av.Transparency or H, 0)
					aN.Frame.Frame.TextBox.Text = av:Round((1 - av.Transparency or H) * 100, 0) .. "%"
				end
			end

			av:Update(av.Default, av.Transparency)

			local function GetRGB()
				local F = Color3.fromHSV(av.Hue, av.Sat, av.Vib)
				return { R = math.floor(F.r * 255), G = math.floor(F.g * 255), B = math.floor(F.b * 255) }
			end

			local function clamp(F, G, H)
				return math.clamp(tonumber(F) or 0, G, H)
			end

			ac.AddSignal(aJ.Frame.Frame.TextBox.FocusLost, function(F)
				if F then
					local G = aJ.Frame.Frame.TextBox.Text:gsub("#", "")
					local H, J = pcall(Color3.fromHex, G)
					if H and typeof(J) == "Color3" then
						av.Hue, av.Sat, av.Vib = Color3.toHSV(J)
						av:Update()
						av.Default = J
					end
				end
			end)

			local function updateColorFromInput(F, G)
				ac.AddSignal(F.Frame.Frame.TextBox.FocusLost, function(H)
					if H then
						local J = F.Frame.Frame.TextBox
						local L = GetRGB()
						local M = clamp(J.Text, 0, 255)
						J.Text = tostring(M)

						L[G] = M
						local N = Color3.fromRGB(L.R, L.G, L.B)
						av.Hue, av.Sat, av.Vib = Color3.toHSV(N)
						av:Update()
					end
				end)
			end

			updateColorFromInput(aK, "R")
			updateColorFromInput(aL, "G")
			updateColorFromInput(aM, "B")

			if av.Transparency then
				ac.AddSignal(aN.Frame.Frame.TextBox.FocusLost, function(F)
					if F then
						local G = aN.Frame.Frame.TextBox
						local H = clamp(G.Text, 0, 100)
						G.Text = tostring(H)

						av.Transparency = 1 - H * 0.01
						av:Update(nil, av.Transparency)
					end
				end)
			end

			local F = av.UIElements.SatVibMap
			ac.AddSignal(F.InputBegan, function(G)
				if
					G.UserInputType == Enum.UserInputType.MouseButton1
					or G.UserInputType == Enum.UserInputType.Touch
				then
					while ai:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local H = F.AbsolutePosition.X
						local J = H + F.AbsoluteSize.X
						local L = math.clamp(an.X, H, J)

						local M = F.AbsolutePosition.Y
						local N = M + F.AbsoluteSize.Y
						local O = math.clamp(an.Y, M, N)

						av.Sat = (L - H) / (J - H)
						av.Vib = 1 - ((O - M) / (N - M))
						av:Update()

						al:Wait()
					end
				end
			end)

			ac.AddSignal(aI.InputBegan, function(G)
				if
					G.UserInputType == Enum.UserInputType.MouseButton1
					or G.UserInputType == Enum.UserInputType.Touch
				then
					while ai:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local H = aI.AbsolutePosition.Y
						local J = H + aI.AbsoluteSize.Y
						local L = math.clamp(an.Y, H, J)

						av.Hue = ((L - H) / (J - H))
						av:Update()

						al:Wait()
					end
				end
			end)

			if av.Transparency then
				ac.AddSignal(aQ.InputBegan, function(G)
					if
						G.UserInputType == Enum.UserInputType.MouseButton1
						or G.UserInputType == Enum.UserInputType.Touch
					then
						while ai:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local H = aQ.AbsolutePosition.Y
							local J = H + aQ.AbsoluteSize.Y
							local L = math.clamp(an.Y, H, J)

							av.Transparency = 1 - ((L - H) / (J - H))
							av:Update()

							al:Wait()
						end
					end
				end)
			end

			return av
		end

		function aq.New(ar, as)
			local at = {
				__type = "Colorpicker",
				Title = as.Title or "Colorpicker",
				Desc = as.Desc or nil,
				Locked = as.Locked or false,
				Default = as.Default or Color3.new(1, 1, 1),
				Callback = as.Callback or function() end,

				UIScale = as.UIScale,
				Transparency = as.Transparency,
				UIElements = {},
			}

			local au = true

			if as.Window.NewElements then
				aq.UICorner = 14
			end

			at.ColorpickerFrame = z.load("y")({
				Title = at.Title,
				Desc = at.Desc,
				Parent = as.Parent,
				TextOffset = 40,
				Hover = false,
				Tab = as.Tab,
				Index = as.Index,
				Window = as.Window,
				ElementTable = at,
			})

			at.UIElements.Colorpicker = ac.NewRoundFrame(aq.UICorner, "Squircle", {
				ImageTransparency = 0,
				Active = true,
				ImageColor3 = at.Default,
				Parent = at.ColorpickerFrame.UIElements.Main,
				Size = UDim2.new(0, 30, 0, 30),
				AnchorPoint = Vector2.new(1, 0),
				Position = UDim2.new(1, 0, 0, 0),
				ZIndex = 2,
			}, nil, true)

			function at.Lock(av)
				at.Locked = true
				au = false
				return at.ColorpickerFrame:Lock()
			end
			function at.Unlock(av)
				at.Locked = false
				au = true
				return at.ColorpickerFrame:Unlock()
			end

			if at.Locked then
				at:Lock()
			end

			function at.Update(av, aw, ax)
				at.UIElements.Colorpicker.ImageTransparency = ax or 0
				at.UIElements.Colorpicker.ImageColor3 = aw
				at.Default = aw
				if ax then
					at.Transparency = ax
				end
			end

			function at.Set(av, aw, ax)
				return at:Update(aw, ax)
			end

			ac.AddSignal(at.UIElements.Colorpicker.MouseButton1Click, function()
				if au then
					aq:Colorpicker(at, as.Window, function(av, aw)
						at:Update(av, aw)
						at.Default = av
						at.Transparency = aw
						ac.SafeCallback(at.Callback, av, aw)
					end).ColorpickerFrame
						:Open()
				end
			end)

			return at.__type, at
		end

		return aq
	end
	function z.N()
		local ac = z.load("a")
		local ae = ac.New
		local ai = ac.Tween

		local aj = {}

		function aj.New(ak, al)
			local am = {
				__type = "Section",
				Title = al.Title or "Section",
				Icon = al.Icon,
				TextXAlignment = al.TextXAlignment or "Left",
				TextSize = al.TextSize or 19,
				Box = al.Box or false,
				FontWeight = al.FontWeight or Enum.FontWeight.SemiBold,
				TextTransparency = al.TextTransparency or 0.05,
				Opened = al.Opened or false,
				UIElements = {},
				Highlight = al.Highlight or false,
				Tags = al.Tags or {},

				HeaderSize = 42,
				IconSize = 20,
				Padding = 10,

				Elements = {},

				Expandable = false,
			}

			local an
			local ao

			function am.SetIcon(ap, aq)
				am.Icon = aq or nil
				if an then
					an:Destroy()
				end
				if aq then
					an = ac.Image(aq, aq .. ":" .. am.Title, 0, al.Window.Folder, am.__type, true)
					an.Size = UDim2.new(0, am.IconSize, 0, am.IconSize)
				end
			end

			local ap = ae("Frame", {
				Size = UDim2.new(0, am.IconSize, 0, am.IconSize),
				BackgroundTransparency = 1,
				Visible = false,
			}, {
				ae("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = ac.Icon("chevron-down")[1],
					ImageRectSize = ac.Icon("chevron-down")[2].ImageRectSize,
					ImageRectOffset = ac.Icon("chevron-down")[2].ImageRectPosition,
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = 0.7,
				}),
			})

			if am.Icon then
				am:SetIcon(am.Icon)
			end

			local aq = ae("TextLabel", {
				BackgroundTransparency = 1,
				TextXAlignment = am.TextXAlignment,
				AutomaticSize = "Y",
				TextSize = am.TextSize,
				TextTransparency = am.TextTransparency,
				ThemeTag = {
					TextColor3 = "Text",
				},
				FontFace = Font.new(ac.Font, am.FontWeight),

				Text = am.Title,
				Size = UDim2.new(1, 0, 0, 0),
				TextWrapped = true,
			})

			local ar = ae("Frame", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				AutomaticSize = "Y",
				LayoutOrder = 2,
			}, {
				ae("UIListLayout", {
					Padding = UDim.new(0, 4),
					FillDirection = "Horizontal",
					VerticalAlignment = "Center",
				}),
			})

			local function CreateTag(as)
				local at = ae("Frame", {
					Size = UDim2.new(0, 0, 0, 18),
					BackgroundTransparency = 0.8,
					AutomaticSize = "X",
					ThemeTag = {
						BackgroundColor3 = as.Color or "Accent",
					},
				}, {
					ae("UICorner", {
						CornerRadius = UDim.new(0, 6),
					}),
					ae("UIPadding", {
						PaddingLeft = UDim.new(0, 6),
						PaddingRight = UDim.new(0, 6),
					}),
					ae("TextLabel", {
						Size = UDim2.new(1, 0, 1, 0),
						BackgroundTransparency = 1,
						Text = as.Text or "Tag",
						TextSize = 11,
						ThemeTag = {
							TextColor3 = "Text",
						},
						FontFace = Font.new(ac.Font, Enum.FontWeight.Medium),
					}),
				})
				return at
			end

			local function UpdateTitleSize()
				local as = 0
				if an then
					as = as - (am.IconSize + 8)
				end
				if ap.Visible then
					as = as - (am.IconSize + 8)
				end
				aq.Size = UDim2.new(1, as, 0, 0)
			end

			local function SetHighlight(as)
				am.Highlight = as
				if as then
					if not ao then
						ao = ae("Frame", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 0.92,
							BorderSizePixel = 0,
							ZIndex = 0,
							ThemeTag = {
								BackgroundColor3 = "Accent",
							},
						}, {
							ae("UICorner", {
								CornerRadius = al.Window.ElementConfig.UICorner,
							}),
						})
						ao.Parent = ap
					end
					ai(ao, 0.2, { BackgroundTransparency = 0.88 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
				elseif ao then
					ai(ao, 0.2, { BackgroundTransparency = 1 }, Enum.EasingStyle.Quad, Enum.EasingDirection.Out):Play()
				end
			end

			local as = ac.NewRoundFrame(al.Window.ElementConfig.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 0, 0),
				BackgroundTransparency = 1,
				Parent = al.Parent,
				ClipsDescendants = true,
				AutomaticSize = "Y",
				ImageTransparency = am.Box and 0.93 or 1,
				ThemeTag = {
					ImageColor3 = "Text",
				},
			}, {
				ae("TextButton", {
					Size = UDim2.new(1, 0, 0, Expandable and 0 or am.HeaderSize),
					BackgroundTransparency = 1,
					AutomaticSize = Expandable and nil or "Y",
					Text = "",
					Name = "Top",
				}, {
					am.Box and ae("UIPadding", {
						PaddingLeft = UDim.new(0, al.Window.ElementConfig.UIPadding),
						PaddingRight = UDim.new(0, al.Window.ElementConfig.UIPadding),
					}) or nil,
					an,
					ae("Frame", {
						Size = UDim2.new(0, 0, 0, 0),
						BackgroundTransparency = 1,
						AutomaticSize = "XY",
						LayoutOrder = 1,
					}, {
						aq,
						ar,
						ae("UIListLayout", {
							Padding = UDim.new(0, 6),
							FillDirection = "Vertical",
							VerticalAlignment = "Center",
						}),
					}),
					ae("UIListLayout", {
						Padding = UDim.new(0, 8),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
						HorizontalAlignment = "Left",
					}),
					ap,
				}),
				ae("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					Name = "Content",
					Visible = false,
					Position = UDim2.new(0, 0, 0, am.HeaderSize),
				}, {
					am.Box and ae("UIPadding", {
						PaddingLeft = UDim.new(0, al.Window.ElementConfig.UIPadding),
						PaddingRight = UDim.new(0, al.Window.ElementConfig.UIPadding),
						PaddingBottom = UDim.new(0, al.Window.ElementConfig.UIPadding),
					}) or nil,
					ae("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, al.Tab.Gap),
						VerticalAlignment = "Top",
					}),
				}),
			})

			local at = al.ElementsModule

			at.Load(am, as.Content, at.Elements, al.Window, al.WindUI, function()
				if not am.Expandable then
					am.Expandable = true
					ap.Visible = true
					UpdateTitleSize()
				end
			end, at, al.UIScale, al.Tab)

			UpdateTitleSize()

			if #am.Tags > 0 then
				for au, av in ipairs(am.Tags) do
					CreateTag(av).Parent = ar
				end
			end

			function am.SetTitle(au, av)
				aq.Text = av
			end

			function am.SetTags(au, av)
				am.Tags = av or {}

				for aw, ax in pairs(ar:GetChildren()) do
					if ax:IsA("Frame") then
						ax:Destroy()
					end
				end

				for aw, ax in ipairs(am.Tags) do
					CreateTag(ax).Parent = ar
				end
			end

			function am.SetHighlight(au, av)
				SetHighlight(av)
			end

			function am.AddTag(au, av)
				table.insert(am.Tags, av)
				CreateTag(av).Parent = ar
			end

			function am.RemoveTag(au, av)
				if am.Tags[av] then
					table.remove(am.Tags, av)
					local aw = ar:GetChildren()
					if aw[av] and aw[av]:IsA("Frame") then
						aw[av]:Destroy()
					end
				end
			end

			function am.Destroy(au)
				for av, aw in next, am.Elements do
					aw:Destroy()
				end

				as:Destroy()
			end

			local au

			local function updateSectionSize()
				if am.Opened then
					ai(as, 0.33, {
						Size = UDim2.new(1, 0, 0, am.HeaderSize + (as.Content.AbsoluteSize.Y / al.UIScale)),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end

			function am.Open(av)
				if am.Expandable then
					am.Opened = true
					ai(as, 0.33, {
						Size = UDim2.new(1, 0, 0, am.HeaderSize + (as.Content.AbsoluteSize.Y / al.UIScale)),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					ai(ap.ImageLabel, 0.1, { Rotation = 180 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					if not au then
						au = as.Content:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
							updateSectionSize()
						end)
					end
				end
			end

			function am.Close(av)
				if am.Expandable then
					am.Opened = false
					ai(as, 0.26, {
						Size = UDim2.new(1, 0, 0, am.HeaderSize),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					ai(ap.ImageLabel, 0.1, { Rotation = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					if au then
						au:Disconnect()
						au = nil
					end
				end
			end

			ac.AddSignal(as.Top.MouseButton1Click, function()
				if am.Expandable then
					if am.Opened then
						am:Close()
					else
						am:Open()
					end
				end
			end)

			task.spawn(function()
				task.wait()
				if am.Expandable then
					as.Size = UDim2.new(1, 0, 0, am.HeaderSize)
					as.AutomaticSize = "None"
					as.Top.Size = UDim2.new(1, 0, 0, am.HeaderSize)
					as.Top.AutomaticSize = "None"
					as.Content.Visible = true
				end
				if am.Opened then
					am:Open()
				end
			end)

			return am.__type, am
		end

		return aj
	end
	function z.O()
		local ac = z.load("a")
		local ae = ac.New

		local ai = {}

		function ai.New(aj, ak)
			local al = ae("Frame", {
				Size = UDim2.new(1, 0, 0, 1),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 0.9,
				ThemeTag = {
					BackgroundColor3 = "Text",
				},
			})
			local am = ae("Frame", {
				Parent = ak.Parent,
				Size = UDim2.new(1, -7, 0, 7),
				BackgroundTransparency = 1,
			}, {
				al,
			})

			return "Divider", { __type = "Divider", ElementFrame = am }
		end

		return ai
	end
	function z.P()
		local ac = z.load("a")
		local ae = ac.New

		local ai = {}

		function ai.New(aj, ak)
			local al = ae("Frame", {
				Parent = ak.Parent,
				Size = UDim2.new(1, -7, 0, 7 * (ak.Columns or 1)),
				BackgroundTransparency = 1,
			})

			return "Space", { __type = "Space", ElementFrame = al }
		end

		return ai
	end
	function z.Q()
		local ac = z.load("a")
		local ae = ac.New

		local ai = {}

		local function ParseAspectRatio(aj)
			if type(aj) == "string" then
				local ak, al = aj:match("(%d+):(%d+)")
				if ak and al then
					return tonumber(ak) / tonumber(al)
				end
			elseif type(aj) == "number" then
				return aj
			end
			return nil
		end

		function ai.New(aj, ak)
			local al = {
				__type = "Image",
				Image = ak.Image or "",
				AspectRatio = ak.AspectRatio or "16:9",
				Radius = ak.Radius or ak.Window.ElementConfig.UICorner,
			}
			local am = ac.Image(al.Image, al.Image, al.Radius, ak.Window.Folder, "Image", false)
			am.Parent = ak.Parent
			am.Size = UDim2.new(1, 0, 0, 0)
			am.BackgroundTransparency = 1

			local an = ParseAspectRatio(ak.AspectRatio)
			local ao

			if an then
				ao = ae("UIAspectRatioConstraint", {
					Parent = am,
					AspectRatio = an,
					AspectType = "ScaleWithParentSize",
					DominantAxis = "Width",
				})
			end

			function al.Destroy(ap)
				am:Destroy()
			end

			return al.__type, al
		end

		return ai
	end
	function z.R()
		return {
			Elements = {
				Paragraph = z.load("z"),
				Button = z.load("A"),
				Toggle = z.load("D"),
				Slider = z.load("E"),
				Keybind = z.load("F"),
				Input = z.load("G"),
				Dropdown = z.load("I"),
				Code = z.load("L"),
				Colorpicker = z.load("M"),
				Section = z.load("N"),
				Divider = z.load("O"),
				Space = z.load("P"),
				Image = z.load("Q"),
			},
			Load = function(ac, ae, ai, aj, ak, al, am, an, ao)
				for ap, aq in next, ai do
					ac[ap] = function(ar, as)
						as = as or {}
						as.Tab = ao or ac
						as.ParentTable = ac
						as.Index = #ac.Elements + 1
						as.GlobalIndex = #aj.AllElements + 1
						as.Parent = ae
						as.Window = aj
						as.WindUI = ak
						as.UIScale = an
						as.ElementsModule = am
						local at, au = aq:New(as)

						local av
						for aw, ax in pairs(au) do
							if typeof(ax) == "table" and aw:match("Frame$") then
								av = ax
								break
							end
						end

						if av then
							au.ElementFrame = av.UIElements.Main
							function au.SetTitle(aw, ax)
								av:SetTitle(ax)
							end
							function au.SetDesc(aw, ax)
								av:SetDesc(ax)
							end
							function au.Highlight(aw)
								av:Highlight()
							end
							function au.Destroy(aw)
								table.remove(aj.AllElements, as.GlobalIndex)
								table.remove(ac.Elements, as.Index)
								table.remove(ao.Elements, as.Index)
								ac:UpdateAllElementShapes(ac)

								av:Destroy()
							end
						end

						aj.AllElements[as.Index] = au
						ac.Elements[as.Index] = au
						if ao then
							ao.Elements[as.Index] = au
						end

						if aj.NewElements then
							ac:UpdateAllElementShapes(ac)
						end

						if al then
							al()
						end
						return au
					end
				end
				function ac.UpdateAllElementShapes(ap, aq)
					for ar, as in next, aq.Elements do
						local at
						for au, av in pairs(as) do
							if typeof(av) == "table" and au:match("Frame$") then
								at = av
								break
							end
						end

						if at then
							at.Index = ar
							if at.UpdateShape then
								at.UpdateShape(aq)
							end
						end
					end
				end
			end,
		}
	end
	function z.S()
		local ac = r

		local ae = z.load("a")
		local ai = ae.New
		local aj = ae.Tween

		local ak = z.load("x").New
		local al = z.load("t").New

		local am = {

			Tabs = {},
			Containers = {},
			SelectedTab = nil,
			TabCount = 0,
			ToolTipParent = nil,
			TabHighlight = nil,

			OnChangeFunc = function(am) end,
		}

		function am.Init(an, ao, ap, aq)
			Window = an
			WindUI = ao
			am.ToolTipParent = ap
			am.TabHighlight = aq
			return am
		end

		function am.New(an, ao)
			local ap = {
				__type = "Tab",
				Title = an.Title or "Tab",
				Desc = an.Desc,
				Icon = an.Icon,
				IconThemed = an.IconThemed,
				Locked = an.Locked,
				ShowTabTitle = an.ShowTabTitle,
				Selected = false,
				Index = nil,
				Parent = an.Parent,
				UIElements = {},
				Elements = {},
				ContainerFrame = nil,
				UICorner = Window.UICorner - (Window.UIPadding / 2),

				Gap = Window.NewElements and 1 or 6,
			}

			am.TabCount = am.TabCount + 1

			local aq = am.TabCount
			ap.Index = aq

			ap.UIElements.Main = ae.NewRoundFrame(ap.UICorner, "Squircle", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, -7, 0, 0),
				AutomaticSize = "Y",
				Parent = an.Parent,
				ThemeTag = {
					ImageColor3 = "Text",
				},
				ImageTransparency = 1,
			}, {
				ae.NewRoundFrame(ap.UICorner, "SquircleOutline", {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 1,
					Name = "Outline",
				}, {
					ai("UIGradient", {
						Rotation = 80,
						Color = ColorSequence.new({
							ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
							ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
						}),
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0.0, 0.1),
							NumberSequenceKeypoint.new(0.5, 1),
							NumberSequenceKeypoint.new(1.0, 0.1),
						}),
					}),
				}),
				ae.NewRoundFrame(ap.UICorner, "Squircle", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 1,
					Name = "Frame",
				}, {
					ai("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, 10),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					}),
					ai("TextLabel", {
						Text = ap.Title,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextTransparency = not ap.Locked and 0.4 or 0.7,
						TextSize = 15,
						Size = UDim2.new(1, 0, 0, 0),
						FontFace = Font.new(ae.Font, Enum.FontWeight.Medium),
						TextWrapped = true,
						RichText = true,
						AutomaticSize = "Y",
						LayoutOrder = 2,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
					}),
					ai("UIPadding", {
						PaddingTop = UDim.new(0, 2 + (Window.UIPadding / 2)),
						PaddingLeft = UDim.new(0, 4 + (Window.UIPadding / 2)),
						PaddingRight = UDim.new(0, 4 + (Window.UIPadding / 2)),
						PaddingBottom = UDim.new(0, 2 + (Window.UIPadding / 2)),
					}),
				}),
			}, true)

			local ar = 0
			local as
			local at

			if ap.Icon then
				as = ae.Image(ap.Icon, ap.Icon .. ":" .. ap.Title, 0, Window.Folder, ap.__type, true, ap.IconThemed)
				as.Size = UDim2.new(0, 16, 0, 16)
				as.Parent = ap.UIElements.Main.Frame
				as.ImageLabel.ImageTransparency = not ap.Locked and 0 or 0.7
				ap.UIElements.Main.Frame.TextLabel.Size = UDim2.new(1, -30, 0, 0)
				ar = -30

				ap.UIElements.Icon = as

				at = ae.Image(ap.Icon, ap.Icon .. ":" .. ap.Title, 0, Window.Folder, ap.__type, true, ap.IconThemed)
				at.Size = UDim2.new(0, 16, 0, 16)
				at.ImageLabel.ImageTransparency = not ap.Locked and 0 or 0.7
				ar = -30
			end

			function ap.SetTabTitle(au, av)
				pcall(function()
					ap.UIElements.Main.Frame.TextLabel.Text = av
				end)
			end

			ap.UIElements.ContainerFrame = ai("ScrollingFrame", {
				Size = UDim2.new(1, 0, 1, ap.ShowTabTitle and -((Window.UIPadding * 2.4) + 12) or 0),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AnchorPoint = Vector2.new(0, 1),
				Position = UDim2.new(0, 0, 1, 0),
				AutomaticCanvasSize = "Y",

				ScrollingDirection = "Y",
			}, {
				ai("UIPadding", {
					PaddingTop = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingLeft = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingRight = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
					PaddingBottom = UDim.new(0, not Window.HidePanelBackground and 20 or 10),
				}),
				ai("UIListLayout", {
					SortOrder = "LayoutOrder",
					Padding = UDim.new(0, ap.Gap),
					HorizontalAlignment = "Center",
				}),
			})

			ap.UIElements.ContainerFrameCanvas = ai("Frame", {
				Size = UDim2.new(1, 0, 1, 0),
				BackgroundTransparency = 1,
				Visible = false,
				Parent = Window.UIElements.MainBar,
				ZIndex = 5,
			}, {
				ap.UIElements.ContainerFrame,
				ai("Frame", {
					Size = UDim2.new(1, 0, 0, ((Window.UIPadding * 2.4) + 12)),
					BackgroundTransparency = 1,
					Visible = ap.ShowTabTitle or false,
					Name = "TabTitle",
				}, {
					at,
					ai("TextLabel", {
						Text = ap.Title,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextSize = 20,
						TextTransparency = 0.1,
						Size = UDim2.new(1, -ar, 1, 0),
						FontFace = Font.new(ae.Font, Enum.FontWeight.SemiBold),
						TextTruncate = "AtEnd",
						RichText = true,
						LayoutOrder = 2,
						TextXAlignment = "Left",
						BackgroundTransparency = 1,
					}),
					ai("UIPadding", {
						PaddingTop = UDim.new(0, 20),
						PaddingLeft = UDim.new(0, 20),
						PaddingRight = UDim.new(0, 20),
						PaddingBottom = UDim.new(0, 20),
					}),
					ai("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, 10),
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
					}),
				}),
				ai("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundTransparency = 0.9,
					ThemeTag = {
						BackgroundColor3 = "Text",
					},
					Position = UDim2.new(0, 0, 0, ((Window.UIPadding * 2.4) + 12)),
					Visible = ap.ShowTabTitle or false,
				}),
			})

			am.Containers[aq] = ap.UIElements.ContainerFrameCanvas
			am.Tabs[aq] = ap

			ap.ContainerFrame = ContainerFrameCanvas

			ae.AddSignal(ap.UIElements.Main.MouseButton1Click, function()
				if not ap.Locked then
					am:SelectTab(aq)
				end
			end)

			if Window.ScrollBarEnabled then
				al(ap.UIElements.ContainerFrame, ap.UIElements.ContainerFrameCanvas, Window, 3)
			end

			local au
			local av
			local aw
			local ax = false

			if ap.Desc then
				ae.AddSignal(ap.UIElements.Main.InputBegan, function()
					ax = true
					av = task.spawn(function()
						task.wait(0.35)
						if ax and not au then
							au = ak(ap.Desc, am.ToolTipParent)

							local function updatePosition()
								if au then
									au.Container.Position = UDim2.new(0, ac.X, 0, ac.Y - 20)
								end
							end

							updatePosition()
							aw = ac.Move:Connect(updatePosition)
							au:Open()
						end
					end)
				end)
			end

			ae.AddSignal(ap.UIElements.Main.MouseEnter, function()
				if not ap.Locked then
					aj(ap.UIElements.Main.Frame, 0.08, { ImageTransparency = 0.97 }):Play()
				end
			end)
			ae.AddSignal(ap.UIElements.Main.InputEnded, function()
				if ap.Desc then
					ax = false
					if av then
						task.cancel(av)
						av = nil
					end
					if aw then
						aw:Disconnect()
						aw = nil
					end
					if au then
						au:Close()
						au = nil
					end
				end

				if not ap.Locked then
					aj(ap.UIElements.Main.Frame, 0.08, { ImageTransparency = 1 }):Play()
				end
			end)

			function ap.ScrollToTheElement(ay, az)
				ap.UIElements.ContainerFrame.ScrollingEnabled = false
				aj(ap.UIElements.ContainerFrame, 0.45, {
					CanvasPosition = Vector2.new(
						0,

						ap.Elements[az].ElementFrame.AbsolutePosition.Y
							- ap.UIElements.ContainerFrame.AbsolutePosition.Y
							- ap.UIElements.ContainerFrame.UIPadding.PaddingTop.Offset
					),
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

				task.spawn(function()
					task.wait(0.48)

					if ap.Elements[az].Highlight then
						ap.Elements[az]:Highlight()
						ap.UIElements.ContainerFrame.ScrollingEnabled = true
					end
				end)

				return ap
			end

			ap.ElementsModule = z.load("R")

			ap.ElementsModule.Load(
				ap,
				ap.UIElements.ContainerFrame,
				ap.ElementsModule.Elements,
				Window,
				WindUI,
				nil,
				ap.ElementsModule,
				ao
			)

			function ap.LockAll(ay)
				for az, aA in next, Window.AllElements do
					if aA.Tab and aA.Tab.Index and aA.Tab.Index == ap.Index and aA.Lock then
						aA:Lock()
					end
				end
			end
			function ap.UnlockAll(ay)
				for az, aA in next, Window.AllElements do
					if aA.Tab and aA.Tab.Index and aA.Tab.Index == ap.Index and aA.Unlock then
						aA:Unlock()
					end
				end
			end
			function ap.GetLocked(ay)
				local az = {}

				for aA, aB in next, Window.AllElements do
					if aB.Tab and aB.Tab.Index and aB.Tab.Index == ap.Index and aB.Locked == true then
						table.insert(az, aB)
					end
				end

				return az
			end
			function ap.GetUnlocked(ay)
				local az = {}

				for aA, aB in next, Window.AllElements do
					if aB.Tab and aB.Tab.Index and aB.Tab.Index == ap.Index and aB.Locked == false then
						table.insert(az, aB)
					end
				end

				return az
			end

			function ap.Select(ay)
				return am:SelectTab(ap.Index)
			end

			task.spawn(function()
				local ay = ai("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, -Window.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
					Parent = ap.UIElements.ContainerFrame,
				}, {
					ai("UIListLayout", {
						Padding = UDim.new(0, 8),
						SortOrder = "LayoutOrder",
						VerticalAlignment = "Center",
						HorizontalAlignment = "Center",
						FillDirection = "Vertical",
					}),
					ai("ImageLabel", {
						Size = UDim2.new(0, 48, 0, 48),
						Image = ae.Icon("frown")[1],
						ImageRectOffset = ae.Icon("frown")[2].ImageRectPosition,
						ImageRectSize = ae.Icon("frown")[2].ImageRectSize,
						ThemeTag = {
							ImageColor3 = "Icon",
						},
						BackgroundTransparency = 1,
						ImageTransparency = 0.6,
					}),
					ai("TextLabel", {
						AutomaticSize = "XY",
						Text = "This tab is empty",
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextSize = 18,
						TextTransparency = 0.5,
						BackgroundTransparency = 1,
						FontFace = Font.new(ae.Font, Enum.FontWeight.Medium),
					}),
				})

				local az
				az = ae.AddSignal(ap.UIElements.ContainerFrame.ChildAdded, function()
					ay.Visible = false
					az:Disconnect()
				end)
			end)

			return ap
		end

		function am.OnChange(an, ao)
			am.OnChangeFunc = ao
		end

		function am.SelectTab(an, ao)
			if not am.Tabs[ao].Locked then
				am.SelectedTab = ao

				for ap, aq in next, am.Tabs do
					if not aq.Locked then
						aj(aq.UIElements.Main, 0.15, { ImageTransparency = 1 }):Play()
						aj(aq.UIElements.Main.Outline, 0.15, { ImageTransparency = 1 }):Play()
						aj(aq.UIElements.Main.Frame.TextLabel, 0.15, { TextTransparency = 0.3 }):Play()
						if aq.UIElements.Icon then
							aj(aq.UIElements.Icon.ImageLabel, 0.15, { ImageTransparency = 0.4 }):Play()
						end
						aq.Selected = false
					end
				end
				aj(am.Tabs[ao].UIElements.Main, 0.15, { ImageTransparency = 0.95 }):Play()
				aj(am.Tabs[ao].UIElements.Main.Outline, 0.15, { ImageTransparency = 0.85 }):Play()
				aj(am.Tabs[ao].UIElements.Main.Frame.TextLabel, 0.15, { TextTransparency = 0 }):Play()
				if am.Tabs[ao].UIElements.Icon then
					aj(am.Tabs[ao].UIElements.Icon.ImageLabel, 0.15, { ImageTransparency = 0.1 }):Play()
				end
				am.Tabs[ao].Selected = true

				task.spawn(function()
					for ap, aq in next, am.Containers do
						aq.AnchorPoint = Vector2.new(0, 0.05)
						aq.Visible = false
					end
					am.Containers[ao].Visible = true
					aj(
						am.Containers[ao],
						0.15,
						{ AnchorPoint = Vector2.new(0, 0) },
						Enum.EasingStyle.Quart,
						Enum.EasingDirection.Out
					):Play()
				end)

				am.OnChangeFunc(ao)
			end
		end

		return am
	end
	function z.T()
		local ac = {}

		local ae = z.load("a")
		local ai = ae.New
		local aj = ae.Tween

		local ak = z.load("S")

		function ac.New(al, am, an, ao, ap)
			local aq = {
				Title = al.Title or "Section",
				Icon = al.Icon,
				IconThemed = al.IconThemed,
				Opened = al.Opened or false,

				HeaderSize = 42,
				IconSize = 18,

				Expandable = false,
			}

			local ar
			if aq.Icon then
				ar = ae.Image(aq.Icon, aq.Icon, 0, an, "Section", true, aq.IconThemed)

				ar.Size = UDim2.new(0, aq.IconSize, 0, aq.IconSize)
				ar.ImageLabel.ImageTransparency = 0.25
			end

			local as = ai("Frame", {
				Size = UDim2.new(0, aq.IconSize, 0, aq.IconSize),
				BackgroundTransparency = 1,
				Visible = false,
			}, {
				ai("ImageLabel", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Image = ae.Icon("chevron-down")[1],
					ImageRectSize = ae.Icon("chevron-down")[2].ImageRectSize,
					ImageRectOffset = ae.Icon("chevron-down")[2].ImageRectPosition,
					ThemeTag = {
						ImageColor3 = "Icon",
					},
					ImageTransparency = 0.7,
				}),
			})

			local at = ai("Frame", {
				Size = UDim2.new(1, 0, 0, aq.HeaderSize),
				BackgroundTransparency = 1,
				Parent = am,
				ClipsDescendants = true,
			}, {
				ai("TextButton", {
					Size = UDim2.new(1, 0, 0, aq.HeaderSize),
					BackgroundTransparency = 1,
					Text = "",
				}, {
					ar,
					ai("TextLabel", {
						Text = aq.Title,
						TextXAlignment = "Left",
						Size = UDim2.new(1, ar and (-aq.IconSize - 10) * 2 or (-aq.IconSize - 10), 1, 0),
						ThemeTag = {
							TextColor3 = "Text",
						},
						FontFace = Font.new(ae.Font, Enum.FontWeight.SemiBold),
						TextSize = 14,
						BackgroundTransparency = 1,
						TextTransparency = 0.7,

						TextWrapped = true,
					}),
					ai("UIListLayout", {
						FillDirection = "Horizontal",
						VerticalAlignment = "Center",
						Padding = UDim.new(0, 10),
					}),
					as,
					ai("UIPadding", {
						PaddingLeft = UDim.new(0, 11),
						PaddingRight = UDim.new(0, 11),
					}),
				}),
				ai("Frame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					Name = "Content",
					Visible = true,
					Position = UDim2.new(0, 0, 0, aq.HeaderSize),
				}, {
					ai("UIListLayout", {
						FillDirection = "Vertical",
						Padding = UDim.new(0, ap.Gap),
						VerticalAlignment = "Bottom",
					}),
				}),
			})

			function aq.Tab(au, av)
				if not aq.Expandable then
					aq.Expandable = true
					as.Visible = true
				end
				av.Parent = at.Content
				return ak.New(av, ao)
			end

			function aq.Open(au)
				if aq.Expandable then
					aq.Opened = true
					aj(at, 0.33, {
						Size = UDim2.new(1, 0, 0, aq.HeaderSize + (at.Content.AbsoluteSize.Y / ao)),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					aj(as.ImageLabel, 0.1, { Rotation = 180 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end
			function aq.Close(au)
				if aq.Expandable then
					aq.Opened = false
					aj(at, 0.26, {
						Size = UDim2.new(1, 0, 0, aq.HeaderSize),
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					aj(as.ImageLabel, 0.1, { Rotation = 0 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end
			end

			ae.AddSignal(at.TextButton.MouseButton1Click, function()
				if aq.Expandable then
					if aq.Opened then
						aq:Close()
					else
						aq:Open()
					end
				end
			end)

			if aq.Opened then
				task.spawn(function()
					task.wait()
					aq:Open()
				end)
			end

			return aq
		end

		return ac
	end
	function z.U()
		return {
			Tab = "table-of-contents",
			Paragraph = "type",
			Button = "square-mouse-pointer",
			Toggle = "toggle-right",
			Slider = "sliders-horizontal",
			Keybind = "command",
			Input = "text-cursor-input",
			Dropdown = "chevrons-up-down",
			Code = "terminal",
			Colorpicker = "palette",
		}
	end
	function z.V()
		local ac = {
			Margin = 8,
			Padding = 9,
		}

		local ae = z.load("a")
		local ai = ae.New
		local aj = ae.Tween

		function ac.new(ak, al, am)
			local an = {
				IconSize = 18,
				Padding = 14,
				Radius = 22,
				Width = 400,
				MaxHeight = 380,

				Icons = z.load("U"),
			}

			local ao = ai("TextBox", {
				Text = "",
				PlaceholderText = "Search...",
				ThemeTag = {
					PlaceholderColor3 = "Placeholder",
					TextColor3 = "Text",
				},
				Size = UDim2.new(1, -((an.IconSize * 2) + (an.Padding * 2)), 0, 0),
				AutomaticSize = "Y",
				ClipsDescendants = true,
				ClearTextOnFocus = false,
				BackgroundTransparency = 1,
				TextXAlignment = "Left",
				FontFace = Font.new(ae.Font, Enum.FontWeight.Regular),
				TextSize = 18,
			})

			local ap = ai("ImageLabel", {
				Image = ae.Icon("x")[1],
				ImageRectSize = ae.Icon("x")[2].ImageRectSize,
				ImageRectOffset = ae.Icon("x")[2].ImageRectPosition,
				BackgroundTransparency = 1,
				ThemeTag = {
					ImageColor3 = "Icon",
				},
				ImageTransparency = 0.1,
				Size = UDim2.new(0, an.IconSize, 0, an.IconSize),
			}, {
				ai("TextButton", {
					Size = UDim2.new(1, 8, 1, 8),
					BackgroundTransparency = 1,
					Active = true,
					ZIndex = 999999999,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Text = "",
				}),
			})

			local aq = ai("ScrollingFrame", {
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticCanvasSize = "Y",
				ScrollingDirection = "Y",
				ElasticBehavior = "Never",
				ScrollBarThickness = 0,
				CanvasSize = UDim2.new(0, 0, 0, 0),
				BackgroundTransparency = 1,
				Visible = false,
			}, {
				ai("UIListLayout", {
					Padding = UDim.new(0, 0),
					FillDirection = "Vertical",
				}),
				ai("UIPadding", {
					PaddingTop = UDim.new(0, an.Padding),
					PaddingLeft = UDim.new(0, an.Padding),
					PaddingRight = UDim.new(0, an.Padding),
					PaddingBottom = UDim.new(0, an.Padding),
				}),
			})

			local ar = ae.NewRoundFrame(an.Radius, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ThemeTag = {
					ImageColor3 = "Background",
				},
				ImageTransparency = 0,
			}, {
				ae.NewRoundFrame(an.Radius, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,

					Visible = false,
					ImageColor3 = Color3.new(1, 1, 1),
					ImageTransparency = 0.98,
					Name = "Frame",
				}, {
					ai("Frame", {
						Size = UDim2.new(1, 0, 0, 46),
						BackgroundTransparency = 1,
					}, {

						ai("Frame", {
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
						}, {
							ai("ImageLabel", {
								Image = ae.Icon("search")[1],
								ImageRectSize = ae.Icon("search")[2].ImageRectSize,
								ImageRectOffset = ae.Icon("search")[2].ImageRectPosition,
								BackgroundTransparency = 1,
								ThemeTag = {
									ImageColor3 = "Icon",
								},
								ImageTransparency = 0.1,
								Size = UDim2.new(0, an.IconSize, 0, an.IconSize),
							}),
							ao,
							ap,
							ai("UIListLayout", {
								Padding = UDim.new(0, an.Padding),
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							ai("UIPadding", {
								PaddingLeft = UDim.new(0, an.Padding),
								PaddingRight = UDim.new(0, an.Padding),
							}),
						}),
					}),
					ai("Frame", {
						BackgroundTransparency = 1,
						AutomaticSize = "Y",
						Size = UDim2.new(1, 0, 0, 0),
						Name = "Results",
					}, {
						ai("Frame", {
							Size = UDim2.new(1, 0, 0, 1),
							ThemeTag = {
								BackgroundColor3 = "Outline",
							},
							BackgroundTransparency = 0.9,
							Visible = false,
						}),
						aq,
						ai("UISizeConstraint", {
							MaxSize = Vector2.new(an.Width, an.MaxHeight),
						}),
					}),
					ai("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
					}),
				}),
			})

			local as = ai("Frame", {
				Size = UDim2.new(0, an.Width, 0, 0),
				AutomaticSize = "Y",
				Parent = al,
				BackgroundTransparency = 1,
				Position = UDim2.new(0.5, 0, 0.5, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Visible = false,

				ZIndex = 99999999,
			}, {
				ai("UIScale", {
					Scale = 0.9,
				}),
				ar,
				ae.NewRoundFrame(an.Radius, "SquircleOutline2", {
					Size = UDim2.new(1, 0, 1, 0),
					ThemeTag = {
						ImageColor3 = "Outline",
					},
					ImageTransparency = 1,
				}, {
					ai("UIGradient", {
						Rotation = 45,
						Transparency = NumberSequence.new({
							NumberSequenceKeypoint.new(0, 0.55),
							NumberSequenceKeypoint.new(0.5, 0.8),
							NumberSequenceKeypoint.new(1, 0.6),
						}),
					}),
				}),
			})

			local function CreateSearchTab(at, au, av, aw, ax, ay)
				local az = ai("TextButton", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					BackgroundTransparency = 1,
					Parent = aw or nil,
				}, {
					ae.NewRoundFrame(an.Radius - 11, "Squircle", {
						Size = UDim2.new(1, 0, 0, 0),
						Position = UDim2.new(0.5, 0, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5),

						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Main",
					}, {
						ae.NewRoundFrame(an.Radius - 11, "SquircleOutline2", {
							Size = UDim2.new(1, 0, 1, 0),
							Position = UDim2.new(0.5, 0, 0.5, 0),
							AnchorPoint = Vector2.new(0.5, 0.5),
							ThemeTag = {
								ImageColor3 = "Outline",
							},
							ImageTransparency = 1,
							Name = "Outline",
						}, {
							ai("UIGradient", {
								Rotation = 65,
								Transparency = NumberSequence.new({
									NumberSequenceKeypoint.new(0, 0.55),
									NumberSequenceKeypoint.new(0.5, 0.8),
									NumberSequenceKeypoint.new(1, 0.6),
								}),
							}),
							ai("UIPadding", {
								PaddingTop = UDim.new(0, an.Padding - 2),
								PaddingLeft = UDim.new(0, an.Padding),
								PaddingRight = UDim.new(0, an.Padding),
								PaddingBottom = UDim.new(0, an.Padding - 2),
							}),
							ai("ImageLabel", {
								Image = ae.Icon(av)[1],
								ImageRectSize = ae.Icon(av)[2].ImageRectSize,
								ImageRectOffset = ae.Icon(av)[2].ImageRectPosition,
								BackgroundTransparency = 1,
								ThemeTag = {
									ImageColor3 = "Icon",
								},
								ImageTransparency = 0.1,
								Size = UDim2.new(0, an.IconSize, 0, an.IconSize),
							}),
							ai("Frame", {
								Size = UDim2.new(1, -an.IconSize - an.Padding, 0, 0),
								BackgroundTransparency = 1,
							}, {
								ai("TextLabel", {
									Text = at,
									ThemeTag = {
										TextColor3 = "Text",
									},
									TextSize = 17,
									BackgroundTransparency = 1,
									TextXAlignment = "Left",
									FontFace = Font.new(ae.Font, Enum.FontWeight.Medium),
									Size = UDim2.new(1, 0, 0, 0),
									TextTruncate = "AtEnd",
									AutomaticSize = "Y",
									Name = "Title",
								}),
								ai("TextLabel", {
									Text = au or "",
									Visible = au and true or false,
									ThemeTag = {
										TextColor3 = "Text",
									},
									TextSize = 15,
									TextTransparency = 0.3,
									BackgroundTransparency = 1,
									TextXAlignment = "Left",
									FontFace = Font.new(ae.Font, Enum.FontWeight.Medium),
									Size = UDim2.new(1, 0, 0, 0),
									TextTruncate = "AtEnd",
									AutomaticSize = "Y",
									Name = "Desc",
								}) or nil,
								ai("UIListLayout", {
									Padding = UDim.new(0, 6),
									FillDirection = "Vertical",
								}),
							}),
							ai("UIListLayout", {
								Padding = UDim.new(0, an.Padding),
								FillDirection = "Horizontal",
							}),
						}),
					}, true),
					ai("Frame", {
						Name = "ParentContainer",
						Size = UDim2.new(1, -an.Padding, 0, 0),
						AutomaticSize = "Y",
						BackgroundTransparency = 1,
						Visible = ax,
					}, {
						ae.NewRoundFrame(99, "Squircle", {
							Size = UDim2.new(0, 2, 1, 0),
							BackgroundTransparency = 1,
							ThemeTag = {
								ImageColor3 = "Text",
							},
							ImageTransparency = 0.9,
						}),
						ai("Frame", {
							Size = UDim2.new(1, -an.Padding - 2, 0, 0),
							Position = UDim2.new(0, an.Padding + 2, 0, 0),
							BackgroundTransparency = 1,
						}, {
							ai("UIListLayout", {
								Padding = UDim.new(0, 0),
								FillDirection = "Vertical",
							}),
						}),
					}),
					ai("UIListLayout", {
						Padding = UDim.new(0, 0),
						FillDirection = "Vertical",
						HorizontalAlignment = "Right",
					}),
				})

				az.Main.Size = UDim2.new(
					1,
					0,
					0,
					az.Main.Outline.Frame.Desc.Visible
							and (((an.Padding - 2) * 2) + az.Main.Outline.Frame.Title.TextBounds.Y + 6 + az.Main.Outline.Frame.Desc.TextBounds.Y)
						or (((an.Padding - 2) * 2) + az.Main.Outline.Frame.Title.TextBounds.Y)
				)

				ae.AddSignal(az.Main.MouseEnter, function()
					aj(az.Main, 0.04, { ImageTransparency = 0.95 }):Play()
					aj(az.Main.Outline, 0.04, { ImageTransparency = 0.7 }):Play()
				end)
				ae.AddSignal(az.Main.InputEnded, function()
					aj(az.Main, 0.08, { ImageTransparency = 1 }):Play()
					aj(az.Main.Outline, 0.08, { ImageTransparency = 1 }):Play()
				end)
				ae.AddSignal(az.Main.MouseButton1Click, function()
					if ay then
						ay()
					end
				end)

				return az
			end

			local function ContainsText(at, au)
				if not au or au == "" then
					return false
				end

				if not at or at == "" then
					return false
				end

				local av = string.lower(at)
				local aw = string.lower(au)

				return string.find(av, aw, 1, true) ~= nil
			end

			local function Search(at)
				if not at or at == "" then
					return {}
				end

				local au = {}
				for av, aw in next, ak.Tabs do
					local ax = ContainsText(aw.Title or "", at)
					local ay = {}

					for az, aA in next, aw.Elements do
						if aA.__type ~= "Section" then
							local aB = ContainsText(aA.Title or "", at)
							local aC = ContainsText(aA.Desc or "", at)

							if aB or aC then
								ay[az] = {
									Title = aA.Title,
									Desc = aA.Desc,
									Original = aA,
									__type = aA.__type,
									Index = az,
								}
							end
						end
					end

					if ax or next(ay) ~= nil then
						au[av] = {
							Tab = aw,
							Title = aw.Title,
							Icon = aw.Icon,
							Elements = ay,
						}
					end
				end
				return au
			end

			function an.Search(at, au)
				au = au or ""

				local av = Search(au)

				aq.Visible = true
				ar.Frame.Results.Frame.Visible = true
				for aw, ax in next, aq:GetChildren() do
					if ax.ClassName ~= "UIListLayout" and ax.ClassName ~= "UIPadding" then
						ax:Destroy()
					end
				end

				if av and next(av) ~= nil then
					for aw, ax in next, av do
						local ay = an.Icons.Tab
						local az = CreateSearchTab(ax.Title, nil, ay, aq, true, function()
							an:Close()
							ak:SelectTab(aw)
						end)
						if ax.Elements and next(ax.Elements) ~= nil then
							for aA, aB in next, ax.Elements do
								local aC = an.Icons[aB.__type]
								CreateSearchTab(
									aB.Title,
									aB.Desc,
									aC,
									az:FindFirstChild("ParentContainer") and az.ParentContainer.Frame or nil,
									false,
									function()
										an:Close()
										ak:SelectTab(aw)
										if ax.Tab.ScrollToTheElement then
											ax.Tab:ScrollToTheElement(aB.Index)
										end
									end
								)
							end
						end
					end
				elseif au ~= "" then
					ai("TextLabel", {
						Size = UDim2.new(1, 0, 0, 70),
						BackgroundTransparency = 1,
						Text = "No results found",
						TextSize = 16,
						ThemeTag = {
							TextColor3 = "Text",
						},
						TextTransparency = 0.2,
						BackgroundTransparency = 1,
						FontFace = Font.new(ae.Font, Enum.FontWeight.Medium),
						Parent = aq,
						Name = "NotFound",
					})
				else
					aq.Visible = false
					ar.Frame.Results.Frame.Visible = false
				end
			end

			ae.AddSignal(ao:GetPropertyChangedSignal("Text"), function()
				an:Search(ao.Text)
			end)

			ae.AddSignal(aq.UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"), function()
				aj(aq, 0.06, {
					Size = UDim2.new(
						1,
						0,
						0,
						math.clamp(aq.UIListLayout.AbsoluteContentSize.Y + (an.Padding * 2), 0, an.MaxHeight)
					),
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
			end)

			function an.Open(at)
				task.spawn(function()
					ar.Frame.Visible = true
					as.Visible = true
					aj(as.UIScale, 0.12, { Scale = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end)
			end

			function an.Close(at)
				task.spawn(function()
					am()
					ar.Frame.Visible = false
					aj(as.UIScale, 0.12, { Scale = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					task.wait(0.12)
					as.Visible = false
				end)
			end

			ae.AddSignal(ap.TextButton.MouseButton1Click, function()
				an:Close()
			end)

			an:Open()

			return an
		end

		return ac
	end
	function z.W()
		local ac = f

		local ae = workspace.CurrentCamera

		local ai = z.load("a")
		local aj = ai.New
		aj = function(...)
			local ak = { ... }
			local al, am = pcall(ai.New, unpack(ak))
			if not al then
				warn(`[Wind GUI Error]: {tostring(am)}`)
			end
			return am
		end
		local ak = ai.Tween

		local al = z.load("s").New
		local am = z.load("i").New
		local an = z.load("t").New
		local ao = z.load("u")

		local ap = z.load("v")

		return function(aq)
			local ar = {
				Title = aq.Title or "UI Library",
				Author = aq.Author,
				Icon = aq.Icon,
				IconThemed = aq.IconThemed,
				Folder = aq.Folder,
				Resizable = aq.Resizable,
				Background = aq.Background,
				BackgroundImageTransparency = aq.BackgroundImageTransparency or 0,
				User = aq.User or {},

				Size = aq.Size,

				MinSize = aq.MinSize or Vector2.new(560, 350),
				MaxSize = aq.MaxSize or Vector2.new(850, 560),

				ToggleKey = aq.ToggleKey,
				Transparent = aq.Transparent or false,
				HideSearchBar = aq.HideSearchBar,
				ScrollBarEnabled = aq.ScrollBarEnabled or false,
				SideBarWidth = aq.SideBarWidth or 200,

				NewElements = aq.NewElements or false,
				HidePanelBackground = aq.HidePanelBackground or false,
				AutoScale = aq.AutoScale,
				OpenButton = aq.OpenButton,

				Position = UDim2.new(0.5, 0, 0.5, 0),
				IconSize = aq.IconSize or 22,
				UICorner = 16,
				UIPadding = 14,
				UIElements = {},
				CanDropdown = true,
				Closed = false,
				Parent = aq.Parent,
				Destroyed = false,
				IsFullscreen = false,
				CanResize = false,
				IsOpenButtonEnabled = true,

				ConfigManager = nil,

				CurrentTab = nil,
				TabModule = nil,

				OnOpenCallback = nil,
				OnCloseCallback = nil,
				OnDestroyCallback = nil,

				IsPC = false,

				Gap = 5,

				TopBarButtons = {},
				AllElements = {},

				ElementConfig = {},
			}

			ar.ElementConfig = {
				UIPadding = ar.NewElements and 10 or 13,
				UICorner = ar.NewElements and 23 or 12,
			}

			local as = ar.Size or UDim2.new(0, 580, 0, 460)
			ar.Size = UDim2.new(
				as.X.Scale,
				math.clamp(as.X.Offset, ar.MinSize.X, ar.MaxSize.X),
				as.Y.Scale,
				math.clamp(as.Y.Offset, ar.MinSize.Y, ar.MaxSize.Y)
			)

			if ar.HideSearchBar ~= false then
				ar.HideSearchBar = true
			end
			if ar.AutoScale ~= false then
				ar.AutoScale = true
			end
			if ar.Resizable ~= false then
				ar.CanResize = true
				ar.Resizable = true
			end

			if ar.Folder then
				makefolder("WindUI/" .. ar.Folder)
			end

			local at = aj("UICorner", {
				CornerRadius = UDim.new(0, ar.UICorner),
			})

			if ar.Folder then
				ar.ConfigManager = ap:Init(ar)
			end

			local au = aj("Frame", {
				Size = UDim2.new(0, 32, 0, 32),
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = 1,
				ZIndex = 99,
				Active = true,
			}, {
				aj("ImageLabel", {
					Size = UDim2.new(0, 96, 0, 96),
					BackgroundTransparency = 1,
					Image = "rbxassetid://120997033468887",
					Position = UDim2.new(0.5, -16, 0.5, -16),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 1,
				}),
			})
			local av = ai.NewRoundFrame(ar.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				ImageColor3 = Color3.new(0, 0, 0),
				ZIndex = 98,
				Active = false,
			}, {
				aj("ImageLabel", {
					Size = UDim2.new(0, 70, 0, 70),
					Image = ai.Icon("expand")[1],
					ImageRectOffset = ai.Icon("expand")[2].ImageRectPosition,
					ImageRectSize = ai.Icon("expand")[2].ImageRectSize,
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					ImageTransparency = 1,
				}),
			})

			local aw = ai.NewRoundFrame(ar.UICorner, "Squircle", {
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = 1,
				ImageColor3 = Color3.new(0, 0, 0),
				ZIndex = 999,
				Active = false,
			})

			ar.UIElements.SideBar = aj("ScrollingFrame", {
				Size = UDim2.new(
					1,
					ar.ScrollBarEnabled and -3 - (ar.UIPadding / 2) or 0,
					1,
					not ar.HideSearchBar and -45 or 0
				),
				Position = UDim2.new(0, 0, 1, 0),
				AnchorPoint = Vector2.new(0, 1),
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				ElasticBehavior = "Never",
				CanvasSize = UDim2.new(0, 0, 0, 0),
				AutomaticCanvasSize = "Y",
				ScrollingDirection = "Y",
				ClipsDescendants = true,
				VerticalScrollBarPosition = "Left",
			}, {
				aj("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = "Y",
					Size = UDim2.new(1, 0, 0, 0),
					Name = "Frame",
				}, {
					aj("UIPadding", {
						PaddingTop = UDim.new(0, ar.UIPadding / 2),

						PaddingBottom = UDim.new(0, ar.UIPadding / 2),
					}),
					aj("UIListLayout", {
						SortOrder = "LayoutOrder",
						Padding = UDim.new(0, ar.Gap),
					}),
				}),
				aj("UIPadding", {

					PaddingLeft = UDim.new(0, ar.UIPadding / 2),
					PaddingRight = UDim.new(0, ar.UIPadding / 2),
				}),
			})

			ar.UIElements.SideBarContainer = aj("Frame", {
				Size = UDim2.new(0, ar.SideBarWidth, 1, ar.User.Enabled and -94 - (ar.UIPadding * 2) or -52),
				Position = UDim2.new(0, 0, 0, 52),
				BackgroundTransparency = 1,
				Visible = true,
			}, {
				aj("Frame", {
					Name = "Content",
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, not ar.HideSearchBar and -45 - ar.UIPadding / 2 or 0),
					Position = UDim2.new(0, 0, 1, 0),
					AnchorPoint = Vector2.new(0, 1),
				}),
				ar.UIElements.SideBar,
			})

			if ar.ScrollBarEnabled then
				an(ar.UIElements.SideBar, ar.UIElements.SideBarContainer.Content, ar, 3)
			end

			ar.UIElements.MainBar = aj("Frame", {
				Size = UDim2.new(1, -ar.UIElements.SideBarContainer.AbsoluteSize.X, 1, -52),
				Position = UDim2.new(1, 0, 1, 0),
				AnchorPoint = Vector2.new(1, 1),
				BackgroundTransparency = 1,
			}, {
				ai.NewRoundFrame(ar.UICorner - (ar.UIPadding / 2), "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					ImageColor3 = Color3.new(1, 1, 1),
					ZIndex = 3,
					ImageTransparency = 0.95,
					Name = "Background",
					Visible = not ar.HidePanelBackground,
				}),
				aj("UIPadding", {
					PaddingTop = UDim.new(0, ar.UIPadding / 2),
					PaddingLeft = UDim.new(0, ar.UIPadding / 2),
					PaddingRight = UDim.new(0, ar.UIPadding / 2),
					PaddingBottom = UDim.new(0, ar.UIPadding / 2),
				}),
			})

			local ax = aj("ImageLabel", {
				Image = "rbxassetid://8992230677",
				ImageColor3 = Color3.new(0, 0, 0),
				ImageTransparency = 1,
				Size = UDim2.new(1, 120, 1, 116),
				Position = UDim2.new(0, -60, 0, -58),
				ScaleType = "Slice",
				SliceCenter = Rect.new(99, 99, 99, 99),
				BackgroundTransparency = 1,
				ZIndex = -999999999999999,
				Name = "Blur",
			})

			if ac.TouchEnabled and not ac.KeyboardEnabled then
				ar.IsPC = false
			elseif ac.KeyboardEnabled then
				ar.IsPC = true
			else
				ar.IsPC = nil
			end

			local ay
			if ar.User then
				local function GetUserThumb()
					local az = d:GetUserThumbnailAsync(
						ar.User.Anonymous and 1 or p.UserId,
						Enum.ThumbnailType.HeadShot,
						Enum.ThumbnailSize.Size420x420
					)
					return az
				end

				ay = aj("TextButton", {
					Size = UDim2.new(
						0,
						ar.UIElements.SideBarContainer.AbsoluteSize.X - (ar.UIPadding / 2),
						0,
						42 + ar.UIPadding
					),
					Position = UDim2.new(0, ar.UIPadding / 2, 1, -(ar.UIPadding / 2)),
					AnchorPoint = Vector2.new(0, 1),
					BackgroundTransparency = 1,
					Visible = ar.User.Enabled or false,
				}, {
					ai.NewRoundFrame(ar.UICorner - (ar.UIPadding / 2), "SquircleOutline", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Outline",
					}, {
						aj("UIGradient", {
							Rotation = 78,
							Color = ColorSequence.new({
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							}),
							Transparency = NumberSequence.new({
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}),
						}),
					}),
					ai.NewRoundFrame(ar.UICorner - (ar.UIPadding / 2), "Squircle", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "UserIcon",
					}, {
						aj("ImageLabel", {
							Image = GetUserThumb(),
							BackgroundTransparency = 1,
							Size = UDim2.new(0, 42, 0, 42),
							ThemeTag = {
								BackgroundColor3 = "Text",
							},
							BackgroundTransparency = 0.93,
						}, {
							aj("UICorner", {
								CornerRadius = UDim.new(1, 0),
							}),
						}),
						aj("Frame", {
							AutomaticSize = "XY",
							BackgroundTransparency = 1,
						}, {
							aj("TextLabel", {
								Text = ar.User.Anonymous and "Anonymous" or d.LocalPlayer.DisplayName,
								TextSize = 17,
								ThemeTag = {
									TextColor3 = "Text",
								},
								FontFace = Font.new(ai.Font, Enum.FontWeight.SemiBold),
								AutomaticSize = "Y",
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -27, 0, 0),
								TextTruncate = "AtEnd",
								TextXAlignment = "Left",
								Name = "DisplayName",
							}),
							aj("TextLabel", {
								Text = ar.User.Anonymous and "anonymous" or d.LocalPlayer.Name,
								TextSize = 15,
								TextTransparency = 0.6,
								ThemeTag = {
									TextColor3 = "Text",
								},
								FontFace = Font.new(ai.Font, Enum.FontWeight.Medium),
								AutomaticSize = "Y",
								BackgroundTransparency = 1,
								Size = UDim2.new(1, -27, 0, 0),
								TextTruncate = "AtEnd",
								TextXAlignment = "Left",
								Name = "UserName",
							}),
							aj("UIListLayout", {
								Padding = UDim.new(0, 4),
								HorizontalAlignment = "Left",
							}),
						}),
						aj("UIListLayout", {
							Padding = UDim.new(0, ar.UIPadding),
							FillDirection = "Horizontal",
							VerticalAlignment = "Center",
						}),
						aj("UIPadding", {
							PaddingLeft = UDim.new(0, ar.UIPadding / 2),
							PaddingRight = UDim.new(0, ar.UIPadding / 2),
						}),
					}),
				})

				function ar.User.Enable(az)
					ar.User.Enabled = true
					ak(
						ar.UIElements.SideBarContainer,
						0.25,
						{ Size = UDim2.new(0, ar.SideBarWidth, 1, -94 - (ar.UIPadding * 2)) },
						Enum.EasingStyle.Quint,
						Enum.EasingDirection.Out
					):Play()
					ay.Visible = true
				end
				function ar.User.Disable(az)
					ar.User.Enabled = false
					ak(
						ar.UIElements.SideBarContainer,
						0.25,
						{ Size = UDim2.new(0, ar.SideBarWidth, 1, -52) },
						Enum.EasingStyle.Quint,
						Enum.EasingDirection.Out
					):Play()
					ay.Visible = false
				end
				function ar.User.SetAnonymous(az, aA)
					if aA ~= false then
						aA = true
					end
					ar.User.Anonymous = aA
					ay.UserIcon.ImageLabel.Image = GetUserThumb()
					ay.UserIcon.Frame.DisplayName.Text = aA and "Anonymous" or d.LocalPlayer.DisplayName
					ay.UserIcon.Frame.UserName.Text = aA and "anonymous" or d.LocalPlayer.Name
				end

				if ar.User.Enabled then
					ar.User:Enable()
				else
					ar.User:Disable()
				end

				if ar.User.Callback then
					ai.AddSignal(ay.MouseButton1Click, function()
						ar.User.Callback()
					end)
					ai.AddSignal(ay.MouseEnter, function()
						ak(ay.UserIcon, 0.04, { ImageTransparency = 0.95 }):Play()
						ak(ay.Outline, 0.04, { ImageTransparency = 0.85 }):Play()
					end)
					ai.AddSignal(ay.InputEnded, function()
						ak(ay.UserIcon, 0.04, { ImageTransparency = 1 }):Play()
						ak(ay.Outline, 0.04, { ImageTransparency = 1 }):Play()
					end)
				end
			end

			local az
			local aA

			local aB = false
			local aC

			local aD = typeof(ar.Background) == "string" and string.match(ar.Background, "^video:(.+)") or nil
			local aE = typeof(ar.Background) == "string" and not aD and string.match(ar.Background, "^https?://.+")
				or nil

			local function SanitizeFilename(aF)
				aF = aF:gsub('[%s/\\:*?"<>|]+', "-")
				aF = aF:gsub("[^%w%-_%.]", "")
				return aF
			end

			if typeof(ar.Background) == "string" and aD then
				aB = true

				if string.find(aD, "http") then
					local aF = ar.Folder .. "/Assets/." .. SanitizeFilename(aD) .. ".webm"
					if not isfile(aF) then
						local aG, aH = pcall(function()
							local aG = ai.Request({ Url = aD, Method = "GET" })
							writefile(aF, aG.Body)
						end)
						if not aG then
							warn("[ Window.Background ] Failed to download video: " .. tostring(aH))
							return
						end
					end

					local aG, aH = pcall(function()
						return getcustomasset(aF)
					end)
					if not aG then
						warn("[ Window.Background ] Failed to load custom asset: " .. tostring(aH))
						return
					end
					aD = aH
				end

				aC = aj("VideoFrame", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Video = aD,
					Looped = true,
					Volume = 0,
				}, {
					aj("UICorner", {
						CornerRadius = UDim.new(0, ar.UICorner),
					}),
				})
				aC:Play()
			elseif aE then
				local aF = ar.Folder .. "/Assets/." .. SanitizeFilename(aE) .. ".png"
				if not isfile(aF) then
					local aG, aH = pcall(function()
						local aG = ai.Request({ Url = aE, Method = "GET" })
						writefile(aF, aG.Body)
					end)
					if not aG then
						warn("[ Window.Background ] Failed to download image: " .. tostring(aH))
						return
					end
				end

				local aG, aH = pcall(function()
					return getcustomasset(aF)
				end)
				if not aG then
					warn("[ Window.Background ] Failed to load custom asset: " .. tostring(aH))
					return
				end

				aC = aj("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = aH,
					ImageTransparency = 0,
					ScaleType = "Crop",
				}, {
					aj("UICorner", {
						CornerRadius = UDim.new(0, ar.UICorner),
					}),
				})
			elseif ar.Background then
				aC = aj("ImageLabel", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 1, 0),
					Image = typeof(ar.Background) == "string" and ar.Background or "",
					ImageTransparency = 1,
					ScaleType = "Crop",
				}, {
					aj("UICorner", {
						CornerRadius = UDim.new(0, ar.UICorner),
					}),
				})
			end

			local aF = ai.NewRoundFrame(99, "Squircle", {
				ImageTransparency = 0.8,
				ImageColor3 = Color3.new(1, 1, 1),
				Size = UDim2.new(0, 0, 0, 4),
				Position = UDim2.new(0.5, 0, 1, 4),
				AnchorPoint = Vector2.new(0.5, 0),
			}, {
				aj("TextButton", {
					Size = UDim2.new(1, 12, 1, 12),
					BackgroundTransparency = 1,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Active = true,
					ZIndex = 99,
					Name = "Frame",
				}),
			})

			function createAuthor(aG)
				return aj("TextLabel", {
					Text = aG,
					FontFace = Font.new(ai.Font, Enum.FontWeight.Medium),
					BackgroundTransparency = 1,
					TextTransparency = 0.35,
					AutomaticSize = "XY",
					Parent = ar.UIElements.Main and ar.UIElements.Main.Main.Topbar.Left.Title,
					TextXAlignment = "Left",
					TextSize = 13,
					LayoutOrder = 2,
					ThemeTag = {
						TextColor3 = "Text",
					},
					Name = "Author",
				})
			end

			local aG
			local aH

			if ar.Author then
				aG = createAuthor(ar.Author)
			end

			local aI = aj("TextLabel", {
				Text = ar.Title,
				FontFace = Font.new(ai.Font, Enum.FontWeight.SemiBold),
				BackgroundTransparency = 1,
				AutomaticSize = "XY",
				Name = "Title",
				TextXAlignment = "Left",
				TextSize = 16,
				ThemeTag = {
					TextColor3 = "Text",
				},
			})

			ar.UIElements.Main = aj("Frame", {
				Size = ar.Size,
				Position = ar.Position,
				BackgroundTransparency = 1,
				Parent = aq.Parent,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Active = true,
			}, {

				ax,
				ai.NewRoundFrame(ar.UICorner, "Squircle", {
					ImageTransparency = 1,
					Size = UDim2.new(1, 0, 1, -240),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Name = "Background",
					ThemeTag = {
						ImageColor3 = "Background",
					},
				}, {
					aC,
					aF,
					au,
				}),
				UIStroke,
				at,
				av,
				aw,
				aj("Frame", {
					Size = UDim2.new(1, 0, 1, 0),
					BackgroundTransparency = 1,
					Name = "Main",

					Visible = false,
					ZIndex = 97,
				}, {
					aj("UICorner", {
						CornerRadius = UDim.new(0, ar.UICorner),
					}),
					ar.UIElements.SideBarContainer,
					ar.UIElements.MainBar,

					ay,

					aA,
					aj("Frame", {
						Size = UDim2.new(1, 0, 0, 52),
						BackgroundTransparency = 1,
						BackgroundColor3 = Color3.fromRGB(50, 50, 50),
						Name = "Topbar",
					}, {
						az,

						aj("Frame", {
							AutomaticSize = "X",
							Size = UDim2.new(0, 0, 1, 0),
							BackgroundTransparency = 1,
							Name = "Left",
						}, {
							aj("UIListLayout", {
								Padding = UDim.new(0, ar.UIPadding + 4),
								SortOrder = "LayoutOrder",
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
							}),
							aj("Frame", {
								AutomaticSize = "XY",
								BackgroundTransparency = 1,
								Name = "Title",
								Size = UDim2.new(0, 0, 1, 0),
								LayoutOrder = 2,
							}, {
								aj("UIListLayout", {
									Padding = UDim.new(0, 0),
									SortOrder = "LayoutOrder",
									FillDirection = "Vertical",
									VerticalAlignment = "Center",
								}),
								aI,
								aG,
							}),
							aj("UIPadding", {
								PaddingLeft = UDim.new(0, 4),
							}),
						}),
						aj("ScrollingFrame", {
							Name = "Center",
							BackgroundTransparency = 1,
							AutomaticSize = "Y",
							ScrollBarThickness = 0,
							ScrollingDirection = "X",
							AutomaticCanvasSize = "X",
							CanvasSize = UDim2.new(0, 0, 0, 0),
							Size = UDim2.new(0, 0, 1, 0),
							AnchorPoint = Vector2.new(0, 0.5),
							Position = UDim2.new(0, 0, 0.5, 0),
							Visible = false,
						}, {
							aj("UIListLayout", {
								FillDirection = "Horizontal",
								VerticalAlignment = "Center",
								HorizontalAlignment = "Left",
								Padding = UDim.new(0, ar.UIPadding / 2),
							}),
						}),
						aj("Frame", {
							AutomaticSize = "XY",
							BackgroundTransparency = 1,
							Position = UDim2.new(1, 0, 0.5, 0),
							AnchorPoint = Vector2.new(1, 0.5),
							Name = "Right",
						}, {
							aj("UIListLayout", {
								Padding = UDim.new(0, 9),
								FillDirection = "Horizontal",
								SortOrder = "LayoutOrder",
							}),
						}),
						aj("UIPadding", {
							PaddingTop = UDim.new(0, ar.UIPadding),
							PaddingLeft = UDim.new(0, ar.UIPadding),
							PaddingRight = UDim.new(0, 8),
							PaddingBottom = UDim.new(0, ar.UIPadding),
						}),
					}),
				}),
			})

			ai.AddSignal(ar.UIElements.Main.Main.Topbar.Left:GetPropertyChangedSignal("AbsoluteSize"), function()
				local aJ = 0
				local aK = ar.UIElements.Main.Main.Topbar.Right.UIListLayout.AbsoluteContentSize.X
				if aI and aG then
					aJ = math.max(aI.TextBounds.X, aG.TextBounds.X)
				else
					aJ = aI.TextBounds.X
				end
				if aH then
					aJ = aJ + ar.IconSize + ar.UIPadding + 4
				end
				ar.UIElements.Main.Main.Topbar.Center.Position = UDim2.new(0, aJ + ar.UIPadding, 0.5, 0)
				ar.UIElements.Main.Main.Topbar.Center.Size = UDim2.new(1, -aJ - aK - (ar.UIPadding * 2), 1, 0)
			end)

			function ar.CreateTopbarButton(aJ, aK, aL, aM, aN, aO)
				local aP = ai.Image(aL, aL, 0, ar.Folder, "TopbarIcon", true, aO)
				aP.Size = UDim2.new(0, 16, 0, 16)
				aP.AnchorPoint = Vector2.new(0.5, 0.5)
				aP.Position = UDim2.new(0.5, 0, 0.5, 0)

				local aQ = ai.NewRoundFrame(9, "Squircle", {
					Size = UDim2.new(0, 36, 0, 36),
					LayoutOrder = aN or 999,
					Parent = ar.UIElements.Main.Main.Topbar.Right,

					ZIndex = 9999,
					ThemeTag = {
						ImageColor3 = "Text",
					},
					ImageTransparency = 1,
				}, {
					ai.NewRoundFrame(9, "SquircleOutline", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Text",
						},
						ImageTransparency = 1,
						Name = "Outline",
					}, {
						aj("UIGradient", {
							Rotation = 45,
							Color = ColorSequence.new({
								ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
								ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 255, 255)),
							}),
							Transparency = NumberSequence.new({
								NumberSequenceKeypoint.new(0.0, 0.1),
								NumberSequenceKeypoint.new(0.5, 1),
								NumberSequenceKeypoint.new(1.0, 0.1),
							}),
						}),
					}),
					aP,
				}, true)

				ar.TopBarButtons[100 - aN] = {
					Name = aK,
					Object = aQ,
				}

				ai.AddSignal(aQ.MouseButton1Click, function()
					aM()
				end)
				ai.AddSignal(aQ.MouseEnter, function()
					ak(aQ, 0.15, { ImageTransparency = 0.93 }):Play()
					ak(aQ.Outline, 0.15, { ImageTransparency = 0.75 }):Play()
				end)
				ai.AddSignal(aQ.MouseLeave, function()
					ak(aQ, 0.1, { ImageTransparency = 1 }):Play()
					ak(aQ.Outline, 0.1, { ImageTransparency = 1 }):Play()
				end)

				return aQ
			end

			local aJ = ai.Drag(ar.UIElements.Main, { ar.UIElements.Main.Main.Topbar, aF.Frame }, function(aJ, aK)
				if not ar.Closed then
					if aJ and aK == aF.Frame then
						ak(aF, 0.1, { ImageTransparency = 0.35 }):Play()
					else
						ak(aF, 0.2, { ImageTransparency = 0.8 }):Play()
					end
					ar.Position = ar.UIElements.Main.Position
					ar.Dragging = aJ
				end
			end)

			if not aB and ar.Background and typeof(ar.Background) == "table" then
				local aK = aj("UIGradient")
				for aL, aM in next, ar.Background do
					aK[aL] = aM
				end

				ar.UIElements.BackgroundGradient = ai.NewRoundFrame(ar.UICorner, "Squircle", {
					Size = UDim2.new(1, 0, 1, 0),
					Parent = ar.UIElements.Main.Background,
					ImageTransparency = ar.Transparent and aq.WindUI.TransparencyValue or 0,
				}, {
					aK,
				})
			end

			ar.OpenButtonMain = z.load("w").New(ar)

			task.spawn(function()
				if ar.Icon then
					aH = ai.Image(ar.Icon, ar.Title, 0, ar.Folder, "Window", true, ar.IconThemed)
					aH.Parent = ar.UIElements.Main.Main.Topbar.Left
					aH.Size = UDim2.new(0, ar.IconSize, 0, ar.IconSize)

					ar.OpenButtonMain:SetIcon(ar.Icon)
				else
					ar.OpenButtonMain:SetIcon(ar.Icon)
				end
			end)

			local function AddDraggableMenu(aK, aL)
				local aM = ai.New("Frame", {
					AutomaticSize = "Y",
					Position = UDim2.fromOffset(6, 6),
					Size = UDim2.fromOffset(0, 0),
					BackgroundTransparency = 1,
					Parent = aL,
					ZIndex = 999,
				}, {
					ai.NewRoundFrame(ar.UICorner, "SquircleOutline", {
						Size = UDim2.new(1, 0, 1, 0),
						ThemeTag = {
							ImageColor3 = "Outline",
						},
					}),
				})
				ai.AddThemeObject(aM, { BackgroundColor3 = "Background" })

				local aN = ai.New("Frame", {
					Position = UDim2.fromOffset(2, 2),
					Size = UDim2.new(1, -4, 1, -4),
					ThemeTag = {
						BackgroundColor3 = "Background",
					},
					Parent = aM,
				}, {
					ai.New("UICorner", {
						CornerRadius = UDim.new(0, ar.UICorner - 1),
					}),
					ai.New("Frame", {
						Position = UDim2.fromOffset(0, 34),
						Size = UDim2.new(1, 0, 0, 1),
						ThemeTag = {
							BackgroundColor3 = "Text",
						},
					}),
				})

				local aO = ai.New("TextLabel", {
					Size = UDim2.new(1, 0, 0, 34),
					Text = aK,
					TextXAlignment = "Left",
					TextSize = 15,
					FontFace = Font.new(ai.Font, Enum.FontWeight.Medium),
					ThemeTag = {
						TextColor3 = "Text",
					},
					BackgroundTransparency = 1,
					Parent = aN,
				}, {
					ai.New("UIPadding", {
						PaddingLeft = UDim.new(0, 12),
						PaddingRight = UDim.new(0, 12),
					}),
				})

				local aP = ai.New("Frame", {
					Position = UDim2.fromOffset(0, 35),
					Size = UDim2.new(1, 0, 1, -35),
					BackgroundTransparency = 1,
					Parent = aN,
				}, {
					ai.New("UIListLayout", {
						Padding = UDim.new(0, 7),
					}),
					ai.New("UIPadding", {
						PaddingBottom = UDim.new(0, 7),
						PaddingLeft = UDim.new(0, 7),
						PaddingRight = UDim.new(0, 7),
						PaddingTop = UDim.new(0, 7),
					}),
				})

				ai.Drag(aM, { aO }, nil)

				return aM, aP, aO
			end

			ar.KeybindFrame, ar.KeybindContainer, ar.KeybindLabel = AddDraggableMenu("Keybinds", ar.UIElements.Main)
			ar.KeybindFrame.AnchorPoint = Vector2.new(0, 0.5)
			ar.KeybindFrame.Position = UDim2.new(0, 6, 0.5, 0)
			ar.KeybindFrame.Visible = false
			ar.KeybindFrame.AutomaticSize = "Y"

			local aK = ai.New("TextButton", {
				Size = UDim2.new(0, 20, 0, 20),
				Position = UDim2.new(1, -12, 0, 7),
				AnchorPoint = Vector2.new(1, 0),
				BackgroundTransparency = 1,
				Text = "x",
				TextYAlignment = Enum.TextYAlignment.Center,
				Parent = ar.KeybindLabel,
			}, {
				ai.Image("x", "close", 0, ar.Folder, "KeybindClose", true),
				ai.New("UICorner", {
					CornerRadius = UDim.new(0, 10),
				}),
			})

			ai.AddSignal(aK.MouseButton1Click, function()
				ar.KeybindFrame.Visible = false
			end)

			function ar.AddKeybind(aL, aM, aN, aO)
				local aP = ai.New("Frame", {
					Size = UDim2.new(1, 0, 0, 20),
					BackgroundTransparency = 1,
					Parent = ar.KeybindContainer,
				}, {
					ai.New("TextLabel", {
						Size = UDim2.new(1, -60, 1, 0),
						BackgroundTransparency = 1,
						Text = aM,
						TextXAlignment = "Left",
						TextSize = 14,
						FontFace = Font.new(ai.Font, Enum.FontWeight.Medium),
						ThemeTag = {
							TextColor3 = "Text",
						},
					}),
					ai.New("TextButton", {
						Size = UDim2.new(0, 50, 1, 0),
						Position = UDim2.new(1, -50, 0, 0),
						BackgroundTransparency = 1,
						Text = aN or "None",
						TextSize = 12,
						FontFace = Font.new(ai.Font, Enum.FontWeight.SemiBold),
						ThemeTag = {
							TextColor3 = "Accent",
						},
					}),
				})

				ai.AddSignal(aP.TextButton.MouseButton1Click, function()
					if aO then
						aO()
					end
				end)

				ar.KeybindFrame.Size = UDim2.new(0, 300, 0, ar.KeybindFrame.AbsoluteSize.Y + 18)
			end

			shared.KEYBIND_FRAME_WIND_UI_ADD_KEYBIND_FUNCTION = function(aL, aM, aN)
				ar:AddKeybind(aL, aM, aN)
			end

			function ar.SetToggleKey(aL, aM)
				ar.ToggleKey = aM
			end

			function ar.SetTitle(aL, aM)
				ar.Title = aM
				aI.Text = aM
			end

			function ar.SetAuthor(aL, aM)
				ar.Author = aM
				if not aG then
					aG = createAuthor(ar.Author)
				end

				aG.Text = aM
			end

			function ar.SetBackgroundImage(aL, aM)
				ar.UIElements.Main.Background.ImageLabel.Image = aM
			end
			function ar.SetBackgroundImageTransparency(aL, aM)
				if aC and aC:IsA("ImageLabel") then
					aC.ImageTransparency = math.floor(aM + 0.5)
				end
				ar.BackgroundImageTransparency = math.floor(aM + 0.5)
			end
			function ar.SetBackgroundTransparency(aL, aM)
				WindUI.TransparencyValue = math.floor(tonumber(aM) + 0.5)
				ar:ToggleTransparency(math.floor(tonumber(aM) + 0.5) > 0)
			end

			local aL
			local aM
			ai.Icon("minimize")
			ai.Icon("maximize")

			ar:CreateTopbarButton("Fullscreen", "maximize", function()
				ar:ToggleFullscreen()
			end, 998)

			function ar.ToggleFullscreen(aN)
				local aO = ar.IsFullscreen

				aJ:Set(aO)

				if not aO then
					aL = ar.UIElements.Main.Position
					aM = ar.UIElements.Main.Size

					ar.CanResize = false
				else
					if ar.Resizable then
						ar.CanResize = true
					end
				end

				ak(
					ar.UIElements.Main,
					0.45,
					{ Size = aO and aM or UDim2.new(1, -20, 1, -72) },
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				):Play()

				ak(
					ar.UIElements.Main,
					0.45,
					{ Position = aO and aL or UDim2.new(0.5, 0, 0.5, 26) },
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				):Play()

				ar.IsFullscreen = not aO
			end

			ar:CreateTopbarButton("Minimize", "minus", function()
				ar:Close()
				task.spawn(function()
					task.wait(0.3)
					if not ar.IsPC and ar.IsOpenButtonEnabled then
						ar.OpenButtonMain:Visible(true)
					end
				end)
			end, 997)

			function ar.OnOpen(aN, aO)
				ar.OnOpenCallback = aO
			end
			function ar.OnClose(aN, aO)
				ar.OnCloseCallback = aO
			end
			function ar.OnDestroy(aN, aO)
				ar.OnDestroyCallback = aO
			end

			function ar.SetIconSize(aN, aO)
				local aP
				if typeof(aO) == "number" then
					aP = UDim2.new(0, aO, 0, aO)
					ar.IconSize = aO
				elseif typeof(aO) == "UDim2" then
					aP = aO
					ar.IconSize = aO.X.Offset
				end

				if aH then
					aH.Size = aP
				end
			end

			function ar.Open(aN)
				task.spawn(function()
					if ar.OnOpenCallback then
						task.spawn(function()
							ai.SafeCallback(ar.OnOpenCallback)
						end)
					end

					task.wait(0.06)
					ar.Closed = false

					ak(ar.UIElements.Main.Background, 0.2, {
						ImageTransparency = ar.Transparent and aq.WindUI.TransparencyValue or 0,
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()

					if ar.UIElements.BackgroundGradient then
						ak(ar.UIElements.BackgroundGradient, 0.2, {
							ImageTransparency = 0,
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end

					ak(ar.UIElements.Main.Background, 0.4, {
						Size = UDim2.new(1, 0, 1, 0),
					}, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out):Play()

					if aC then
						if aC:IsA("VideoFrame") then
							aC.Visible = true
						else
							ak(aC, 0.2, {
								ImageTransparency = ar.BackgroundImageTransparency,
							}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
						end
					end

					ak(ax, 0.25, { ImageTransparency = 0.7 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					if UIStroke then
						ak(UIStroke, 0.25, { Transparency = 0.8 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end

					task.spawn(function()
						task.wait(0.3)
						ak(
							aF,
							0.45,
							{ Size = UDim2.new(0, 200, 0, 4), ImageTransparency = 0.8 },
							Enum.EasingStyle.Exponential,
							Enum.EasingDirection.Out
						):Play()
						aJ:Set(true)
						task.wait(0.45)
						if ar.Resizable then
							ak(
								au.ImageLabel,
								0.45,
								{ ImageTransparency = 0.8 },
								Enum.EasingStyle.Exponential,
								Enum.EasingDirection.Out
							):Play()
							ar.CanResize = true
						end
					end)

					ar.CanDropdown = true

					ar.UIElements.Main.Visible = true
					task.spawn(function()
						task.wait(0.05)
						ar.UIElements.Main:WaitForChild("Main").Visible = true
					end)
				end)
			end
			function ar.Close(aN)
				local aO = {}

				if ar.OnCloseCallback then
					task.spawn(function()
						ai.SafeCallback(ar.OnCloseCallback)
					end)
				end

				ar.UIElements.Main:WaitForChild("Main").Visible = false

				ar.CanDropdown = false
				ar.Closed = true

				ak(ar.UIElements.Main.Background, 0.32, {
					ImageTransparency = 1,
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
				if ar.UIElements.BackgroundGradient then
					ak(ar.UIElements.BackgroundGradient, 0.32, {
						ImageTransparency = 1,
					}, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut):Play()
				end

				ak(ar.UIElements.Main.Background, 0.4, {
					Size = UDim2.new(1, 0, 1, -240),
				}, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut):Play()

				if aC then
					if aC:IsA("VideoFrame") then
						aC.Visible = false
					else
						ak(aC, 0.3, {
							ImageTransparency = 1,
						}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
					end
				end
				ak(ax, 0.25, { ImageTransparency = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				if UIStroke then
					ak(UIStroke, 0.25, { Transparency = 1 }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				end

				ak(
					aF,
					0.3,
					{ Size = UDim2.new(0, 0, 0, 4), ImageTransparency = 1 },
					Enum.EasingStyle.Exponential,
					Enum.EasingDirection.InOut
				):Play()
				ak(
					au.ImageLabel,
					0.3,
					{ ImageTransparency = 1 },
					Enum.EasingStyle.Exponential,
					Enum.EasingDirection.Out
				):Play()
				aJ:Set(false)
				ar.CanResize = false

				task.spawn(function()
					task.wait(0.4)
					ar.UIElements.Main.Visible = false
				end)

				function aO.Destroy(aP)
					if ar.OnDestroyCallback then
						task.spawn(function()
							ai.SafeCallback(ar.OnDestroyCallback)
						end)
					end

					ar.Destroyed = true
					task.wait(0.4)
					aq.WindUI.ScreenGui:Destroy()
					aq.WindUI.NotificationGui:Destroy()
					aq.WindUI.DropdownGui:Destroy()
				end

				return aO
			end
			function ar.Destroy(aN)
				return ar:Close():Destroy()
			end
			function ar.Toggle(aN)
				if ar.Closed then
					ar:Open()
				else
					ar:Close()
				end
			end

			function ar.ToggleTransparency(aN, aO)
				ar.Transparent = aO
				aq.WindUI.Transparent = aO

				ar.UIElements.Main.Background.ImageTransparency = aO and aq.WindUI.TransparencyValue or 0

				ar.UIElements.MainBar.Background.ImageTransparency = aO and 0.97 or 0.95
			end

			function ar.LockAll(aN)
				for aO, aP in next, ar.AllElements do
					if aP.Lock then
						aP:Lock()
					end
				end
			end
			function ar.UnlockAll(aN)
				for aO, aP in next, ar.AllElements do
					if aP.Unlock then
						aP:Unlock()
					end
				end
			end
			function ar.GetLocked(aN)
				local aO = {}

				for aP, aQ in next, ar.AllElements do
					if aQ.Locked then
						table.insert(aO, aQ)
					end
				end

				return aO
			end
			function ar.GetUnlocked(aN)
				local aO = {}

				for aP, aQ in next, ar.AllElements do
					if aQ.Locked == false then
						table.insert(aO, aQ)
					end
				end

				return aO
			end

			function ar.GetUIScale(aN, aO)
				return aq.WindUI.UIScale
			end

			function ar.SetUIScale(aN, aO)
				aq.WindUI.UIScale = aO
				ak(aq.WindUI.ScreenGui.UIScale, 0.2, { Scale = aO }, Enum.EasingStyle.Quint, Enum.EasingDirection.Out):Play()
				return ar
			end

			function ar.SetToTheCenter(aN)
				ak(
					ar.UIElements.Main,
					0.45,
					{ Position = UDim2.new(0.5, 0, 0.5, 0) },
					Enum.EasingStyle.Quint,
					Enum.EasingDirection.Out
				):Play()
				return ar
			end

			do
				local aN = 40
				local aO = ae.ViewportSize
				local aP = ar.UIElements.Main.AbsoluteSize

				if not ar.IsFullscreen and ar.AutoScale then
					local aQ = aO.X - (aN * 2)
					local A = aO.Y - (aN * 2)

					local C = aQ / aP.X
					local F = A / aP.Y

					local G = math.min(C, F)

					local H = 0.3
					local J = 1.0

					local L = math.clamp(G, H, J)

					local M = ar:GetUIScale() or 1
					local N = 0.05

					if math.abs(L - M) > N then
						ar:SetUIScale(L)
					end
				end
			end

			if ar.OpenButtonMain and ar.OpenButtonMain.Button then
				ai.AddSignal(ar.OpenButtonMain.Button.TextButton.MouseButton1Click, function()
					ar.OpenButtonMain:Visible(false)
					ar:Open()
				end)
			end

			ai.AddSignal(ac.InputBegan, function(aN, aO)
				if aO then
					return
				end

				if ar.ToggleKey then
					if aN.KeyCode == ar.ToggleKey then
						ar:Toggle()
					end
				end
			end)

			task.spawn(function()
				ar:Open()
			end)

			function ar.EditOpenButton(aN, aO)
				return ar.OpenButtonMain:Edit(aO)
			end

			if ar.OpenButton and typeof(ar.OpenButton) == "table" then
				ar:EditOpenButton(ar.OpenButton)
			end

			local aN = z.load("S")
			local aO = z.load("T")
			local aP = aN.Init(ar, aq.WindUI, aq.Parent.Parent.ToolTips)
			aP:OnChange(function(aQ)
				ar.CurrentTab = aQ
			end)

			ar.TabModule = aN

			function ar.Tab(aQ, A)
				A.Parent = ar.UIElements.SideBar.Frame
				return aP.New(A, aq.WindUI.UIScale)
			end

			function ar.SelectTab(aQ, A)
				aP:SelectTab(A)
			end

			function ar.Section(aQ, A)
				return aO.New(A, ar.UIElements.SideBar.Frame, ar.Folder, aq.WindUI.UIScale, ar)
			end

			function ar.IsResizable(aQ, A)
				ar.Resizable = A
				ar.CanResize = A
			end

			function ar.Divider(aQ)
				local A = aj("Frame", {
					Size = UDim2.new(1, 0, 0, 1),
					Position = UDim2.new(0.5, 0, 0, 0),
					AnchorPoint = Vector2.new(0.5, 0),
					BackgroundTransparency = 0.9,
					ThemeTag = {
						BackgroundColor3 = "Text",
					},
				})
				local C = aj("Frame", {
					Parent = ar.UIElements.SideBar.Frame,

					Size = UDim2.new(1, -7, 0, 5),
					BackgroundTransparency = 1,
				}, {
					A,
				})

				return C
			end

			local aQ = z.load("k").Init(ar, nil)
			function ar.Dialog(A, C)
				local F = {
					Title = C.Title or "Dialog",
					Width = C.Width or 320,
					Content = C.Content,
					Buttons = C.Buttons or {},

					TextPadding = 10,
				}
				local G = aQ.Create(false)

				G.UIElements.Main.Size = UDim2.new(0, F.Width, 0, 0)

				local H = aj("Frame", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = "Y",
					BackgroundTransparency = 1,
					Parent = G.UIElements.Main,
				}, {
					aj("UIListLayout", {
						FillDirection = "Horizontal",
						Padding = UDim.new(0, G.UIPadding),
						VerticalAlignment = "Center",
					}),
					aj("UIPadding", {
						PaddingTop = UDim.new(0, F.TextPadding / 2),
						PaddingLeft = UDim.new(0, F.TextPadding / 2),
						PaddingRight = UDim.new(0, F.TextPadding / 2),
					}),
				})

				local J
				if C.Icon then
					J = ai.Image(C.Icon, F.Title .. ":" .. C.Icon, 0, ar, "Dialog", true, C.IconThemed)
					J.Size = UDim2.new(0, 22, 0, 22)
					J.Parent = H
				end

				G.UIElements.UIListLayout = aj("UIListLayout", {
					Padding = UDim.new(0, 12),
					FillDirection = "Vertical",
					HorizontalAlignment = "Left",
					Parent = G.UIElements.Main,
				})

				aj("UISizeConstraint", {
					MinSize = Vector2.new(180, 20),
					MaxSize = Vector2.new(400, math.huge),
					Parent = G.UIElements.Main,
				})

				G.UIElements.Title = aj("TextLabel", {
					Text = F.Title,
					TextSize = 20,
					FontFace = Font.new(ai.Font, Enum.FontWeight.SemiBold),
					TextXAlignment = "Left",
					TextWrapped = true,
					RichText = true,
					Size = UDim2.new(1, J and -26 - G.UIPadding or 0, 0, 0),
					AutomaticSize = "Y",
					ThemeTag = {
						TextColor3 = "Text",
					},
					BackgroundTransparency = 1,
					Parent = H,
				})
				if F.Content then
					aj("TextLabel", {
						Text = F.Content,
						TextSize = 18,
						TextTransparency = 0.4,
						TextWrapped = true,
						RichText = true,
						FontFace = Font.new(ai.Font, Enum.FontWeight.Medium),
						TextXAlignment = "Left",
						Size = UDim2.new(1, 0, 0, 0),
						AutomaticSize = "Y",
						LayoutOrder = 2,
						ThemeTag = {
							TextColor3 = "Text",
						},
						BackgroundTransparency = 1,
						Parent = G.UIElements.Main,
					}, {
						aj("UIPadding", {
							PaddingLeft = UDim.new(0, F.TextPadding / 2),
							PaddingRight = UDim.new(0, F.TextPadding / 2),
							PaddingBottom = UDim.new(0, F.TextPadding / 2),
						}),
					})
				end

				local L = aj("UIListLayout", {
					Padding = UDim.new(0, 6),
					FillDirection = "Horizontal",
					HorizontalAlignment = "Right",
				})

				local M = aj("Frame", {
					Size = UDim2.new(1, 0, 0, 40),
					AutomaticSize = "None",
					BackgroundTransparency = 1,
					Parent = G.UIElements.Main,
					LayoutOrder = 4,
				}, {
					L,
				})

				local N = {}

				for O, P in next, F.Buttons do
					local Q = am(P.Title, P.Icon, P.Callback, P.Variant, M, G, false)
					table.insert(N, Q)
				end

				local function CheckButtonsOverflow()
					L.FillDirection = Enum.FillDirection.Horizontal
					L.HorizontalAlignment = Enum.HorizontalAlignment.Right
					L.VerticalAlignment = Enum.VerticalAlignment.Center
					M.AutomaticSize = Enum.AutomaticSize.None

					for O, P in ipairs(N) do
						P.Size = UDim2.new(0, 0, 1, 0)
						P.AutomaticSize = Enum.AutomaticSize.X
					end

					wait()

					local O = L.AbsoluteContentSize.X / aq.WindUI.UIScale
					local P = M.AbsoluteSize.X / aq.WindUI.UIScale

					if O > P then
						L.FillDirection = Enum.FillDirection.Vertical
						L.HorizontalAlignment = Enum.HorizontalAlignment.Right
						L.VerticalAlignment = Enum.VerticalAlignment.Bottom
						M.AutomaticSize = Enum.AutomaticSize.Y

						for Q, R in ipairs(N) do
							R.Size = UDim2.new(1, 0, 0, 40)
							R.AutomaticSize = Enum.AutomaticSize.None
						end
					else
						local Q = P - O
						if Q > 0 then
							local R
							local S = math.huge

							for T, U in ipairs(N) do
								local V = U.AbsoluteSize.X / aq.WindUI.UIScale
								if V < S then
									S = V
									R = U
								end
							end

							if R then
								R.Size = UDim2.new(0, S + Q, 1, 0)
								R.AutomaticSize = Enum.AutomaticSize.None
							end
						end
					end
				end

				ai.AddSignal(G.UIElements.Main:GetPropertyChangedSignal("AbsoluteSize"), CheckButtonsOverflow)
				CheckButtonsOverflow()

				wait()
				G:Open()

				return G
			end

			ar:CreateTopbarButton("Close", "x", function()
				ar:SetToTheCenter()
				ar:Dialog({

					Title = "Close Window",
					Content = "Do you want to close this window? You will not be able to open it again.",
					Buttons = {
						{
							Title = "Cancel",

							Callback = function() end,
							Variant = "Secondary",
						},
						{
							Title = "Close Window",

							Callback = function()
								ar:Close():Destroy()
							end,
							Variant = "Primary",
						},
					},
				})
			end, 999)

			function ar.Tag(A, C)
				if ar.UIElements.Main.Main.Topbar.Center.Visible == false then
					ar.UIElements.Main.Main.Topbar.Center.Visible = true
				end
				return ao:New(C, ar.UIElements.Main.Main.Topbar.Center)
			end

			local function startResizing(A)
				if ar.CanResize then
					isResizing = true
					av.Active = true
					initialSize = ar.UIElements.Main.Size
					initialInputPosition = A.Position

					ak(au.ImageLabel, 0.1, { ImageTransparency = 0.35 }):Play()

					ai.AddSignal(A.Changed, function()
						if A.UserInputState == Enum.UserInputState.End then
							isResizing = false
							av.Active = false

							ak(au.ImageLabel, 0.17, { ImageTransparency = 0.8 }):Play()
						end
					end)
				end
			end

			ai.AddSignal(au.InputBegan, function(A)
				if
					A.UserInputType == Enum.UserInputType.MouseButton1
					or A.UserInputType == Enum.UserInputType.Touch
				then
					if ar.CanResize then
						startResizing(A)
					end
				end
			end)

			ai.AddSignal(ac.InputChanged, function(A)
				if
					A.UserInputType == Enum.UserInputType.MouseMovement
					or A.UserInputType == Enum.UserInputType.Touch
				then
					if isResizing and ar.CanResize then
						local C = A.Position - initialInputPosition
						local F = UDim2.new(0, initialSize.X.Offset + C.X * 2, 0, initialSize.Y.Offset + C.Y * 2)

						F = UDim2.new(
							F.X.Scale,
							math.clamp(F.X.Offset, ar.MinSize.X, ar.MaxSize.X),
							F.Y.Scale,
							math.clamp(F.Y.Offset, ar.MinSize.Y, ar.MaxSize.Y)
						)

						ak(ar.UIElements.Main, 0, {
							Size = F,
						}):Play()

						ar.Size = F
					end
				end
			end)

			local A = 0
			local C = 0.4
			local F
			local G = 0

			function onDoubleClick()
				ar:SetToTheCenter()
			end

			aF.Frame.MouseButton1Up:Connect(function()
				local H = tick()
				local J = ar.Position

				G = G + 1

				if G == 1 then
					A = H
					F = J

					task.spawn(function()
						task.wait(C)
						if G == 1 then
							G = 0
							F = nil
						end
					end)
				elseif G == 2 then
					if H - A <= C and J == F then
						onDoubleClick()
					end

					G = 0
					F = nil
					A = 0
				else
					G = 1
					A = H
					F = J
				end
			end)

			if not ar.HideSearchBar then
				local H = z.load("V")
				local J = false

				local L = al("Search", "search", ar.UIElements.SideBarContainer, true)
				L.Size = UDim2.new(1, -ar.UIPadding / 2, 0, 39)
				L.Position = UDim2.new(0, ar.UIPadding / 2, 0, ar.UIPadding / 2)

				ai.AddSignal(L.MouseButton1Click, function()
					if J then
						return
					end

					H.new(ar.TabModule, ar.UIElements.Main, function()
						J = false
						if ar.Resizable then
							ar.CanResize = true
						end

						ak(aw, 0.1, { ImageTransparency = 1 }):Play()
						aw.Active = false
					end)
					ak(aw, 0.1, { ImageTransparency = 0.65 }):Play()
					aw.Active = true

					J = true
					ar.CanResize = false
				end)
			end

			function ar.DisableTopbarButtons(H, J)
				for L, M in next, J do
					for N, O in next, ar.TopBarButtons do
						if O.Name == M then
							O.Object.Visible = false
						end
					end
				end
			end

			return ar
		end
	end
end
local ac = {
	Window = nil,
	Theme = nil,
	Creator = z.load("a"),
	LocalizationModule = z.load("b"),
	NotificationModule = z.load("c"),
	Themes = nil,
	Transparent = false,

	TransparencyValue = 0.15,

	UIScale = 1,

	Version = "0.0.0",

	Services = z.load("g"),

	OnThemeChangeFunction = nil,
}

local ae = game:GetService("HttpService")

local ai = ae:JSONDecode(z.load("h"))
if ai then
	ac.Version = ai.version
end

local aj = z.load("l")
local ak = ac.Services

local al = ac.Creator

local am = al.New
local an = al.Tween

local ao = z.load("p")

local ap = shared.ForcePlayerGui
local aq = 
not ap and v or (syn and syn.protect_gui) or function() end

local function SafeParentUI(ar: Instance, as: Instance | (() -> Instance))
	local at = pcall(function()
		if not as then
			as = b
		end

		local at
		if typeof(as) == "function" then
			at = as()
		else
			at = as
		end

		ar.Parent = at
	end)

	if not (at and ar.Parent) then
		ar.Parent = d.LocalPlayer:WaitForChild("PlayerGui", math.huge)
	end
end

local function ParentUI(ar: Instance, as: boolean?)
	if as then
		SafeParentUI(ar, b)
		return
	end

	pcall(v, ar)
	SafeParentUI(ar, x)
end
local ar = 
not ap and x and x() or (not ap and b or p:WaitForChild("PlayerGui"))

ac.ScreenGui = am("ScreenGui", {
	Name = "WindUI",
	IgnoreGuiInset = true,
	ScreenInsets = "None",
}, {
	am("UIScale", {
		Scale = ac.Scale,
	}),
	am("Folder", {
		Name = "Window",
	}),

	am("Folder", {
		Name = "KeySystem",
	}),
	am("Folder", {
		Name = "Popups",
	}),
	am("Folder", {
		Name = "ToolTips",
	}),
})
ParentUI(ac.ScreenGui)

ac.NotificationGui = am("ScreenGui", {
	Name = "WindUI/Notifications",
	IgnoreGuiInset = true,
})
ParentUI(ac.NotificationGui)

ac.DropdownGui = am("ScreenGui", {
	Name = "WindUI/Dropdowns",
	IgnoreGuiInset = true,
})
ParentUI(ac.DropdownGui)

al.Init(ac)

math.clamp(ac.TransparencyValue, 0, 1)

local as = ac.NotificationModule.Init(ac.NotificationGui)

function ac.Notify(at, au)
	au.Holder = as.Frame
	au.Window = ac.Window

	return ac.NotificationModule.New(au)
end

function ac.SetNotificationLower(at, au)
	as.SetLower(au)
end

function ac.SetFont(at, au)
	al.UpdateFont(au)
end

function ac.OnThemeChange(at, au)
	ac.OnThemeChangeFunction = au
end

function ac.AddTheme(at, au)
	ac.Themes[au.Name] = au
	return au
end

function ac.SetTheme(at, au)
	if ac.Themes[au] then
		ac.Theme = ac.Themes[au]
		al.SetTheme(ac.Themes[au])

		if ac.OnThemeChangeFunction then
			ac.OnThemeChangeFunction(au)
		end

		return ac.Themes[au]
	end
	return nil
end

function ac.GetThemes(at)
	return ac.Themes
end
function ac.GetCurrentTheme(at)
	return ac.Theme.Name
end
function ac.GetTransparency(at)
	return ac.Transparent or false
end
function ac.GetWindowSize(at)
	return Window.UIElements.Main.Size
end
function ac.Localization(at, au)
	return ac.LocalizationModule:New(au, al)
end

function ac.SetLanguage(at, au)
	if al.Localization then
		return al.SetLanguage(au)
	end
	return false
end

function ac.ToggleAcrylic(at, au)
	if ac.Window and ac.Window.AcrylicPaint and ac.Window.AcrylicPaint.Model then
		ac.Window.Acrylic = au
		ac.Window.AcrylicPaint.Model.Transparency = au and 0.98 or 1
		if au then
			ao.Enable()
		else
			ao.Disable()
		end
	end
end

function ac.Gradient(at, au, av)
	local aw = {}
	local ax = {}

	for ay, az in next, au do
		local aA = tonumber(ay)
		if aA then
			aA = math.clamp(aA / 100, 0, 1)
			table.insert(aw, ColorSequenceKeypoint.new(aA, az.Color))
			table.insert(ax, NumberSequenceKeypoint.new(aA, az.Transparency or 0))
		end
	end

	table.sort(aw, function(ay, az)
		return ay.Time < az.Time
	end)
	table.sort(ax, function(ay, az)
		return ay.Time < az.Time
	end)

	if #aw < 2 then
		error("ColorSequence requires at least 2 keypoints")
	end

	local ay = {
		Color = ColorSequence.new(aw),
		Transparency = NumberSequence.new(ax),
	}

	if av then
		for az, aA in pairs(av) do
			ay[az] = aA
		end
	end

	return ay
end

function ac.Popup(at, au)
	au.WindUI = ac
	return z.load("q").new(au)
end

ac.Themes = z.load("r")(ac)

al.Themes = ac.Themes

ac:SetTheme("Dark")
ac:SetLanguage(al.Language)

function ac.CreateWindow(at, au)
	local av = z.load("W")

	if not isfolder("WindUI") then
		makefolder("WindUI")
	end
	if au.Folder then
		makefolder(au.Folder)
	else
		makefolder(au.Title)
	end

	au.WindUI = ac
	au.Parent = ac.ScreenGui.Window

	if ac.Window then
		warn("You cannot create more than one window")
		return
	end

	local aw = true

	local ax = ac.Themes[au.Theme or "Dark"]

	al.SetTheme(ax)

	local ay = gethwid or function()
		return p.UserId
	end

	local az = ay()

	if au.KeySystem then
		aw = false

		local function loadKeysystem()
			aj.new(au, az, function(aA)
				aw = aA
			end)
		end

		local aA = au.Folder .. "/" .. az .. ".key"

		if not au.KeySystem.API then
			if au.KeySystem.SaveKey and isfile(aA) then
				local aB = readfile(aA)
				local aC = (type(au.KeySystem.Key) == "table") and table.find(au.KeySystem.Key, aB)
					or tostring(au.KeySystem.Key) == tostring(aB)

				if aC then
					aw = true
				else
					loadKeysystem()
				end
			else
				loadKeysystem()
			end
		else
			if isfile(aA) then
				local aB = readfile(aA)
				local aC = false

				for aD, aE in next, au.KeySystem.API do
					local aF = ac.Services[aE.Type]
					if aF then
						local aG = {}
						for aH, aI in next, aF.Args do
							table.insert(aG, aE[aI])
						end

						local aH = aF.New(table.unpack(aG))
						local aI = aH.Verify(aB)
						if aI then
							aC = true
							break
						end
					end
				end

				aw = aC
				if not aC then
					loadKeysystem()
				end
			else
				loadKeysystem()
			end
		end

		repeat
			task.wait()
		until aw
	end

	local aA = av(au)

	ac.Transparent = au.Transparent
	ac.Window = aA

	if au.Acrylic then
		ao.init()
	end

	return aA
end

return ac
