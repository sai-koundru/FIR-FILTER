# FIR-FILTER

# 🧮 FSM-Based 40-Tap FIR Filter in Verilog

This project implements a **Finite State Machine (FSM)-based 40-tap FIR (Finite Impulse Response) filter** using Verilog. It models the behavior of a digital FIR filter broken into logical stages and demonstrates sequential data processing over multiple clock cycles.

---

## 🚀 Features

- ✅ 40-tap FIR filter using an FSM approach
- ✅ Modular design with clean separation of input, tap multiplication, and summation stages
- ✅ Simulated input signal: 40 cycles of pulse followed by 200 cycles of zero
- ✅ Easily expandable and educational architecture
- ✅ Includes testbench (`tb_fir_filter_40.v`) for functional verification

---

## 📂 Project Files

| File Name             | Description                                     |
|----------------------|-------------------------------------------------|
| `fsm_fir_filter_40.v`| Verilog implementation of FSM-based FIR filter  |
| `tb_fir_filter_40.v` | Testbench to simulate and validate filter logic |

---

## 🧠 FSM Architecture

The FSM consists of **three states**:

| State   | Function                                 |
|---------|------------------------------------------|
| `PAST`  | Collects the 40 most recent input samples|
| `TAPS`  | Multiplies each sample with a coefficient|
| `SUM`   | Adds all 40 products to produce the output|

---

## 🔁 Data Flow Summary

1. **Input Generation**:
   - For the first 40 clock cycles: `din = 8'd100`
   - Next 200 clock cycles: `din = 8'd0`
   - This mimics a rectangular pulse signal

2. **Filter Logic**:
   - Each input sample is saved in an array `x[0:39]`
   - Each saved sample is multiplied by a constant coefficient `b = 8'd100`
   - All products are summed to form the output `dout`

---

## 📊 Simulation & Waveform

To run the simulation using Icarus Verilog:

```bash
iverilog -o fir_sim fsm_fir_filter_40.v tb_fir_filter_40.v
vvp fir_sim
