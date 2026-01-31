# I²C EEPROM Interface – FPGA Design using Vivado

This repository contains the design and implementation of an **I²C EEPROM interface** using **Verilog HDL** in **Xilinx Vivado**.  
The project demonstrates how an FPGA communicates with an external EEPROM memory device using the I²C protocol.

---

## 📌 Overview

I²C (Inter-Integrated Circuit) is a two-wire serial communication protocol widely used for low-speed peripheral interfacing.  
EEPROM devices connected via I²C are commonly used for non-volatile data storage.

In this project, the FPGA acts as an **I²C Master** and performs:
- EEPROM write operations
- EEPROM read operations
- Addressed memory access

---

## ⚙️ Features

- I²C Master implementation
- Supports EEPROM read and write operations
- START and STOP condition generation
- ACK/NACK handling
- Byte-level data transfer
- Synthesizable Verilog design
- Compatible with Vivado and FPGA boards

---

## 🔌 I²C Signals

| Signal | Direction | Description |
|------|-----------|-------------|
| clk  | Input  | System clock |
| rst  | Input  | Active-high reset |
| scl  | Output | I²C serial clock |
| sda  | Inout  | I²C serial data line |

---

## 📐 I²C EEPROM Operation

1. FPGA generates a **START condition**
2. Sends EEPROM device address and R/W bit
3. Sends memory address inside EEPROM
4. Performs data write or read
5. Receives ACK/NACK from EEPROM
6. Generates a **STOP condition**

All timing follows standard I²C specifications.

---

## 🛠️ Tools Used

- **Xilinx Vivado**
- **Verilog HDL**
- **Basys 3 / Artix-7 FPGA**
- **I²C EEPROM (e.g., 24xx series)**

---

## 🧪 Simulation

Simulation verifies:
- Correct START and STOP conditions
- Proper SDA and SCL timing
- EEPROM acknowledge response
- Successful data read/write cycles

Simulation can be performed using **Vivado Simulator**.

---
