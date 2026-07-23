# MODBUS 360 - The Ultimate Industrial Modbus Client

![MODBUS360 Header](header.png)

[![Version](https://img.shields.io/badge/version-1.3.0-blue?style=for-the-badge)](https://github.com/lunasoft-llc/modbus360/releases)
[![.NET](https://img.shields.io/badge/.NET-9.0-purple?style=for-the-badge)](https://dotnet.microsoft.com/download)
[![Platform](https://img.shields.io/badge/platform-Windows%20|%20Linux%20|%20macOS-brightgreen?style=for-the-badge)](https://github.com/lunasoft-llc/modbus360/releases)

---

**MODBUS 360** is a high-performance industrial utility designed for real-time data monitoring and control. Engineered for low latency and high-stress environments, it provides engineers with a seamless way to visualize and interact with Modbus devices.

## ✨ Key Features

### 🚀 Performance & Core
- **Optimized Distribution**: Native AOT on Windows and trimmed self-contained packages on Linux and macOS.
- **Multi-Protocol Support**: Full support for **Modbus TCP/IP**, **Modbus RTU (Serial)**, and **RTU over TCP**.
- **Low Latency Engine**: Optimized for high-frequency polling with smart register grouping.
- **Cross-Platform**: Builds for Windows x64, Linux x64, and macOS Apple Silicon/Intel.

### 📊 Advanced Value Scaling & Data Types
Transform raw register values into meaningful engineering units using our built-in scaling engine:
- **Formula**: `Scaled Value = (Raw Value × Multiplier) + Offset`
- **Use Cases**: Degree Celsius conversion, Pressure scaling, Flow rate calculation.
- **Precision Control**: Configurable decimal places for clean data visualization.
- **Multi-Type Support**: Int16, UInt16, Int32, UInt32, Float32, Double, Boolean (Coil), Hex.
- **Byte Order Selection**: Full control over 32-bit word byte order for cross-vendor compatibility:
  - `ABCD` — Big Endian (standard Modbus)
  - `CDAB` — Byte Swap
  - `BADC` — Word Swap
  - `DCBA` — Little Endian (reversed)

### 🖥️ Modbus Slave (Server) Mode
Run MODBUS 360 as a **Modbus TCP Server**, allowing PLCs, HMIs, or other clients to connect and read/write your data:
- **Configurable Port & Unit ID** — default port 502, fully editable.
- **4 Data Tables**: Coils, Discrete Inputs, Input Registers, Holding Registers — each with 100 pre-initialized addresses (0–99).
- **Live Sync**: Client writes are instantly reflected in the UI register table.
- **Real-time Traffic Log**: Green-on-black console showing server lifecycle events and client activity.
- **Client Count**: Live display of the number of connected Modbus clients.
- **Start/Stop Controls**: One-click server start and graceful shutdown.

### 🎨 Next-Gen User Interface
- **Premium Aesthetics**: Clean, modern dark theme with acrylic blur and glassmorphism.
- **Live Charts**: Real-time trend visualization powered by LiveCharts 2.0.
- **Smart Empty State**: When no registers are configured, a premium overlay with a direct **"ADD REGISTER"** call-to-action guides the user.
- **Auto-Close Connection Dialog**: The connection modal automatically dismisses once a connection is successfully established.
- **Interactive DataGrid**:
    - **Resizable Columns**: Customize your view by dragging column borders.
    - **Smart Tooltips**: Instant help on every column (Addresses, Types, Formulas).
    - **Hex/Decimal Toggle**: Switch between raw communication and processed data seamlessly.

### 🗂️ Custom Dashboard
Create a fully personalized control panel with live indicators and action buttons:
- **Value Indicators**: Display live register values with label, address, unit, and data type.
- **Action Buttons**: One-click write commands for any Modbus Function Code (FC05, FC06, FC15, FC16).
- **Edit Mode with Grid Snap**: Drag and resize dashboard widgets — all movement snaps to a 50×50 px grid for perfect alignment, with a subtle dot-grid background in edit mode.
- **View / Edit Mode Split**: A clean view mode shows live values in a responsive wrap grid; edit mode switches to the draggable canvas layout.
- **Preset Export / Import (`.m360`)**: Save the entire dashboard layout to a `.m360` file and share it between machines or team members. Import presets with a single click.
- **Layout Management**: Save and load multiple named dashboard layouts per device profile.
- **Reset Layout**: Clear all widgets and start fresh.

### 🔍 Discovery & Diagnostics
- **Network Scanner**: Deep discovery of active registers across address ranges.
- **Device Finder**: Automatically detect slave IDs (1-247) on your network.
- **Traffic Sniffer**: Monitor low-level packet communication for troubleshooting.
- **Profile Management**: Save and load complex device configurations instantly.

## 📦 Installation

### Windows (Recommended)
Download and run the **[Modbus360_Setup.exe](https://github.com/lunasoft-llc/modbus360/releases)** for a professional installation experience with a desktop shortcut and administrative register control.

### Portable Versions
We provide self-contained portable packages for Windows, Linux, and macOS. No separate .NET runtime installation is required.

- [Latest Releases](https://github.com/lunasoft-llc/modbus360/releases)

### macOS App and DMG

The macOS workflow produces separate packages for Apple Silicon and Intel:

- `Modbus360-macOS-Apple-Silicon-*.dmg`
- `Modbus360-macOS-Intel-*.dmg`

#### Option 1: One-Line Terminal Installer (Recommended & Easiest)
Since the app is unsigned, macOS Gatekeeper blocks it by default. To install and run it automatically without any security warnings, open your **Terminal** and run:

```bash
curl -sL https://raw.githubusercontent.com/lunasoft-llc/modbus360/main/install.sh | bash
```

#### Option 2: Manual Installation
Open the correct DMG and drag `Modbus360.app` to Applications. Since current packages are unsigned, if macOS says the app is damaged or cannot be opened, run this command in your Terminal to remove the Gatekeeper quarantine flag:

```bash
xattr -cr /Applications/Modbus360.app
```
Then, Control-click the app and choose **Open**.

Maintainers can create the packages on macOS with:

```bash
chmod +x ./build-osx.sh
./build-osx.sh --version 1.3.0
```

The **Build macOS App and DMG** GitHub Actions workflow creates the same files
as downloadable workflow artifacts.

## 🛠️ Technical Stack

- **Framework**: .NET 9.0 (Native AOT or trimmed self-contained, depending on platform)
- **UI Architecture**: Avalonia UI 11.3 (MVVM)
- **Communication**: FluentModbus 5.3
- **Visualization**: LiveChartsCore 2.0
- **UI Logic**: CommunityToolkit.Mvvm

## 📞 Support

**Developed by**: [LUNASOFT INDUSTRIAL SYSTEMS](https://www.lunasoft.az)  
**Location**: Baku, Azerbaijan  
**Email**: [support@lunasoft.az](mailto:support@lunasoft.az)

---

© 2024-2025 **LUNASOFT INDUSTRIAL SYSTEMS**. All rights reserved.
Protected under Proprietary License.
