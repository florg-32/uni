#import "@preview/zero:0.3.3": num, set-group, set-round
#set-group(size: 3, separator: ",")
#set-round(mode: "places", pad: false)

#set page(header: align(right)[
  Florian Guggi\
  11808200
])
#set text(font: "Helvetica")
#show heading.where(level: 1): it => [
  #line(length: 100%, stroke: .2pt)
  #it
]
#show heading.where(level: 2): set text(size: 12pt)
#set par(justify: true)

= P1
Given
- Unit cost = \$150
- Overall budget = \$4,000,000
- Component cost = 50% of unit cost

+ How many processors can you produce within the budget?
+ If an engineers salary is \$95,000, how many engineers can be hired using the fixed cost budget?

== Answer
+ $"budget" / "unit cost" = floor(4000000 / 150) = #calc.floor(4e6 / 150)$
+ #v(0.45em) $K_v = 0.5 dot 150 = \$75 \
  K_f = (C - K_v n)/(1 + 0.1 root(3, n)) = (4 dot 10^6 - 75 dot 26666)/(1+0.1 dot root(3, 26666)) = \$#num(501570.09)\
  "Engineers" = floor(K_f/95000) = 5$

= P2
Solve for $n$, $K_f = 1.2M, K_v = 60, C = 4M$

== Answer
After inserting and reordering into a cubic equation, $n = 7506$

= P3
A chip of 2.5 cm² is to be fabricated in a 28 nm process on 30 cm diameter wafers costing \$1800 each. The defect density is 0.5 defects/cm². Each wafer has an 85% utilization rate.
You plan to sell 2 million chips at \$25 per unit and the total project budget is \$35M.

+ What is the yield per chip?
+ How many good chips per wafer?
+ What is the maximum acceptable fixed cost (engineering budget)?

== Answer
#let W = calc.pi * calc.pow(30, 2) / 4
#let N = calc.floor((W * 0.85)/4.0)
#let y = 1 / calc.pow(2.5 * 0.5, 2)
#let good = N * y
#let cost_per_chip = 1800 / good
#let unit_cost = 35e6 / 2e6
#let component_cost = unit_cost * cost_per_chip / 25
#let prod_cost = 2e6 * cost_per_chip
#let fixed_cost = (35e6 - 2e6 * component_cost)/(1+0.1*calc.root(2e6, 3))

1. yield (assuming simplified model) $y = 1 / (("AD")^2) = #y$
2. #v(0.15em)$"wafer size W" = (pi dot 30^2)/4 =  #num(W)" cm"^2\
"chips per wafer N" = floor((W dot 0.85)/(2.5 "cm"^2)) = #N\
"good chips per wafer" = N dot y = #good$
3. #v(0.25em)$"cost per chip" = 1800/#good = \$#cost_per_chip\
"component cost" = #cost_per_chip / 25 = #(cost_per_chip / 25) = \$#(unit_cost * cost_per_chip / 25)\
K_f = (C - K_v n)/(1 + 0.1 root(3, n)) = \$#num(fixed_cost)$

= P4
Given
- $n = 20000 "units"$
- $K_f = \$#num(800000)$
- $K_v = \$45$

Calculate the target budget for the given volume.

== Answer
#let target_budget = 800e3 + (0.1 * 800e3) * calc.root(20e3, 3) + 45 * 20e3
$C = K_f + (0.1 dot K_f) root(3, n) + K_v n = \$#num(target_budget)$

= P5
Given
- $"unit sale price" = \$120$
- $K_f = \$#num(1e6)$
- $K_v = \$55$

Solve for the break-even unit volume $n$.

== Answer
$120n = #1e6 + 0.1 dot #1e6 dot root(3, n) + 55n$

$n = 82306$

= P6
Given
- defect density = 0.2/$"cm"^2$
- target yield = 0.8
- net dia area = 88 $"mm"^2$
- f = 0.13 μm

Estimate the available SRAM in bits in kB.

== Answer
#let f = 0.13e-6
#let rbe = 675 * calc.pow(f, 2)
#let area_rbe = 88e-6/rbe
#let sram_bits = calc.floor(area_rbe / 0.6)
#let sram_kb = sram_bits / 8 / 1024

