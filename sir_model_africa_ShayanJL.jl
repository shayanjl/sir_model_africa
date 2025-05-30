# =======================================================
# SIR Model: Simulation of West African EVD Epidemic
# =======================================================

#  Import necessary packages
using Plots
using Printf
gr()  # Set GR as backend for plotting

# -------------------------------------------------------
# Define Parameters (adjust these to simulate different scenarios)
# -------------------------------------------------------
λ = 1.47e-6    # Infection rate (lambda)
γ = 1 / 8      # Recovery rate → avg duration of illness = 8 days
dt = 1.0       # Time step (in days)
Tf = 610.0     # Total time (days to simulate)
n = Int(Tf / dt)  # Number of simulation steps

# -------------------------------------------------------
# Initial Population Values (modify to explore different cases)
# -------------------------------------------------------
S0 = 1e5       # Susceptible individuals at t=0
I0 = 20        # Infected individuals at t=0
R0 = 0         # Removed individuals at t=0

# -------------------------------------------------------
# Create time vector and result matrix
# -------------------------------------------------------
timevec = collect(0:dt:Tf)
resultvals = Array{Float64}(undef, n+1, 3)  # [S, I, R] for each time point
resultvals[1, :] .= [S0, I0, R0]

# -------------------------------------------------------
# Function to update the SIR state for one time step
# -------------------------------------------------------
function updateSIR(popn)
    S, I, R = popn
    newS = S - λ * S * I * dt
    newI = I + λ * S * I * dt - γ * I * dt
    newR = R + γ * I * dt
    return [newS, newI, newR]
end

# -------------------------------------------------------
# Run the Simulation Loop
# -------------------------------------------------------
for i in 1:n
    resultvals[i+1, :] .= updateSIR(resultvals[i, :])
end

# -------------------------------------------------------
# Plot the Final Results
# -------------------------------------------------------
plot(timevec, resultvals,
    title = "SIR Epidemic Simulation (EVD in West Africa)",
    xlabel = "Time (Days)",
    ylabel = "Population",
    label  = ["Susceptible" "Infected" "Removed"],
    lw = 2,
    legend = :topright,
    size=(800, 500),
    grid = true
)

# -------------------------------------------------------
# BONUS: Animated GIF (Optional, enable if needed)
# -------------------------------------------------------
# using Plots; anim = @animate for i in 1:10:n+1
#     plot(timevec[1:i], resultvals[1:i, 1], label="S", lw=2)
#     plot!(timevec[1:i], resultvals[1:i, 2], label="I", lw=2)
#     plot!(timevec[1:i], resultvals[1:i, 3], label="R", lw=2)
#     xlabel!("Day")
#     ylabel!("Population")
#     title!("SIR Simulation Over Time")
# end
# gif(anim, "sir_simulation.gif", fps=10)
