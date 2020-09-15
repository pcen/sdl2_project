workspace "SpaceProject"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release"
	}

project "SpaceProject"
	location "."
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/")
	objdir ("bin/obj/")

	pchheader "stdafx.h"
	pchsource "stdafx.cpp"

	files
	{
		"./**.cpp",
		"./**.hpp",
		"./**.h",
		"./glad/src/glad.c"
	}

	includedirs
	{
		"./src",
		"./",
		"./glad/include/glad",
		"./glad/include" -- glad.h includes "KHR/khrplatform.h"
	}

	defines
	{
	}

	-- Ignore precompiled headers for .c files
	filter "files:**.c"
		flags {"noPCH" }

	filter "system:windows"
		systemversion "latest"

		includedirs
		{
			"C:/Libs/SDL2-2.0.12/include"
		}
		libdirs
		{
			"C:/Libs/SDL2-2.0.12/lib/x64"
		}
		links
		{
			"SDL2.lib",
			"SDL2main.lib",
			"opengl32.lib"
		}

	filter "configurations:Debug"
		defines "BUILD_DEBUG"
		symbols "on"

	filter "configurations:Release"
			defines "BUILD_RELEASE"
			optimize "on"
