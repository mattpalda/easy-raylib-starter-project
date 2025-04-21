# 🕹️ Raylib C++ Project Generator

Easily create new Raylib-based C++ projects with Visual Studio / JetBrains Rider support using this customizable template and batch script.
Raylib version 5.5

---

## 📦 What's Included

- A complete Visual Studio C++ project pre-configured for Raylib (static linking)
- Raylib include & lib folders embedded in the template
- A reusable `.bat` script that copies and renames the project for quick starts
- Paths set using Visual Studio macros for portability
- Automatically updates `.sln`, `.vcxproj`, and `.filters` filenames and contents

---

## 🛠️ How This Template Was Made

This template was created using a standard Visual Studio C++ project.

- Raylib's `include/` and `lib/` folders were downloaded and added manually.
- In Visual Studio:
  - The **include path** and **library path** were added using `$(ProjectDir)` macros.
  - This ensures the project can be copied or moved anywhere on your system and will still work.
- The project uses **static linking**, so you'll only need to include the required `.dll` if needed.

---

## 🚀 How to Use

1. Open **Command Prompt**, **PowerShell**, or any terminal
2. Run the script like this:

```
.\create-raylib-project.bat MyAwesomeGame
```

> 🔁 Replace `MyAwesomeGame` with your new project's name

3. This will generate a new folder:
```
MyAwesomeGame/
├── MyAwesomeGame.sln
├── MyAwesomeGame.vcxproj
├── main.cpp
├── _deps/raylib
```

4. Open the new `.sln` file in **Visual Studio 2022** or **JetBrains Rider**
5. Build and run!

---

## 📁 Folder Structure

```
📦 RaylibTemplate/
├── RayLibGameTest.sln             ← Template project
├── RayLibGameTest.vcxproj
├── main.cpp
├── _deps/                        ← Includes + libs
│   ├── raylib/
│   	└── include/
│		└── lib/
```

---

## ⚙️ Requirements

- Windows + Visual Studio 2022 or JetBrains Rider (C++ workload)
- Raylib compiled `.lib` and `.dll` (already included)
- No need for CMake

---

## 🧼 Optional Cleanup

You can delete these from the generated folder if not needed:

- `.vcxproj.filters` — just controls folder view in Solution Explorer
- `.vcxproj.user` — stores per-user debug settings (auto-regenerated)

---

## 💡 Pro Tip

Make a `.zip` of the whole `RaylibTemplate/` + script and keep it somewhere safe. You'll never need to set up Raylib from scratch again.
