# DC Motor Analysis

Lab 1 (ELEE 2045): analyzes a DC motor's power characteristics across its speed range, implemented in both Python and MATLAB.

## What it does

Given a 5 V supply, 0.2 A stall current, and 0.05 A free-run current, the script sweeps motor speed from 0 to 5000 RPM and computes electrical power, mechanical power, and total power at each step, then plots the curves.

## Files

- `Problem1.py` - Python implementation (NumPy + Matplotlib)
- `problwem1.m` - MATLAB implementation

## Run

```bash
pip install numpy matplotlib
python Problem1.py
```