$"rbe" = 675 dot f^2\
"A"_("rbe") = (0.088 mu m^2)/(675 dot f^2) = #num(area_rbe)\
"SRAM bits (0.6 rbe)" = A_("rbe") / 0.6 = #num(sram_bits) "bits" = #num(sram_kb) "kB"
$

= P7
SoC includes 4 RISC-V cores (16kB cache, 32kB memory each), 2 DSPs (64kB cache, 128kB memory each).
Net area = 3500 A; interconnect = 600 A; rbe = 0.6 (Bitcell efficiency (rbe) = 0.6 Each bit = 0.6 rbe); 1 kB = 1481 bits.

+ Compute total SRAM area used.
+ How many A-units are left for logic?
+ If one DSP is removed, how many RISC-V cores can be added?
+ With ARM Cortex-M (24kB cache, 64kB memory), what is total SRAM?

== Answer
#let risc_sram = 4 * 48 + 2 * 192
#let bits = risc_sram * 8 * 1024
+ $4 dot 48 + 2 dot 192 = #risc_sram "kB"$
+ $3500 - 600 - #risc_sram * 8 * 1024 * 0.6 / 1481 = #num(3500 - 600 - bits * .6 / 1481) "A"$
+ This is not possible to answer without further information on how much area a RISC-V core or DSP occupies. While their respective SRAM will probably dominate, we would need to know what kind of RISC-V core and DSP we are talking about (fp units? vector extension? what DSP? ...)
+ The same applies as for 3., we would need information on what Cortex-M we are talking about (M0, M4+, M55, FPU?, Helium SIMD?, ...)

= P8
Given
- Wafer size = 150 cm²
- Defect density = 0.8 defects/cm²
- Die area = 75 mm²
- Yield model: $Y = e^(-A · D)$, with A in cm²
- Wafer cost = \$2000
- Component cost = \$300

1. Calculate the number of total dies per wafer.
2. Estimate the yield.
3. Determine the number of functional (good) dies per wafer.
4. Calculate the manufacturing cost per working die.

== Answer
#let wafer = 150
#let area = 75
#let N = wafer * 100 / area
#let defects = 0.8
#let yield = calc.exp(-area / 100 * defects)
#let good_dies = calc.floor(N * yield)
#let cost_per_die = 2000 / good_dies

1. $N = (150 "cm"^2)/(75 "mm"^2) = #N$
2. $Y = #num(yield)$
3. $"good dies" = floor(N dot Y) = #good_dies$
4. $"cost per die" = 2000 / N = \$#num(cost_per_die)$

= P9
Given
- Process node: 130 nm → f = 0.13 μm
- Net die area: 80 mm² (after guard band)
- Normalized area A = 80 / (10^6 × (0.13×10^-3)^2) ≈ 4730 A-units
- Core logic + control area = 2200 A-units
- RBE (bitcell efficiency) = 0.6
- rbbe = 1481 bits/A-unit

Estimate available SRAM in bits and kB

== Answer
#let area = 4730 - 2200
#let sram_bits = area * 1481 / 0.6
#let sram_kb = sram_bits / 8 / 1024

Available area $= 4730 - 2200 = #area "A"$

$"SRAM" = (area dot 1481)/0.6 = #num(sram_bits) "bits" = #num(sram_kb) "kB"$

= P10
A CPU runs at 2 GHz, its prototype on FPGA runs at 200 MHz. You are designing:
- 1-way cache = 1 cycle
- 2-way cache = 1.5× 1-way latency
- 4-way = 2× latency

1. What are access latencies for 2-way and 4-way caches (in cycles)?
2. What is the largest cache size if you want access latency ≤ 2 CPU cycles?

== Answer
????

= P11
You need 20 GB/s bandwidth with DDR4 \@ 3200 MT/s. Each I/O transfers 1 bit per cycle.

How many I/O pins are needed?

== Answer
#let bps = 20 * calc.pow(2, 30) * 8
20 GB/s $= #num(bps) "bits/s" (dot 8 dot 2^30) = 8 dot n dot 3200 dot 10^6, n = #calc.ceil(bps / 8 / 3200 / calc.pow(10, 6))$
