# SIR Epidemic Simulation (EVD in West Africa)

This project simulates the spread of **Ebola Virus Disease (EVD)** using the classic **SIR model** in the Julia programming language. It is based on real-world data from the 2014 outbreak in West Africa and demonstrates how epidemic dynamics can be modeled using simple differential equations.

---

## Project Highlights

- Discrete-time implementation of the SIR model  
- Realistic epidemic curve simulation over 610 days  
- High-quality plots using the `Plots.jl` package  
- Interactive parameter tuning: infection rate (λ), recovery rate (γ), and population sizes  
- Optional GIF animation of the epidemic curve  
- Beginner-friendly for those learning Julia, modeling, and plotting

---

## Model Overview

The SIR model divides the population into:

- `S(t)` → Susceptible individuals  
- `I(t)` → Infected individuals  
- `R(t)` → Removed (recovered or deceased)

The model follows these update rules:

```math
S(t+1) = S(t) - λ·S(t)·I(t)·dt  
I(t+1) = I(t) + λ·S(t)·I(t)·dt - γ·I(t)·dt  
R(t+1) = R(t) + γ·I(t)·dt
````

---

## Parameters

| Parameter | Description                      | Default Value |
| --------- | -------------------------------- | ------------- |
| `S0`      | Initial susceptible population   | `100_000`     |
| `I0`      | Initial infected individuals     | `20`          |
| `R0`      | Initial removed individuals      | `0`           |
| `γ`       | Recovery rate (1 / avg days ill) | `1/8`         |
| `λ`       | Infection rate                   | `1.47e-6`     |
| `dt`      | Time step (in days)              | `1.0`         |
| `Tf`      | Total simulation time (days)     | `610.0`       |

---

## Dependencies

Install these Julia packages before running the script:

```julia
using Pkg
Pkg.add("Plots")
Pkg.add("GR")          # Recommended backend
```

For animation support (optional):

```julia
Pkg.add("Plots")
```

---

## How to Run

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/ebola-sir-model-julia.git
   cd ebola-sir-model-julia
   ```

2. **Run the simulation** in Julia:

   ```julia
   include("sir_simulation.jl")
   ```

3. **Modify** `S0`, `λ`, `γ`, `I0`, and `Tf` to test different scenarios.

---

## Sample Output

The simulation will generate a population vs. time plot:

![sir_model_africa](https://github.com/user-attachments/assets/20261930-9d8e-49a6-8d8d-bc7b529546ea)

You can also generate a GIF animation by uncommenting the animation section in the script.


