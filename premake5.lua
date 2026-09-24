project "Skia"
	location "%{wks.location}/Tethys/vendor/skia-build"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"

	warnings "Off"

	targetdir ("%{outputdir}/%{prj.name}")
	objdir ("%{intermediatesdir}/%{prj.name}")

	files
	{
		"include/**/*.h",
		"src/core/**.h",
		"src/core/**.cpp",
		"src/pathops/**.h",
		"src/pathops/**.cpp",
		"src/ports/SkGlobalInitialization_default.cpp",
		"src/ports/SkLog_win.cpp",
		"src/ports/SkMemory_malloc.cpp",
		"src/ports/SkOSFile_stdio.cpp",
		"src/ports/SkOSFile_win.cpp",
		"src/utils/SkLogHandler.cpp"
	}

	includedirs
	{
		".",
		"include",
		"src",
		"modules/skcms"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS",
		"SKIA_IMPLEMENTATION=1"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
		optimize "Off"

	filter "configurations:Release"
		runtime "Release"
		symbols "On"
		optimize "On"

	filter "configurations:Dist"
		runtime "Release"
		symbols "Off"
		optimize "Speed"
