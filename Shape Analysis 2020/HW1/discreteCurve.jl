module DiscreteCurve

export DiscreteCurve

using LinearAlgebra
using GLMakie
using Plots

using LinearAlgebra
using SplitApplyCombine

GLMakie.activate!()

# Sample Lissajous curve
a = 4
b = 2
delta = pi / 3
n = 300
h = 0.01

t = range(0, stop=2 * pi, length=n)
x = sin.(a .* t .* delta)
y = sin.(b .* t)

#spaces = horizontal concatenation as columns
xy = [x y]

function unit(v::Vector{Float64})::Vector{Float64}
    v ./ norm(v)
end

function problem2cd()
    ## Problem 2(c)
    n = length(x)
    u = zeros(n - 2)
    v = zeros(n - 2)
    ### YOUR CODE HERE TO COMPUTE GRADIENT ###
    #print( " n = ", n)
    result_mat = [unit(xy[i, :] - xy[i+1, :]) + unit(xy[i, :] - xy[i-1, :]) for i in range(2, n - 1)]
    #print("shape ", size(result_mat), "first entry = ", result_mat[1])

    u, v = invert(result_mat)
    ### END HOMEWORK PROBLEM ###
    strength = vec(sqrt.(u .^ 2 .+ v .^ 2))

    # Plot curve and gradient vectors
    fig1, ax1, plt1 = lines(x, y, linewidth=3, color=:red, figure=(resolution=(1000, 1000),))
    arrows!(x[2:end-1], y[2:end-1], u, v, arrowsize=10, lengthscale=4, arrowcolor="black", linecolor="blue")
    display(fig1)

    #savefig("prob2c.png")

    #savefig()4

    ## Problem 2(d)
    kappa = zeros(n - 2)
    ### YOUR CODE HERE TO COMPUTE KAPPA ###
    kappa = norm.(result_mat)
    #print(size(kappa))
    #print(kappa[3:5])
    lengths = [(norm(xy[i, :] - xy[i+1, :]) + norm(xy[i, :] - xy[i-1, :])) / 2.0 for i in range(2, n - 1)]
    kappa = kappa ./ lengths




    ## END HOMEWORK PROBLEM ###

    curvcolor = [kappa[1]; kappa; kappa[end]]
    fig2, ax2, plt2 = lines(x, y, linewidth=4, color=curvcolor, figure=(resolution=(1000, 1000),))
    cbar = Colorbar(fig2, plt2)
    cbar.width = 30
    fig2[1, 1] = ax2
    fig2[1, 2] = cbar
    display(fig2)


    #print("minimum and maximum = ", minimum(kappa), "     ", maximum(kappa))
end


function problem2e(h=h)
    ## Problem 2(e)
    t0 = 0
    t1 = pi * 1.25
    nsamples = 300
    # Modify nsteps if your method does not converge
    nsteps = 50000

    # We provide a few examples of curves to try
    # curveFunction(t) = [cos(t)-cos(3*t).^3 sin(t)-sin(3*t).^3]
    # curveFunction(t) = [cos(t) sin(t)]
    curveFunction(t) = [t (t .- t0) .* (t1 .- t)]
    curve = vcat(curveFunction.(range(t0, stop=t1, length=nsamples))...)


    fig = Figure(resolution=(1000, 1000))
    ax = Axis(fig[1, 1])

    orig = lines!(ax, Point2f.(eachrow(curve)), linewidth=3, color=:crimson, label="Original")

    dispcurve = Observable(Point2f.(eachrow(curve)))
    final = lines!(ax, dispcurve, linewidth=3, color=:forestgreen, label="Final")

    Legend(fig[1, 2], [orig, final], ["Original", "Final"], labelsize=45)


    #fig, ax, plt = lines(dispcurve, linewidth=3, figure=(resolution=(1000, 1000),))
    display(fig)
    for i = 1:nsteps
        ### YOUR CODE HERE TO PERFORM GRADIENT DESCENT ###
        diff = reduce(hcat, [unit(a - b) for (a, b) in zip(eachrow(curve[2:nsamples, :]), eachrow(curve[1:nsamples-1, :]))])'
        curve[2:nsamples-1, :] -= [h * (diff[i-1, j] - diff[i, j]) for i in range(2, nsamples - 1), j in range(1, 2)]
        ### END HOMEWORK PROBLEM ###    
        sleep(1 / 32)
        if i % 1000 == 0
            dispcurve[] = Point2f.(eachrow(curve))
        end
    end

    save("problem2e.png", fig)
end







problem2e()



end