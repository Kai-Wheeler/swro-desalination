# Project log

Self-directed chemical engineering project: designing a seawater reverse osmosis desalination plant in MATLAB and Simulink. One entry per session, newest at the bottom.

## 2026-10-23 — Week 1, Session 1 (1 hour)

**Did:** read the Session 1 lesson on thermal vs. RO desalination and worked both examples (kettle heating, Sydney plant energy). Set up a My answers tab for my work.

**Confused by / asked about:**

- How MSF and MED differ. Both use chambers at falling pressure; MSF uses the steam's heat to preheat incoming seawater, while MED uses it to boil seawater in the next effect.
- kJ vs. kWh. Both are energy; 1 kWh = 3,600 kJ. kW is power (a rate) and kWh is energy (a total).
- Why a kWh of low-temperature waste heat is worth less than a kWh of electricity. Heat can only partly become work (the Carnot limit), so 70 °C heat is worth at most about 13% of its value as electricity.

**Decisions / assumptions:** seawater = 35,000 mg/L for the whole project. Drinking water limit = 500 mg/L TDS.

**Next:** Session 1 self-check and Assignment 1.

## 2026-10-23 — Week 1, Assignment 1 and revisions (15 minutes)

**Did:** did the Session 1 self-check and wrote Assignment 1. Graded 6.5/10, then revised twice to reach 8/10.

**Learned from feedback:**

- Back claims with numbers, and give every number its full unit: kWh/m³, not just kWh.
- The energy figures are already per m³ of fresh water, so using recovery to argue about energy counts it twice. Recovery matters for a different reason: a smaller intake, less pretreatment and less harm to marine life.
- Recovery and efficiency mean different things. Recovery = share of seawater that becomes fresh water; efficiency usually refers to energy.
- Round at the end, not the start: the minimum salt removal is 98.6%, not 99%.

**Confused by:** nothing

**Next:** Assignment 2 (energy to boil 1 m³), then Session 2.

## 2026-10-23 — Week 1, Assignment 2 (15 minutes)

**Did:** worked out the energy to boil 1 m³ of seawater: about 93 kWh/m³ to heat it to 100 °C plus about 628 kWh/m³ to turn it into steam, about 720 kWh/m³ in total, roughly 200× an RO plant. Graded 7.5/10. This finishes Session 1.

**Learned from feedback:**

- The phase change (latent heat) is about 87% of the energy needed to boil seawater.
- MED gets the latent heat back when steam condenses and reuses it to boil seawater in the next effect, about 15–20 times over. That brings 720 kWh/m³ down to about 40 kWh/m³.
- Every written step should match the math: 334 kJ is for 1 kg, but 1 m³ is 1,000 kg.

**Decisions / assumptions:** from now on, grading focuses on understanding the concepts; sig figs, rounding and small differences in constants don't count.

**Confused by:** nothing

**Next:** Session 2 — inside an RO plant.

## 2026-11-08 — Topic 1, Session 2 (1 hour)

**Did:** read Session 2, Inside an RO plant: the seven units of the plant, plus recovery, salt rejection and brine salinity. Answered the Session 2 self-check, then did Assignment 3 (stream sizing for 25,000 m³/day of feed making 10,000 m³/day of permeate). Graded 9.5/10.

**Learned / asked about:**

- The membrane removes water, not salt. The seawater left on the feed side keeps its salt in less water, so it gets saltier element by element and ends up as brine.
- Antiscalant is dosed into the feed water at the end of pretreatment, before the high-pressure pump, so minerals don't crust onto the membranes.
- Membranes are packaged as sheets → elements → pressure vessels (6–8 elements) → trains, with one high-pressure pump per train.
- Pressure isn't conserved; energy is. The ERD moves pressure energy from the brine to the incoming seawater.
- Pretreatment chlorine is removed to protect the membranes; post-treatment chlorine stays in at low levels to keep the water safe in the city's pipes.
- The brine shortcut is fine when rejection is high; its error is about recovery × (1 − rejection), about 0.1% for seawater RO.

**Decisions / assumptions:** removed the plant sketch from Assignment 3 to focus on the math.

**Confused by:** *anything still unclear*

**Next:** Session 3, Balances and osmotic pressure. Setup moved to Session 5, after the rest of the background.

## 2026-11-18 — Topic 1, Session 3 (*time spent*)

**Did:** read Session 3, Balances and osmotic pressure, and answered the self-check. Did Assignment 4: the water and salt balance and osmotic pressures for a 50% recovery plant. Graded 6.5/10; Claude wrote the fix for part 6.

**Learned / asked about:**

- Material balances in four ideas: system boundary, basis (the amount you choose to calculate on), in = out for water and for salt, and degrees of freedom.
- 1 mg/L = 1 g/m³, so m³/day × mg/L gives grams of salt per day directly.
- Osmotic pressure works like the ideal gas law: it depends on how many dissolved particles there are, and NaCl counts twice because it splits into two ions. That's about 0.85 bar per 1,000 mg/L; real seawater pulls back about 10% less because the ions interact.
- The pump has to beat the brine's osmotic pressure, not the seawater's. At 60 bar the highest possible recovery is about 50%.
- The MATLAB model will start with the ideal equation so it matches the check values; a correction for non-ideal behavior can come in Topic 4.

**Decisions / assumptions:** treat all the salt as NaCl at 25 °C. Moved setup to Session 5, after the rest of the background.

**Confused by:** *anything still unclear*

**Next:** Session 4, Pump energy and the membrane.

## 2026-11-19 — Topic 1, Session 4 (*time spent*)

**Did:** read Session 4, Pump energy and the membrane. Did Assignment 5: energy with and without energy recovery, and flux, for the 50% recovery plant at 68 bar. Graded 8/10. Claude answered the self-check.

**Learned / asked about:**

- Pressure is stored energy: 1 bar × 1 m³ = 100 kJ = 0.0278 kWh.
- Energy recovery doesn't change how much energy is stored in the water. It recycles the brine's pressure, so less has to be supplied from the grid: 2.19 vs. 4.63 kWh/m³, 53% less.
- With energy recovery, energy depends mostly on pressure. Without it, energy falls as recovery rises.
- The recovery trade-off: higher recovery needs more pressure and energy; lower recovery means more seawater to pull in and pretreat. Finding the cheapest point is the project question.
- Water flux falls along a pressure vessel because the feed side gets saltier: 30 to 6 L/(m²·h) at 45% recovery and 60 bar.
- The 60 bar design pressure comes from real plants, checked against the 53.9 bar the brine pulls back with.

**Decisions / assumptions:** 60 bar design pressure for the 45% base case; 80% pump efficiency; energy recovery device 96% efficient.

**Confused by:** *anything still unclear*

**Next:** Session 5, Setup.

